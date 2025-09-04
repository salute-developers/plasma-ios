//
//  RectSkeletonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class RectSkeletonSnapshotTest: XCTestCase {
    
    @MainActor
    func testRectSkeletonTestCase() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 8),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000)
        try await runSnapshotTest(view: RectSkeletonTestCase(appearance: appearance))
    }
    
    @MainActor
    func testRectSkeletonLighter() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 8),
            gradient: .surfaceDefaultSkeletonDeepGradient,
            duration: 2000)
        try await runSnapshotTest(view: RectSkeletonTestCase(appearance: appearance))
    }
}
