import Foundation

/// Строит `ios-api-meta.json` из таблицы символов: для каждого `*Appearance`
/// уходя в под-структуры/протоколы как в группы.
struct Scanner {
    let table: SymbolTable
    let moduleName: String
    /// Максимальная глубина раскрытия групп (защита от циклов/глубины).
    let maxDepth = 6

    /// Суффикс, по которому struct считается стилем компонента.
    private let appearanceSuffix = "Appearance"

    func scan(only: Set<String>?) -> [ComponentApiMeta] {
        var result: [ComponentApiMeta] = []
        for (name, decl) in table.types {
            guard decl.kind == .structOrClass, !decl.ignored else { continue }
            let isComponent = decl.apiInfo || decl.componentOverride != nil
            guard isComponent else { continue }
            let derived = name.hasSuffix(appearanceSuffix) ? String(name.dropLast(appearanceSuffix.count)) : name
            let componentName = decl.componentOverride ?? derived
            if let only, !only.contains(componentName), !only.contains(name) { continue }
            guard !componentName.isEmpty else { continue }

            var params: [Param] = []
            var visited: Set<String> = [name]
            expand(typeName: name, group: "root", depth: 0, visited: &visited, into: &params)

            let resolved = Set(params.map { $0.valueQualifiedType }).sorted()
            result.append(ComponentApiMeta(
                componentName: componentName,
                qualifiedName: "\(moduleName).\(name)",
                styleQualifiedName: "\(moduleName).\(name)",
                sizeQualifiedName: sizeType(of: decl).map { "\(moduleName).\($0)" },
                components: decl.components.isEmpty ? nil : decl.components.sorted(),
                resolvedTypes: resolved,
                stateEnum: stateEnum(for: decl),
                params: params
            ))
        }
        return result.sorted { $0.componentName < $1.componentName }
    }

    private func sizeType(of decl: TypeDecl) -> String? {
        decl.properties.first { $0.name == "size" }?.simpleType
    }

    /// Раскрывает свойства типа `typeName` в params под группой `group`.
    private func expand(typeName: String, group: String, depth: Int, visited: inout Set<String>, into params: inout [Param]) {
        guard let decl = table.types[typeName], depth <= maxDepth else { return }
        for property in decl.properties {
            guard !property.ignored else { continue }
            let id = property.apiNameOverride ?? property.name

            // 0) Значение задано разметкой — свойство лист, даже если тип раскрывался бы в группу.
            if property.markupValue != nil || property.markupZero != nil {
                let category = property.typeOverride
                    ?? TypeCategory.terminalCategory(simpleType: property.simpleType)
                    ?? TypeCategory.fallback(simpleType: property.simpleType)
                params.append(leaf(property: property, id: id, category: category, group: group, file: decl.file))
                // Группировочный тип при этом всё равно раскрываем: разметка задаёт
                // значение самого свойства, а не отменяет его под-свойства.
                let childGroup = (group == "root") ? id : "\(group).\(id)"
                if let nested = table.types[property.simpleType], canExpand(nested), !visited.contains(property.simpleType) {
                    visited.insert(property.simpleType)
                    expand(typeName: property.simpleType, group: childGroup, depth: depth + 1, visited: &visited, into: &params)
                    visited.remove(property.simpleType)
                }
                continue
            }
            // 1) Явный override категории — лист.
            if let override = property.typeOverride {
                params.append(leaf(property: property, id: id, category: override, group: group, file: decl.file,
                                   valueEnum: valueEnum(named: property.simpleType)))
                continue
            }
            // 2) Терминальный токен-тип — лист.
            if let category = TypeCategory.terminalCategory(simpleType: property.simpleType) {
                params.append(leaf(property: property, id: id, category: category, group: group, file: decl.file,
                                   valueEnum: valueEnum(named: property.simpleType)))
                continue
            }
            // 2b) Вложенный компонент (тип `*Appearance`) — ОДИН `component_style`-лист,
            //     НЕ разворачиваем (в конфиге это единый `ComponentStyleKeyValue<XProps>`).
            //     Разворачиваем только группировочные конфиги (`*SizeConfiguration`).
            if property.simpleType.hasSuffix("Appearance") {
                params.append(leaf(property: property, id: id, category: "component_style", group: group, file: decl.file))
                continue
            }
            // 3) Композит из дерева — рекурсия как группа (имя группы = id, чтобы
            let childGroup = (group == "root") ? id : "\(group).\(id)"
            if let nested = table.types[property.simpleType], canExpand(nested), !visited.contains(property.simpleType) {
                visited.insert(property.simpleType)
                expand(typeName: property.simpleType, group: childGroup, depth: depth + 1, visited: &visited, into: &params)
                visited.remove(property.simpleType)
                continue
            }
            // 3b) Дженерик-обёртка (напр. Variation<X>) — рекурсия в аргумент.
            if let generic = property.genericArgument,
               let nested = table.types[generic], canExpand(nested), !visited.contains(generic) {
                visited.insert(generic)
                expand(typeName: generic, group: childGroup, depth: depth + 1, visited: &visited, into: &params)
                visited.remove(generic)
                continue
            }
            // 4) enum из дерева — лист-`value`.
            if let nested = table.types[property.simpleType], nested.kind == .enumeration {
                params.append(leaf(property: property, id: id, category: "value", group: group, file: decl.file,
                                   valueEnum: valueEnum(named: property.simpleType)))
                continue
            }
            // 5) Неизвестный внешний тип — лист с fallback-категорией.
            params.append(leaf(property: property, id: id, category: TypeCategory.fallback(simpleType: property.simpleType), group: group, file: decl.file))
        }
    }

