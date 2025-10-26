//
//  RectSkeletonPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class RectSkeletonPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testRectSkeletonTestCasePlasmaB2C() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 8),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000)
        try await runSnapshotTest(view: RectSkeletonTestCase(appearance: appearance))
    }
    
    @MainActor
    func testRectSkeletonLighterPlasmaB2C() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 8),
            gradient: .surfaceDefaultSkeletonDeepGradient,
            duration: 2000)
        try await runSnapshotTest(view: RectSkeletonTestCase(appearance: appearance))
    }
}
