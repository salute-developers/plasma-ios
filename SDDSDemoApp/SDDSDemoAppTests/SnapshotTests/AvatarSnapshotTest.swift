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
}
