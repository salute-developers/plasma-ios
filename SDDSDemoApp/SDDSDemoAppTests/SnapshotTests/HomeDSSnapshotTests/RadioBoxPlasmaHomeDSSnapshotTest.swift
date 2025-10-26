//
//  RadioBoxPlasmaHomeDSSnapshotTest.swift
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

final class RadioBoxPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testRadioBoxSizeMPlasmaHomeDS() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeSUncheckedPlasmaHomeDS() async throws {
        let appearance = Radiobox.s.appearance
        try await runSnapshotTest(view: RadioBoxSizeSUnchecked(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMNoDescriptionPlasmaHomeDS() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMDisabledPlasmaHomeDS() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMDisabled(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeMPlasmaHomeDS() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeM(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeSPlasmaHomeDS() async throws {
        let appearance = Radiobox.s.appearance
        let radioBoxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeS(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeMDescriptionPlasmaHomeDS() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeMDescription(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeSLabelPlasmaHomeDS() async throws {
        let appearance = Radiobox.s.appearance
        let radioboxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeSLabel(appearance: appearance, radioBoxGroupAppearance: radioboxGroupAppearance))
    }
}
