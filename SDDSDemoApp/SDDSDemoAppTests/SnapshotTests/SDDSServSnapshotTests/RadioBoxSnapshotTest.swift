//
//  RadioBoxSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class RadioBoxSnapshotTest: XCTestCase {
    
    @MainActor
    func testRadioBoxSizeM() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeM(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeSUnchecked() async throws {
        let appearance = Radiobox.s.appearance
        try await runSnapshotTest(view: RadioBoxSizeSUnchecked(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMNoDescription() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMNoDescription(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxSizeMDisabled() async throws {
        let appearance = Radiobox.m.appearance
        try await runSnapshotTest(view: RadioBoxSizeMDisabled(appearance: appearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeM() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeM(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeS() async throws {
        let appearance = Radiobox.s.appearance
        let radioBoxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeS(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeMDescription() async throws {
        let appearance = Radiobox.m.appearance
        let radioBoxGroupAppearance = RadioboxGroup.m.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeMDescription(appearance: appearance, radioBoxGroupAppearance: radioBoxGroupAppearance))
    }
    
    @MainActor
    func testRadioBoxGroupSizeSLabel() async throws {
        let appearance = Radiobox.s.appearance
        let radioboxGroupAppearance = RadioboxGroup.s.appearance
        try await runSnapshotTest(view: RadioBoxGroupSizeSLabel(appearance: appearance, radioBoxGroupAppearance: radioboxGroupAppearance))
    }
}
