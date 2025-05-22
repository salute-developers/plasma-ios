//
//  AvatarSnapshotTest.swift
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

final class AvatarSnapshotTest: XCTestCase {
    
    func testAvatarSizeM() async throws {
        try await runSnapshotTest(view: AvatarSizeM())
    }
    
    func testAvatarSizeXxl() async throws {
        try await runSnapshotTest(view: AvatarSizeXxl())
    }
    
    func testAvatarGroupSizeS() async throws {
        try await runSnapshotTest(view: AvatarGroupSizeS())
    }
    
    func testAvatarSizeXxlCounterTopLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeXxlCounterTopLeft())
    }
    
    func testAvatarSizeLCounterTopRight() async throws {
        try await runSnapshotTest(view: AvatarSizeLCounterTopRight())
    }
    
    func testAvatarSizeMCounterBottomRight() async throws {
        try await runSnapshotTest(view: AvatarSizeMCounterBottomRight())
    }
    
    func testAvatarSizeSCounterBottomLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeSCounterBottomLeft())
    }
    
    func testAvatarSizeXxlBadgeTopLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeXxlBadgeTopLeft())
    }
    
    func testAvatarSizeXxlBadgeBottomRight() async throws {
        try await runSnapshotTest(view: AvatarSizeXxlBadgeBottomRight())
    }
    
    func testAvatarSizeLBadgeTopRight() async throws {
        try await runSnapshotTest(view: AvatarSizeLBadgeTopRight())
    }
    
    func testAvatarSizeMBadgeBottomLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeMBadgeBottomLeft())
    }
}
