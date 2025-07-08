//
//  AvatarGroupPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class AvatarGroupStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testAvatarGroupSizeSStylesSalute() async throws {
        let appearance = Avatar.s.appearance
        try await runSnapshotTest(view: AvatarGroupSizeS(appearance: appearance))
    }
}
