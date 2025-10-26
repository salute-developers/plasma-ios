//
//  LoaderPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.10.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class LoaderPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testLoaderCaseSpinnerHomeDS() async throws {
        let appearance = LoaderAppearance(spinnerAppearance: Spinner.m.default.appearance)
        
        try await runSnapshotTest(view: LoaderCaseSpinner(appearance: appearance))
    }
    
    @MainActor
    func testLoaderCaseCircularProgressHomeDS() async throws {
        let appearance = LoaderAppearance(circularProgressAppearance: CircularProgressBar.l.default.appearance)
        
        try await runSnapshotTest(view: LoaderCaseCircularProgress(appearance: appearance))
    }
}
