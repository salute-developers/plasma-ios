//
//  DrawerSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.11.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class DrawerSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testDrawerCloseInnerLeftHasHeader() async throws {
        let appearance = DrawerCloseInner.m.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerCloseLeftHasHeader(appearance: appearance, listAppearance: listAppearance))
    }
    
    @MainActor
    func testDrawerCloseOuterRightHasFooter() async throws {
        let appearance = DrawerCloseOuter.m.hasShadow.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerCloseRightHasFooter(
            appearance: appearance,
            listAppearance: listAppearance,
            hasOverlay: true,
            overlayColor: Color.black.opacity(0.4))
        )
    }
    
    @MainActor
    func testDrawerCloseNoneLeftHasHeaderFooter() async throws {
        let appearance = DrawerCloseNone.m.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerCloseNoneHasHeaderFooter(appearance: appearance, listAppearance: listAppearance))
    }
    
    @MainActor
    func testDrawerCloseInnerIconRightNoHeaderFooter() async throws {
        let appearance = DrawerCloseInner.m.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerCloseIconRightNoHeaderFooter(appearance: appearance, listAppearance: listAppearance))
    }
    
    @MainActor
    func testDrawerHasPeakOffSet() async throws {
        let appearance = DrawerCloseInner.m.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerHasPeakOffSet(appearance: appearance, listAppearance: listAppearance, peakOffSet: 300))
    }
}
