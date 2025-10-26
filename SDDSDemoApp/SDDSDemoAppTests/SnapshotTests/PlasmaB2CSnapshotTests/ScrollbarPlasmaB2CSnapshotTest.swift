//
//  ScrollbarPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class ScrollbarPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testScrollbarSizeMHasTrackHoverPlasmaB2C() async throws {
        let appearance = ScrollBar.m.appearance
        
        try await runSnapshotTest(view: ScrollbarSizeMHasTrackHover(appearance: appearance))
    }
    
    @MainActor
    func testScrollbarSizeSHoverExpandPlasmaB2C() async throws {
        let appearance = ScrollBar.s.appearance
        
        try await runSnapshotTest(view: ScrollbarSizeSHoverExpand(appearance: appearance))
    }
    
    @MainActor
    func testScrollbarScrollDownPlasmaB2C() async throws {
        let appearance = ScrollBar.m.appearance
        
        try await runSnapshotTest(view: ScrollbarScrollDown(appearance: appearance))
    }
}
