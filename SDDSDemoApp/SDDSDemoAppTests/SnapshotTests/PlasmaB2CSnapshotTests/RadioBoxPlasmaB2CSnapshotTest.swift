//
//  RadioBoxPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class RadioBoxPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testRadioBoxSizeMPlasmaB2C() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeSUncheckedPlasmaB2C() async throws {
        let appearance = Radiobox.s.appearance
        try await runSnapshotTest(view: RadioBoxSizeSUnchecked(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMNoDescriptionPlasmaB2C() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMDisabledPlasmaB2C() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMDisabled(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeMPlasmaB2C() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeM(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeSPlasmaB2C() async throws {
        let appearance = Radiobox.s.appearance
        let radioBoxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeS(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeMDescriptionPlasmaB2C() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeMDescription(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeSLabelPlasmaB2C() async throws {
        let appearance = Radiobox.s.appearance
        let radioboxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeSLabel(appearance: appearance, radioBoxGroupAppearance: radioboxGroupAppearance))
    }
}
