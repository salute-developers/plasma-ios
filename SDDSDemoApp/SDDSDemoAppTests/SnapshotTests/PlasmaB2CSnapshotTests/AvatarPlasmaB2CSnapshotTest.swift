//
//  AvatarPlasmaB2c.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 04.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class AvatarPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testAvatarSizeMPlasmaB2C() async throws {
        let appearance = Avatar.m.appearance
        try await runSnapshotTest(view: AvatarSizeM(appearance: appearance))
    }
    
    @MainActor
    func testAvatarSizeXxlPlasmaB2C() async throws {
        let appearance = Avatar.xxl.appearance
        try await runSnapshotTest(view: AvatarSizeXxl(appearance: appearance))
    }
    
    @MainActor
    func testAvatarSizeXxlCounterTopLeftPlasmaB2C() async throws {
        let appearance = Avatar.xxl.appearance
        let counterAppearance = Counter.m.negative.appearance
        try await runSnapshotTest(view: AvatarSizeXxlCounterTopLeft(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeLCounterTopRightPlasmaB2C() async throws {
        let appearance = Avatar.l.appearance
        let counterAppearance = Counter.s.negative.appearance
        try await runSnapshotTest(view: AvatarSizeLCounterTopRight(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeMCounterBottomRightPlasmaB2C() async throws {
        let appearance = Avatar.m.appearance
        let counterAppearance = Counter.xs.negative.appearance
        try await runSnapshotTest(view: AvatarSizeMCounterBottomRight(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeSCounterBottomLeftPlasmaB2C() async throws {
        let appearance = Avatar.s.appearance
        let counterAppearance = Counter.xxs.negative.appearance
        try await runSnapshotTest(view: AvatarSizeSCounterBottomLeft(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeTopLeftPlasmaB2C() async throws {
        let appearance = Avatar.xxl.appearance
        let badgeAppearance = Badge.m.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeXxlBadgeTopLeft(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeBottomRightPlasmaB2C() async throws {
        let appearance = Avatar.xxl.appearance
        let badgeAppearance = Badge.m.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeXxlBadgeBottomRight(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeLBadgeTopRightPlasmaB2C() async throws {
        let appearance = Avatar.l.appearance
        let badgeAppearance = Badge.s.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeLBadgeTopRight(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeMBadgeBottomLeftPlasmaB2C() async throws {
        let appearance = Avatar.m.appearance
        let badgeAppearance = Badge.xs.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeMBadgeBottomLeft(appearance: appearance, badgeAppearance: badgeAppearance))
    }
}
