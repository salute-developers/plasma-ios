//
//  TextSkeletonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSservTheme
import UIKit
import SwiftUI

final class TextSkeletonSnapshotTest: XCTestCase {
    
    @MainActor
    func testTextSkeletonTestNoTextRandom() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonTestFullWidth() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestFullWidth(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonLigther() async throws {
        let appearance = SkeletonAppearance(
            shape: CornerRadiusDrawer(cornerRadius: 4),
            gradient: .surfaceDefaultSkeletonDeepGradient,
            duration: 2000
        )
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
}
