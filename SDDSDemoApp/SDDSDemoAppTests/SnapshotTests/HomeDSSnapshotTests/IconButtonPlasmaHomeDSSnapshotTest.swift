//
//  IconButtonPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class IconButtonPlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testIсonButtonMDefaultPlasmaHomeDS() async throws {
        let appearance = IconButton.m.default.appearance
        try await runSnapshotTest(view: IсonButtonLDefault(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSWarningPlasmaHomeDS() async throws {
        let appearance = IconButton.s.warning.appearance
        try await runSnapshotTest(view: IconButtonSWarning(appearance: appearance))
    }
        
    @MainActor
    func testIconButtonIsLoadingPlasmaHomeDS() async throws {
        let appearance = IconButton.m.default.appearance
        try await runSnapshotTest(view: IconButtonIsLoading(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonIsDisabledPlasmaHomeDS() async throws {
        let appearance = IconButton.m.default.appearance
        try await runSnapshotTest(view: IconButtonIsDisabled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMSecondaryPilledPlasmaHomeDS() async throws {
        let appearance = IconButton.m.secondary.appearance
        try await runSnapshotTest(view: IconButtonLSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonMClearPlasmaHomeDS() async throws {
        let appearance = IconButton.m.clear.appearance
        try await runSnapshotTest(view: IconButtonMClear(appearance: appearance))
    }
    
    @MainActor
    func testIconButtonSNegativePlasmaHomeDS() async throws {
        let appearance = IconButton.s.negative.appearance
        try await runSnapshotTest(view: IconButtonXsNegativePilledIsLoading(appearance: appearance))
    }
}
