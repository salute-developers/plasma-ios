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
    
    @MainActor
    func testLinkButtonLDefault() async throws {
        try await runSnapshotTest(view: LinkButtonLDefault())
    }
    
    @MainActor
    func testLinkButtonLIsLoading() async throws {
        try await runSnapshotTest(view: LinkButtonLIsLoading())
    }
    
    @MainActor
    func testLinkButtonLSecondary() async throws {
        try await runSnapshotTest(view: LinkButtonLSecondary())
    }
    
    @MainActor
    func testLinkButtonMAccent() async throws {
        try await runSnapshotTest(view: LinkButtonMAccent())
    }
    
    @MainActor
    func testLinkButtonLIsDisabled() async throws {
        try await runSnapshotTest(view: LinkButtonLIsDisabled())
    }
    
    @MainActor
    func testLinkButtonSWarning() async throws {
        try await runSnapshotTest(view: LinkButtonSWarning())
    }
    
    @MainActor
    func testLinkButtonXsNegative() async throws {
        try await runSnapshotTest(view: LinkButtonXsNegative())
    }
    
    @MainActor
    func testLinkButtonXlDefault() async throws {
        try await runSnapshotTest(view: LinkButtonXlDefault())
    }
    
    @MainActor
    func testLinkButtonXxsDefault() async throws {
        try await runSnapshotTest(view: LinkButtonXxsDefault())
    }
}
