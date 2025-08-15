//
//  ScrollbarStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class ScrollbarStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testScrollbarSizeMHasTrackHoverExpandStylesSalute() async throws {
        let appearance = ScrollBar.m.appearance
        
        try await runSnapshotTest(view: ScrollbarSizeMHasTrackHover(appearance: appearance))
    }
    
    @MainActor
    func testScrollbarSizeSHoverExpandStylesSalute() async throws {
        let appearance = ScrollBar.s.appearance
        
        try await runSnapshotTest(view: ScrollbarSizeSHoverExpand(appearance: appearance))
    }
    
    @MainActor
    func testScrollbarScrollDownStylesSalute() async throws {
        let appearance = ScrollBar.m.appearance
        
        try await runSnapshotTest(view: ScrollbarScrollDown(appearance: appearance))
    }
}
