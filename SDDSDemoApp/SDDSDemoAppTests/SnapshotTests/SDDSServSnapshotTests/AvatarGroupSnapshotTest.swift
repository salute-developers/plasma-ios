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
import SDDSServTheme
import UIKit
import SwiftUI

final class AvatarGroupSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testAvatarGroupSizeS() async throws {
        let appearance = Avatar.s.appearance
        try await runSnapshotTest(view: AvatarGroupSizeS(appearance: appearance))
    }
}
