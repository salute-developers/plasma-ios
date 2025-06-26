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
    
    static let colorTheme: [(name: String, scheme: ColorScheme)] = [
        ("Light", .light),
        ("Dark", .dark)
    ]
    
    static var metaData: [SnapshotTestMetadata] {
        colorTheme.map { colorTheme in
            let scheme = colorTheme.scheme
            let colorTheme: String = "\(colorTheme.name)_\(colorTheme.scheme)"
            let theme: String
            #if PLASMA_THEME
            theme = "Plasma"
            #elseif SALUTE_THEME
            theme = "StylesSalute"
            #else
            theme = "SDDSServ"
            #endif
            
            return .init(colorTheme: colorTheme, scheme: scheme, theme: theme)
        }
    }
    
}

struct SnapshotTestMetadata {
    let colorTheme: String
    let scheme: ColorScheme
    let theme: String
    
    var testName: String {
        "\(colorTheme)_\(theme)"
    }
}

/**
Настройка запуска тестов
Для записи снэпшотов нужно проставить mode .record
Для проверки снэпшотов нужно проставить mode .verify
 */
func runSnapshotTest(
    view: @autoclosure @escaping () -> some View,
    function: StaticString = #function
) async throws {
    
    let baseName = extractTestName(from: function)
    
    for metaData in SnapshotTestConfig.metaData {
        await Xct.snapshotAsync(
            testName: metaData.testName,
            mode: .record,
            deviceGroup: SnapshotTestConfig.iPhone13Mini,
            prepareSut: { _ in
                view()
                    .padding()
                    .background(Color(.systemBackground))
                    .environment(\.colorScheme, metaData.scheme)
                    .snapshotSut()
            }
        )
    }
}

private func extractTestName(from function: StaticString) -> String {
    let fullName = String(describing: function)
    return fullName
}
