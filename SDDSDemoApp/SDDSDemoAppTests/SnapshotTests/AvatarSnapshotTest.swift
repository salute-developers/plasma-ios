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
    
    @MainActor
    func testAvatarSizeM() async throws {
        try await runSnapshotTest(view: AvatarSizeM())
    }
    
    @MainActor
    func testAvatarSizeXxl() async throws {
        try await runSnapshotTest(view: AvatarSizeXxl())
    }
    
    @MainActor
    func testAvatarSizeXxlCounterTopLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeXxlCounterTopLeft())
    }
    
    @MainActor
    func testAvatarSizeLCounterTopRight() async throws {
        try await runSnapshotTest(view: AvatarSizeLCounterTopRight())
    }
    
    @MainActor
    func testAvatarSizeMCounterBottomRight() async throws {
        try await runSnapshotTest(view: AvatarSizeMCounterBottomRight())
    }
    
    @MainActor
    func testAvatarSizeSCounterBottomLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeSCounterBottomLeft())
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeTopLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeXxlBadgeTopLeft())
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeBottomRight() async throws {
        try await runSnapshotTest(view: AvatarSizeXxlBadgeBottomRight())
    }
    
    @MainActor
    func testAvatarSizeLBadgeTopRight() async throws {
        try await runSnapshotTest(view: AvatarSizeLBadgeTopRight())
    }
    
    @MainActor
    func testAvatarSizeMBadgeBottomLeft() async throws {
        try await runSnapshotTest(view: AvatarSizeMBadgeBottomLeft())
    }
}
