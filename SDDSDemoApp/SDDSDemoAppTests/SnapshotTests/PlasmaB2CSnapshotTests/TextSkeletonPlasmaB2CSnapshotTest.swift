//
//  TextSkeletonPlasmaB2CSnapshotTest.swift
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

final class TextSkeletonPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testTextSkeletonTestNoTextRandomPlasmaB2C() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonTestFullWidthPlasmaB2C() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestFullWidth(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonLigtherPlasmaB2C() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonDeepGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
}
