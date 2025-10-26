//
//  AvatarHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class AvatarPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testAvatarSizeMPlasmaHomeDS() async throws {
        let appearance = Avatar.m.appearance
        try await runSnapshotTest(view: AvatarSizeM(appearance: appearance))
    }
    
    @MainActor
    func testAvatarSizeXxlPlasmaHomeDS() async throws {
        let appearance = Avatar.xxl.appearance
        try await runSnapshotTest(view: AvatarSizeXxl(appearance: appearance))
    }
    
    @MainActor
    func testAvatarSizeMPilledPlasmaHomeDS() async throws {
        let appearance = Avatar.m.pilled.appearance
        try await runSnapshotTest(view: AvatarSizeM(appearance: appearance))
    }
    
    @MainActor
    func testAvatarSizeXxlCounterTopLeftHomeDS() async throws {
        let appearance = Avatar.xxl.appearance
        let counterAppearance = Counter.m.negative.appearance
        try await runSnapshotTest(view: AvatarSizeXxlCounterTopLeft(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeLCounterTopRightHomeDS() async throws {
        let appearance = Avatar.l.appearance
        let counterAppearance = Counter.s.negative.appearance
        try await runSnapshotTest(view: AvatarSizeLCounterTopRight(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeMCounterBottomRightHomeDS() async throws {
        let appearance = Avatar.m.appearance
        let counterAppearance = Counter.xs.negative.appearance
        try await runSnapshotTest(view: AvatarSizeMCounterBottomRight(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeSCounterBottomLeftHomeDS() async throws {
        let appearance = Avatar.s.appearance
        let counterAppearance = Counter.xxs.negative.appearance
        try await runSnapshotTest(view: AvatarSizeSCounterBottomLeft(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeTopLeftHomeDS() async throws {
        let appearance = Avatar.xxl.appearance
        let badgeAppearance = Badge.m.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeXxlBadgeTopLeft(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeBottomRightHomeDS() async throws {
        let appearance = Avatar.xxl.appearance
        let badgeAppearance = Badge.m.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeXxlBadgeBottomRight(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeLBadgeTopRightHomeDS() async throws {
        let appearance = Avatar.l.appearance
        let badgeAppearance = Badge.s.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeLBadgeTopRight(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeMBadgeBottomLeftHomeDS() async throws {
        let appearance = Avatar.m.appearance
        let badgeAppearance = Badge.xs.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeMBadgeBottomLeft(appearance: appearance, badgeAppearance: badgeAppearance))
    }
}
