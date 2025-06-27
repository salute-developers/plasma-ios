//
//  AvatarGroupSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 25.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
import UIKit
import SwiftUI

final class AvatarGroupSnapshotTest: XCTestCase {
    
    @MainActor
    func testAvatarGroupSizeS() async throws {
        try await runSnapshotTest(view: AvatarGroupSizeS())
    }
}
