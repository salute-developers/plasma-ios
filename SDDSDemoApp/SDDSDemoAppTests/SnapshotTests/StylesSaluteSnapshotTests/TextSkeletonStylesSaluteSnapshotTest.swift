//
//  TextSkeletonStylesSaluteSnapshotTest.swift
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

final class TextSkeletonStylesSaluteSnapshotTest: StylesSaluteThemeTestCase {
    
    @MainActor
    func testTextSkeletonTestNoTextRandomStylesSalute() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonTestFullWidthStylesSalute() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestFullWidth(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonLigtherStylesSalute() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonDeepGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
}
