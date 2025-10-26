//
//  AvatarGroupPlasmaHomeDSSnapshotTest.swift
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

final class AvatarGroupPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testAvatarGroupSizeSPlasmaHomeDS() async throws {
        let appearance = Avatar.s.appearance
        try await runSnapshotTest(view: AvatarGroupSizeS(appearance: appearance))
    }
}
