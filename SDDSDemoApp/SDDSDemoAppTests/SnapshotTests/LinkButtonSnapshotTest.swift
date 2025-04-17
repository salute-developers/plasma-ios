//
//  LinkButtonSnapshotTest.swift
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

final class LinkButtonSnapshotTest: XCTestCase {
    
    func testLinkButtonLDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonLDefault\(themeName)",
                colorScheme: scheme,
                view: LinkButtonLDefault()
            )
        }
    }
    
    func testLinkButtonLIsLoading() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonLIsLoading\(themeName)",
                colorScheme: scheme,
                view: LinkButtonLIsLoading()
            )
        }
    }
    
    func testLinkButtonLSecondary() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonLSecondary\(themeName)",
                colorScheme: scheme,
                view: LinkButtonLSecondary()
            )
        }
    }
    
    func testLinkButtonMAccent() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonMAccent\(themeName)",
                colorScheme: scheme,
                view: LinkButtonMAccent()
            )
        }
    }
    
    func testLinkButtonLIsDisabled() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonLIsDisabled\(themeName)",
                colorScheme: scheme,
                view: LinkButtonLIsDisabled()
            )
        }
    }
    
    func testLinkButtonSWarning() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonSWarning\(themeName)",
                colorScheme: scheme,
                view: LinkButtonSWarning()
            )
        }
    }
    
    func testLinkButtonXsNegative() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonXsNegative\(themeName)",
                colorScheme: scheme,
                view: LinkButtonXsNegative()
            )
        }
    }
    
    func testLinkButtonXlDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonXlDefault\(themeName)",
                colorScheme: scheme,
                view: LinkButtonXlDefault()
            )
        }
    }
    
    func testLinkButtonXxsDefault() async throws {
        for (themeName, scheme) in SnapshotTestConfig.testTheme {
            try await runSnapshotTest(
                name: "LinkButtonXxsDefault\(themeName)",
                colorScheme: scheme,
                view: LinkButtonXxsDefault()
            )
        }
    }
}
