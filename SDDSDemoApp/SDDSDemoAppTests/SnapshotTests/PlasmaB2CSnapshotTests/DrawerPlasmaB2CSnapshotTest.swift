//
//  DrawerPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.11.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class DrawerPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testDrawerCloseInnerLeftHasHeaderPlasmaB2C() async throws {
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
    func testDrawerCloseNoneLeftHasHeaderFooterPlasmaB2C() async throws {
        let appearance = DrawerCloseNone.m.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerCloseNoneHasHeaderFooter(appearance: appearance, listAppearance: listAppearance))
    }
    
    @MainActor
    func testDrawerCloseInnerIconRightNoHeaderFooterPlasmaB2C() async throws {
        let appearance = DrawerCloseInner.m.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerCloseIconRightNoHeaderFooter(appearance: appearance, listAppearance: listAppearance))
    }
    
    @MainActor
    func testDrawerHasPeakOffSetPlasmaB2C() async throws {
        let appearance = DrawerCloseInner.m.appearance
        let listAppearance = ListNormal.m.appearance
        try await runSnapshotTest(view: DrawerHasPeakOffSet(appearance: appearance, listAppearance: listAppearance, peakOffSet: 300))
    }
}
