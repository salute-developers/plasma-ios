import Foundation

/// Форматирование сгенерированного кода внешним `swiftlint --fix`.
///
/// Аналог `finalizedBy(spotlessApply)` на Android: шаг внешний по отношению к генератору и
/// необязательный — если инструмента на машине нет, генерация остаётся успешной.
enum SwiftLintFormatter {
    static func fix(directory: URL) {
        guard let executable = resolveExecutable() else {
            print("ℹ️ swiftlint не найден — форматирование пропущено")
            return
        }

        let process = Process()
        process.executableURL = executable
        process.arguments = ["--fix", "--quiet", directory.path()]
        process.currentDirectoryURL = directory

        do {
            try process.run()
            process.waitUntilExit()
            if process.terminationStatus == 0 {
                print("🧹 Formatted: \(directory.path())")
            } else {
                // Форматирование — довесок к генерации, а не её часть: код уже на диске,
                // и ронять команду из-за линтера нельзя.
                print("⚠️ swiftlint --fix вернул \(process.terminationStatus); код сгенерирован, но не отформатирован")
            }
        } catch {
            print("⚠️ swiftlint не запустился (\(error.localizedDescription)); код сгенерирован, но не отформатирован")
        }
    }

    private static func resolveExecutable() -> URL? {
        let candidates = ["/opt/homebrew/bin/swiftlint", "/usr/local/bin/swiftlint"]
        for path in candidates where FileManager.default.isExecutableFile(atPath: path) {
            return URL(fileURLWithPath: path)
        }
        return nil
    }
}
