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

final class AvatarPlasmaHomeDSSnapshotTest: XCTestCase {
    
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
}
