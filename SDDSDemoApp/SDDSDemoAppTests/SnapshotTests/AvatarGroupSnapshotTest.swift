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

final class AvatarGroupSnapshotTest: XCTestCase {
    
    @MainActor
    func testAvatarGroupSizeS() async throws {
        try await runSnapshotTest(view: AvatarGroupSizeS())
    }
}
