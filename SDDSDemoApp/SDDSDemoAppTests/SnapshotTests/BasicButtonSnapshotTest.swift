//
//  BasicButtonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 15.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI


final class BasicButtonSnapshotTest: XCTestCase {
    
    func testButtonLDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonLDefault_\(themeName)",
                colorScheme: scheme,
                view: ButtonLDefault()
            )
        }
    }
    
    
    func testButtonMAccent() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonMAccent_\(themeName)",
                colorScheme: scheme,
                view: ButtonMAccent()
            )
        }
    }
    
    func testButtonSWarning() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonSWarning_\(themeName)",
                colorScheme: scheme,
                view: ButtonSWarning()
            )
        }
    }
    
    func testButtonXsDark() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonXsDark\(themeName)",
                colorScheme: scheme,
                view: ButtonXsDark()
            )
        }
    }
    
    func testButtonIsLoading() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonIsLoading\(themeName)",
                colorScheme: scheme,
                view: ButtonLIsLoading()
            )
        }
    }
    
    func testButtonIsDisabled() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonIsDisabled_\(themeName)",
                colorScheme: scheme,
                view: ButtonLIsDisabled()
            )
        }
    }
    
    func testButtonLSecondary() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonLSecondary_\(themeName)",
                colorScheme: scheme,
                view: ButtonLSecondary()
            )
        }
    }
    
    func testButtonMClearSpaceBetween() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonMClearSpaceBetween_\(themeName)",
                colorScheme: scheme,
                view: ButtonMClearSpaceBetween()
            )
        }
    }
    
    func testButtonSPositiveLongText() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonSPositiveLongText\(themeName)",
                colorScheme: scheme,
                view: ButtonSPositiveLongText()
            )
        }
    }
    
    func testButtonXlDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonXlDefault\(themeName)",
                colorScheme: scheme,
                view: ButtonXlDefault()
            )
        }
    }
    
    func testButtonXxsDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "ButtonXxsDefault\(themeName)",
                colorScheme: scheme,
                view: ButtonXxsDefault()
            )
        }
    }
}
