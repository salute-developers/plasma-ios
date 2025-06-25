//
//  IconBadgeSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class IconBadgeSnapshotTest: XCTestCase {
    
    @MainActor
    func testIconBadgeSizeLDefault() async throws {
        try await runSnapshotTest(view: IconBadgeSizeLDefault())
    }
    
    @MainActor
    func testIconBadgeSizeMAccentPilled() async throws {
        try await runSnapshotTest(view: IconBadgeSizeMAccentPilled())
    }
    
    @MainActor
    func testIconBadgeSizeSPositiveClear() async throws {
        try await runSnapshotTest(view: IconBadgeSizeSPositiveClear())
    }
    
    @MainActor
    func testIconBadgeSizeXsWarningTransparent() async throws {
        try await runSnapshotTest(view: IconBadgeSizeXsWarningTransparent())
    }
    
    @MainActor
    func testIconBadgeSizeLNegative() async throws {
        try await runSnapshotTest(view: IconBadgeSizeLNegative())
    }
    
    @MainActor
    func testIconBadgeSizeMDark() async throws {
        try await runSnapshotTest(view: IconBadgeSizeMDark())
    }
    
    @MainActor
    func testIconBadgeSizeSLight() async throws {
        try await runSnapshotTest(view: IconBadgeSizeSLight())
    }
}
