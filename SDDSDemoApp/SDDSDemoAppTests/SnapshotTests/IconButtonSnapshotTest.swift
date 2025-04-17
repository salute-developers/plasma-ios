//
//  IconButtonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 17.04.2025.
//
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class IconButtonSnapshotTest: XCTestCase {
    
    func testIсonButtonLDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IсonButtonLDefault\(themeName)",
                colorScheme: scheme,
                view: IсonButtonLDefault()
            )
        }
    }
    
    func testIconButtonMAccent() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonMAccent\(themeName)",
                colorScheme: scheme,
                view: IconButtonMAccent()
            )
        }
    }
    
    func testIconButtonSWarning() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonSWarning\(themeName)",
                colorScheme: scheme,
                view: IconButtonSWarning()
            )
        }
    }
    
    func testIconButtonXsDark() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonXsDark\(themeName)",
                colorScheme: scheme,
                view: IconButtonXsDark()
            )
        }
    }
    
    func testIconButtonIsLoading() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonIsLoading\(themeName)",
                colorScheme: scheme,
                view: IconButtonIsLoading()
            )
        }
    }
    
    func testIconButtonIsDisabled() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonIsDisabled\(themeName)",
                colorScheme: scheme,
                view: IconButtonIsDisabled()
            )
        }
    }
    
    func testIconButtonLSecondaryPilled() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonLSecondaryPilled\(themeName)",
                colorScheme: scheme,
                view: IconButtonLSecondaryPilled()
            )
        }
    }
    
    func testIconButtonMClear() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonMClear\(themeName)",
                colorScheme: scheme,
                view: IconButtonMClear()
            )
        }
    }
    
    func testIconButtonSPositive() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonSPositive\(themeName)",
                colorScheme: scheme,
                view: IconButtonSPositive()
            )
        }
    }
    
    func testIconButtonXsNegativePilledIsLoading() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonXsNegativePilledIsLoading\(themeName)",
                colorScheme: scheme,
                view: IconButtonXsNegativePilledIsLoading()
            )
        }
    }
    
    func testIconButtonLWhite() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonLWhite\(themeName)",
                colorScheme: scheme,
                view: IconButtonLWhite()
            )
        }
    }
    
    func testIconButtonXlDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonXlDefault\(themeName)",
                colorScheme: scheme,
                view: IconButtonXlDefault()
            )
        }
    }
    
    func testIconButtonXxsDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "IconButtonXxsDefault\(themeName)",
                colorScheme: scheme,
                view: IconButtonXxsDefault()
            )
        }
    }
}
