//
//  ImagePlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 20.04.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class ImagePlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testImageRatio16x9PlasmaHomeDS() async throws {
        let appearance = Image.ratio_16_9.appearance
        try await runSnapshotTest(view: ImageRatio16x9Photo(appearance: appearance))
    }

    @MainActor
    func testImageRatio1x1PlasmaHomeDS() async throws {
        let appearance = Image.ratio_1_1.appearance
        try await runSnapshotTest(view: ImageRatio1x1Photo(appearance: appearance))
    }

    @MainActor
    func testImageRatio1x2PlasmaHomeDS() async throws {
        let appearance = Image.ratio_1_2.appearance
        try await runSnapshotTest(view: ImageRatio1x2Photo(appearance: appearance))
    }
    
    @MainActor
    func testImageRatio3x4PlasmaHomeDS() async throws {
        let appearance = Image.ratio_3_4.appearance
        try await runSnapshotTest(view: ImageRatio3x4Photo(appearance: appearance))
    }
    
    @MainActor
    func testImageRatio4x3PlasmaHomeDS() async throws {
        let appearance = Image.ratio_4_3.appearance
        try await runSnapshotTest(view: ImageRatio4x3Photo(appearance: appearance))
    }
    
    @MainActor
    func testImageRatio9x16PlasmaHomeDS() async throws {
        let appearance = Image.ratio_9_16.appearance
        try await runSnapshotTest(view: ImageRatio9x16Photo(appearance: appearance))
    }
    
    @MainActor
    func testImageRatio2x1PlasmaHomeDS() async throws {
        let appearance = Image.ratio_2_1.appearance
        try await runSnapshotTest(view: ImageRatio2x1Photo(appearance: appearance))
    }
}
