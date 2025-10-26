//
//  LoaderSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class LoaderSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testLoaderCaseSpinner() async throws {
        let appearance = LoaderAppearance(spinnerAppearance: Spinner.l.default.appearance)
        
        try await runSnapshotTest(view: LoaderCaseSpinner(appearance: appearance))
    }
    
    @MainActor
    func testLoaderCaseCircularProgress() async throws {
        let appearance = LoaderAppearance(circularProgressAppearance: CircularProgressBar.l.default.appearance)
        
        try await runSnapshotTest(view: LoaderCaseCircularProgress(appearance: appearance))
    }
}
