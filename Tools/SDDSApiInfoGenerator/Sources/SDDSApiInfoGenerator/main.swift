import Foundation

// MARK: - Разбор аргументов

func argValue(_ name: String, in args: [String]) -> String? {
    guard let index = args.firstIndex(of: name), index + 1 < args.count else { return nil }
    return args[index + 1]
}

let args = Array(CommandLine.arguments.dropFirst())

if args.contains("--help") || args.contains("-h") {
    print("""
    sdds-api-info — генератор ios-api-meta.json (агрегатор API стилей).

    Опции:
      --sources <dir[,dir...]>  Каталоги исходников для скана (default: SDDSComponents/Sources)
      --props   <dir>           Каталог *Props для сверки config-id (default: DesignSystemBuilder/DesignSystemBuilderCore/Model/Props; "" — выключить)
      --output  <file>          Куда писать JSON (default: stdout)
      --module  <name>          Имя модуля для qualifiedName (default: SDDSComponents)
      --only    <A,B,...>       Ограничить набор компонентов (по имени компонента или типа)
      --report                  Печатать диагностику сверки (matched/gaps/drift) в stderr
      --help                    Показать справку
    """)
    exit(0)
}

let sourcesArg = argValue("--sources", in: args) ?? "SDDSComponents/Sources"
let propsArg = argValue("--props", in: args) ?? "DesignSystemBuilder/DesignSystemBuilderCore/Model/Props"
let overridesArg = argValue("--overrides", in: args) ?? "DesignSystemBuilder/.sdds/ios-api-meta.overrides.json"
let outputPath = argValue("--output", in: args)
let moduleName = argValue("--module", in: args) ?? "SDDSComponents"
let wantReport = args.contains("--report")
let onlyFilter: Set<String>? = argValue("--only", in: args).map { value in
    Set(value.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) })
}

let sourceDirs = sourcesArg.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }

// MARK: - Обход .swift-файлов

let fileManager = FileManager.default
let skipDirs: Set<String> = [".build", "build", ".git", ".claude", "worktrees", "DerivedData", ".swiftpm"]

func swiftFiles(in directory: String) -> [String] {
    var result: [String] = []
    guard let enumerator = fileManager.enumerator(atPath: directory) else { return result }
    for case let path as String in enumerator {
        let components = path.split(separator: "/").map(String.init)
        if components.contains(where: { skipDirs.contains($0) }) {
            continue
        }
        if path.hasSuffix(".swift") {
            result.append((directory as NSString).appendingPathComponent(path))
        }
    }
    return result
}

if args.contains("--emit-marker-plan") {
    SyntaxSupport.includeDeprecated = true
}

let table = SymbolTable()
var fileCount = 0
for dir in sourceDirs {
    var isDir: ObjCBool = false
    guard fileManager.fileExists(atPath: dir, isDirectory: &isDir), isDir.boolValue else {
        FileHandle.standardError.write(Data("warning: каталог не найден: \(dir)\n".utf8))
        continue
    }
    for file in swiftFiles(in: dir) {
        guard let source = try? String(contentsOfFile: file, encoding: .utf8) else { continue }
        table.ingest(source: source, path: file)
        fileCount += 1
    }
}

if !table.markerErrors.isEmpty {
    for error in table.markerErrors {
        FileHandle.standardError.write(Data("error: \(error)\n".utf8))
    }
    FileHandle.standardError.write(Data("Найдено ошибок в маркерах: \(table.markerErrors.count)\n".utf8))
    exit(1)
}

// MARK: - Каталог config-id из *Props (для сверки)

var propsCatalog: PropsCatalog?
if !propsArg.isEmpty {
    var isDir: ObjCBool = false
    if fileManager.fileExists(atPath: propsArg, isDirectory: &isDir), isDir.boolValue {
        let propsTable = SymbolTable()
        for file in swiftFiles(in: propsArg) {
            if let source = try? String(contentsOfFile: file, encoding: .utf8) {
                propsTable.ingest(source: source)
            }
        }
        propsCatalog = PropsCatalog(table: propsTable)
    } else {
        FileHandle.standardError.write(Data("warning: каталог Props не найден: \(propsArg) (сверка выключена)\n".utf8))
    }
}

// MARK: - Курируемые override'ы (sidecar, без правок Swift)

