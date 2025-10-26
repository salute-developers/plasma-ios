//
//  SnapshotTestConfig.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 16.04.2025.
//

import SDSnapshots
import SwiftUI

/**
 Конфиг для снэпшотных тестов
 */

extension SnapshotTestConfig {
    
    static let iPhone13Mini = SnapshotDeviceGroup.custom(
        width: 375,
        height: 812,
        scale: 3,
        portraitSafeArea: UIEdgeInsets(top: 50, bottom: 34)
    )
}

/**
 Запуск в светлой и темной теме
 */
enum SnapshotTestConfig {
    
    static let testTheme: [(name: String, scheme: ColorScheme)] = [
        ("Light", .light),
        ("Dark", .dark)
    ]
}

/**
Настройка запуска тестов
Для записи снэпшотов нужно проставить mode .record
Для проверки снэпшотов нужно проставить mode .verify
Режим можно контролировать через environment variable SNAPSHOT_MODE
 */
func runSnapshotTest(
    view: @autoclosure @escaping () -> some View,
    function: StaticString = #function,
    landscape: Bool = false
) async throws {
    let baseName = extractTestName(from: function)
    
    let deviceGroup: SnapshotDeviceGroup
    if landscape {
        deviceGroup = SnapshotTestConfig.iPhone13Mini.landscape
    } else {
        deviceGroup = SnapshotTestConfig.iPhone13Mini
    }
    
    // Определяем режим на основе environment variable
    let snapshotMode: SnapshotMode = {
        if let modeString = ProcessInfo.processInfo.environment["SNAPSHOT_MODE"] {
            return modeString.lowercased() == "record" ? .record : .verify
        }
        // По умолчанию используем .verify
        return .verify
    }()
    
    for (themeName, scheme) in SnapshotTestConfig.testTheme {
        await Xct.snapshotAsync(
            testName: "\(baseName)_\(themeName)",
            mode: snapshotMode,
            deviceGroup: deviceGroup,
            prepareSut: { _ in
                view()
                    .padding()
                    .background(Color(.systemBackground))
                    .environment(\.colorScheme, scheme)
                    .snapshotSut()
            }
        )
    }
}

private func extractTestName(from function: StaticString) -> String {
    let fullName = String(describing: function)
    return fullName
}
