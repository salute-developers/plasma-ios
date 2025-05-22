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
        try await runSnapshotTest(view: LinkButtonLDefault())
    }
    
    func testLinkButtonLIsLoading() async throws {
        try await runSnapshotTest(view: LinkButtonLIsLoading())
    }
    
    func testLinkButtonLSecondary() async throws {
        try await runSnapshotTest(view: LinkButtonLSecondary())
    }
    
    func testLinkButtonMAccent() async throws {
        try await runSnapshotTest(view: LinkButtonMAccent())
    }
    
    func testLinkButtonLIsDisabled() async throws {
        try await runSnapshotTest(view: LinkButtonLIsDisabled())
    }
    
    func testLinkButtonSWarning() async throws {
        try await runSnapshotTest(view: LinkButtonSWarning())
    }
    
    func testLinkButtonXsNegative() async throws {
        try await runSnapshotTest(view: LinkButtonXsNegative())
    }
    
    func testLinkButtonXlDefault() async throws {
        try await runSnapshotTest(view: LinkButtonXlDefault())
    }
    
    func testLinkButtonXxsDefault() async throws {
        try await runSnapshotTest(view: LinkButtonXxsDefault())
    }
}