var overrides: [String: [String: String]] = [:]
if let data = try? Data(contentsOf: URL(fileURLWithPath: overridesArg)),
   let decoded = try? JSONDecoder().decode([String: [String: String]].self, from: data) {
    overrides = decoded
}

// MARK: - Скан + сверка + сериализация

let scanner = Scanner(table: table, moduleName: moduleName)
let scanned = scanner.scan(only: onlyFilter)

if args.contains("--emit-marker-plan") {
    struct MarkerPlanItem: Codable {
        let component: String
        let configId: String
        let property: String
        let file: String
        let line: Int
    }
    var plan: [MarkerPlanItem] = []
    var unresolved: [String] = []
    let scannedByComponent = Dictionary(scanned.map { ($0.componentName, $0) }, uniquingKeysWith: { a, _ in a })
    for (component, mapping) in overrides {
        guard let meta = scannedByComponent[component] else {
            unresolved.append("\(component): нет в скане"); continue
        }
        for (configId, targetProperty) in mapping {
            let matches = meta.params.filter { $0.methodName == targetProperty }
            guard let match = matches.first, let file = match.sourceFile, let line = match.sourceLine else {
                unresolved.append("\(component).\(configId) → \(targetProperty): свойство не найдено"); continue
            }
            if Set(matches.map { "\($0.sourceFile ?? ""):\($0.sourceLine ?? -1)" }).count > 1 {
                unresolved.append("\(component).\(configId) → \(targetProperty): неоднозначно (\(matches.count))"); continue
            }
            plan.append(MarkerPlanItem(component: component, configId: configId, property: targetProperty, file: file, line: line))
        }
    }
    let enc = JSONEncoder(); enc.outputFormatting = [.prettyPrinted, .sortedKeys]
    FileHandle.standardOutput.write((try? enc.encode(plan)) ?? Data())
    FileHandle.standardOutput.write(Data("\n".utf8))
    if !unresolved.isEmpty {
        FileHandle.standardError.write(Data(("НЕ разрешено (\(unresolved.count)):\n" + unresolved.sorted().joined(separator: "\n") + "\n").utf8))
    }
    FileHandle.standardError.write(Data("marker-plan: \(plan.count) маркеров\n".utf8))
    exit(0)
}

var components: [ComponentApiMeta] = []
var reports: [ReconcileReport] = []
let reconciler = Reconciler()
for meta in scanned {
    if let fields = propsCatalog?.fields(forComponent: meta.componentName), !fields.isEmpty {
        let (reconciled, report) = reconciler.reconcile(
            meta: meta,
            fields: fields,
            overrides: overrides[meta.componentName] ?? [:]
        )
        components.append(reconciled)
        reports.append(report)
    } else {
        components.append(meta)
    }
}

if wantReport && !reports.isEmpty {
    let matched = reports.reduce(0) { $0 + $1.matched }
    let totalFields = reports.reduce(0) { $0 + $1.total }
    let pct = totalFields > 0 ? matched * 100 / totalFields : 0
    FileHandle.standardError.write(Data("\n=== Сверка config-id ↔ Appearance: \(matched)/\(totalFields) (\(pct)%) по \(reports.count) компонентам ===\n".utf8))
    for report in reports.sorted(by: { $0.gaps.count > $1.gaps.count }) where !report.gaps.isEmpty || !report.drift.isEmpty {
        var line = "\(report.component): \(report.matched)/\(report.total)"
        if !report.gaps.isEmpty { line += " | gaps: \(report.gaps.joined(separator: ","))" }
        if !report.drift.isEmpty { line += " | drift: \(report.drift.joined(separator: ","))" }
        FileHandle.standardError.write(Data((line + "\n").utf8))
    }
}

let encoder = JSONEncoder()
encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
let data = try encoder.encode(components)

if let outputPath {
    try data.write(to: URL(fileURLWithPath: outputPath))
    FileHandle.standardError.write(Data("ok: \(components.count) компонентов из \(fileCount) файлов → \(outputPath)\n".utf8))
} else {
    FileHandle.standardOutput.write(data)
    FileHandle.standardOutput.write(Data("\n".utf8))
    FileHandle.standardError.write(Data("ok: \(components.count) компонентов из \(fileCount) файлов\n".utf8))
}
