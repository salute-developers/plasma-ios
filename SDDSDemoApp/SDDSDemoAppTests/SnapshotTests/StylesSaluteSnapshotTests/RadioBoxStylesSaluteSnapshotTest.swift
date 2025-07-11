//
//  RadioBoxStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class RadioBoxStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testRadioBoxSizeMStylesSalute() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeSUncheckedStylesSalute() async throws {
        let appearance = Radiobox.s.appearance
        try await runSnapshotTest(view: RadioBoxSizeSUnchecked(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMNoDescriptionStylesSalute() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMDisabledStylesSalute() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMDisabled(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeMStylesSalute() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeM(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeSStylesSalute() async throws {
        let appearance = Radiobox.s.appearance
        let radioBoxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeS(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeMDescriptionStylesSalute() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeMDescription(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeSLabelStylesSalute() async throws {
        let appearance = Radiobox.s.appearance
        let radioboxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeSLabel(appearance: appearance, radioBoxGroupAppearance: radioboxGroupAppearance))
    }
}
