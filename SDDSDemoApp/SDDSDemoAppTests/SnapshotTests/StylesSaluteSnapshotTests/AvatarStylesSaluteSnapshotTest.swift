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
import StylesSaluteTheme
import UIKit
import SwiftUI

final class AvatarStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testAvatarSizeMStylesSalute() async throws {
        let appearance = Avatar.m.appearance
        try await runSnapshotTest(view: AvatarSizeM(appearance: appearance))
    }
    
    @MainActor
    func testAvatarSizeXxlStylesSalute() async throws {
        let appearance = Avatar.xxl.appearance
        try await runSnapshotTest(view: AvatarSizeXxl(appearance: appearance))
    }
    
    @MainActor
    func testAvatarSizeXxlCounterTopLeftStylesSalute() async throws {
        let appearance = Avatar.xxl.appearance
        let counterAppearance = Counter.m.negative.appearance
        try await runSnapshotTest(view: AvatarSizeXxlCounterTopLeft(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeLCounterTopRightStylesSalute() async throws {
        let appearance = Avatar.l.appearance
        let counterAppearance = Counter.s.negative.appearance
        try await runSnapshotTest(view: AvatarSizeLCounterTopRight(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeMCounterBottomRightStylesSalute() async throws {
        let appearance = Avatar.m.appearance
        let counterAppearance = Counter.xs.negative.appearance
        try await runSnapshotTest(view: AvatarSizeMCounterBottomRight(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeSCounterBottomLeftStylesSalute() async throws {
        let appearance = Avatar.s.appearance
        let counterAppearance = Counter.xxs.negative.appearance
        try await runSnapshotTest(view: AvatarSizeSCounterBottomLeft(appearance: appearance, counterAppearance: counterAppearance))
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeTopLeftStylesSalute() async throws {
        let appearance = Avatar.xxl.appearance
        let badgeAppearance = Badge.m.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeXxlBadgeTopLeft(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeXxlBadgeBottomRightStylesSalute() async throws {
        let appearance = Avatar.xxl.appearance
        let badgeAppearance = Badge.m.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeXxlBadgeBottomRight(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeLBadgeTopRightStylesSalute() async throws {
        let appearance = Avatar.l.appearance
        let badgeAppearance = Badge.s.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeLBadgeTopRight(appearance: appearance, badgeAppearance: badgeAppearance))
    }
    
    @MainActor
    func testAvatarSizeMBadgeBottomLeftStylesSalute() async throws {
        let appearance = Avatar.m.appearance
        let badgeAppearance = Badge.xs.pilled.accent.appearance
        try await runSnapshotTest(view: AvatarSizeMBadgeBottomLeft(appearance: appearance, badgeAppearance: badgeAppearance))
    }
}