    private func canExpand(_ decl: TypeDecl) -> Bool {
        (decl.kind == .structOrClass || decl.kind == .proto) && !decl.properties.isEmpty && !decl.ignored
    }

    private func leaf(property: PropertyDecl, id: String, category: String, group: String, file: String, valueEnum: ValueEnum? = nil) -> Param {
        Param(
            type: category,
            id: id,
            methodName: property.name,
            paramName: property.name,
            paramQualifiedType: property.qualifiedType,
            paramSimpleType: property.simpleType,
            valueQualifiedType: property.genericArgument ?? property.simpleType,
            group: group,
            state: property.state,
            copyOf: property.copyOf,
            valueEnum: valueEnum,
            fromVariation: property.fromVariation ? true : nil,
            markupValue: property.markupValue,
            markupZero: property.markupZero,
            rawNumber: property.rawNumber ? true : nil,
            alwaysEmit: property.alwaysEmit ? true : nil,
            stateOnly: property.stateOnly ? true : nil,
            explicitId: property.apiNameOverride != nil || property.copyOf != nil,
            sourceFile: file,
            sourceLine: property.line
        )
    }

    /// Значения enum-типа для универсального маппера: id конфига → case.
    private func valueEnum(named typeName: String) -> ValueEnum? {
        guard let decl = table.types[typeName], decl.kind == .enumeration else { return nil }
        return ValueEnum(
            qualifiedName: "\(moduleName).\(typeName)",
            simpleName: typeName,
            values: decl.enumCases.map { ValueEnum.Value(name: $0.name, id: $0.id) },
            defaultValue: decl.enumCases.first { $0.isDefault }?.name
        )
    }

    private func stateEnum(for decl: TypeDecl) -> StateEnum? {
        guard let enumName = decl.stateEnumName,
              let enumDecl = table.types[enumName], enumDecl.kind == .enumeration else { return nil }
        return StateEnum(
            qualifiedName: "\(moduleName).\(enumName)",
            simpleName: enumName,
            values: enumDecl.enumCases.map { StateEnum.Value(name: $0.name) }
        )
    }
}
