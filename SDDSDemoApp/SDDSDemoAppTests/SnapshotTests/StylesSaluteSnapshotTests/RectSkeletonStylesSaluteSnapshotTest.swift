//
//  RectSkeletonStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class RectSkeletonStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testRectSkeletonTestCaseStylesSalute() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 8),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000)
        try await runSnapshotTest(view: RectSkeletonTestCase(appearance: appearance))
    }
    
    @MainActor
    func testRectSkeletonLighterStylesSalute() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 8),
            gradient: .surfaceDefaultSkeletonDeepGradient,
            duration: 2000)
        try await runSnapshotTest(view: RectSkeletonTestCase(appearance: appearance))
    }
}
