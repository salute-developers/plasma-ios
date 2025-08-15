//
//  ScrollbarSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class ScrollbarSnapshotTest: XCTestCase {
    
    @MainActor
    func testScrollbarSizeMHasTrackHover() async throws {
        let appearance = ScrollBar.m.appearance
        
        try await runSnapshotTest(view: ScrollbarSizeMHasTrackHover(appearance: appearance))
    }
    
    @MainActor
    func testScrollbarSizeSHoverExpand() async throws {
        let appearance = ScrollBar.s.appearance
        
        try await runSnapshotTest(view: ScrollbarSizeSHoverExpand(appearance: appearance))
    }
    
    @MainActor
    func testScrollbarScrollDown() async throws {
        let appearance = ScrollBar.m.appearance
        
        try await runSnapshotTest(view: ScrollbarScrollDown(appearance: appearance))
    }
}
