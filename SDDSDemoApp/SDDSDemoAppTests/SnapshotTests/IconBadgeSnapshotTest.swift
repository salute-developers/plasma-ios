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
    
    func testIconBadgeSizeLDefault() async throws {
        try await runSnapshotTest(view: IconBadgeSizeLDefault())
    }
    
    func testIconBadgeSizeMAccentPilled() async throws {
        try await runSnapshotTest(view: IconBadgeSizeMAccentPilled())
    }
    
    func testIconBadgeSizeSPositiveClear() async throws {
        try await runSnapshotTest(view: IconBadgeSizeSPositiveClear())
    }
    
    func testIconBadgeSizeXsWarningTransparent() async throws {
        try await runSnapshotTest(view: IconBadgeSizeXsWarningTransparent())
    }
    
    func testIconBadgeSizeLNegative() async throws {
        try await runSnapshotTest(view: IconBadgeSizeLNegative())
    }
    
    func testIconBadgeSizeMDark() async throws {
        try await runSnapshotTest(view: IconBadgeSizeMDark())
    }
    
    func testIconBadgeSizeSLight() async throws {
        try await runSnapshotTest(view: IconBadgeSizeSLight())
    }
}
