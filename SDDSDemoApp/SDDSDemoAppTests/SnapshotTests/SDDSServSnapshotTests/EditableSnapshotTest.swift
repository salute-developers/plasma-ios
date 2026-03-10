//
//  EditableSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 10.03.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class EditableSnapshotTest: SDDSServThemeTestCase {
    
    
    @MainActor
    func testEditableSingleLineRelativeStartH1() async throws {
        let appearance = Editable.h1.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableDisabledH2() async throws {
        let appearance = Editable.h2.appearance
        try await runSnapshotTest(view: EditableDisabled(appearance: appearance))
    }
    
    @MainActor
    func testEditableMultiLineAbsoluteEndH3() async throws {
        let appearance = Editable.h3.appearance
        try await runSnapshotTest(view: EditableMultiLineAbsoluteEnd(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineRelativeStartH4() async throws {
        let appearance = Editable.h4.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineAbsoluteCenterLongTextH5() async throws {
        let appearance = Editable.h5.appearance
        try await runSnapshotTest(view: EditableSingleLineAbsoluteCenterLongText(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineRelativeStartBodyL() async throws {
        let appearance = Editable.bodyL.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableMultiLineRelativeCenterBodyM() async throws {
        let appearance = Editable.bodyM.appearance
        try await runSnapshotTest(view: EditableMultiLineRelativeCenter(appearance: appearance))
    }
    
    @MainActor
    func testEditableReadOnlyBodyS() async throws {
        let appearance = Editable.bodyS.appearance
        try await runSnapshotTest(view: EditableReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testEditableMultiLineRelativeCenterLongTextBodyXs() async throws {
        let appearance = Editable.bodyXs.appearance
        try await runSnapshotTest(view: EditableMultiLineRelativeCenterLongText(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineRelativeStartBodyXxs() async throws {
        let appearance = Editable.bodyXxs.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableNoText() async throws {
        let appearance = Editable.h1.appearance
        try await runSnapshotTest(view: EditableNoText(appearance: appearance))
    }
}
