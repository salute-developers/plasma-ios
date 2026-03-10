//
//  EditablePlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 10.03.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class EditablePlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testEditableSingleLineRelativeStartH1PlasmaHomeDS() async throws {
        let appearance = Editable.h1.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableDisabledH2PlasmaHomeDS() async throws {
        let appearance = Editable.h2.appearance
        try await runSnapshotTest(view: EditableDisabled(appearance: appearance))
    }
    
    @MainActor
    func testEditableMultiLineAbsoluteEndH3PlasmaHomeDS() async throws {
        let appearance = Editable.h3.appearance
        try await runSnapshotTest(view: EditableMultiLineAbsoluteEnd(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineRelativeStartH4PlasmaHomeDS() async throws {
        let appearance = Editable.h4.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineAbsoluteCenterLongTextH5PlasmaHomeDS() async throws {
        let appearance = Editable.h5.appearance
        try await runSnapshotTest(view: EditableSingleLineAbsoluteCenterLongText(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineRelativeStartH6PlasmaHomeDS() async throws {
        let appearance = Editable.h6.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStartLongText(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineRelativeStartBodyLPlasmaHomeDS() async throws {
        let appearance = Editable.bodyL.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableMultiLineRelativeCenterBodyMPlasmaHomeDS() async throws {
        let appearance = Editable.bodyM.appearance
        try await runSnapshotTest(view: EditableMultiLineRelativeCenter(appearance: appearance))
    }
    
    @MainActor
    func testEditableReadOnlyBodySPlasmaHomeDS() async throws {
        let appearance = Editable.bodyS.appearance
        try await runSnapshotTest(view: EditableReadOnly(appearance: appearance))
    }
    
    @MainActor
    func testEditableMultiLineRelativeCenterLongTextBodyXsPlasmaHomeDS() async throws {
        let appearance = Editable.bodyXs.appearance
        try await runSnapshotTest(view: EditableMultiLineRelativeCenterLongText(appearance: appearance))
    }
    
    @MainActor
    func testEditableSingleLineRelativeStartBodyXxsPlasmaHomeDS() async throws {
        let appearance = Editable.bodyXxs.appearance
        try await runSnapshotTest(view: EditableSingleLineRelativeStart(appearance: appearance))
    }
    
    @MainActor
    func testEditableNoTextPlasmaHomeDS() async throws {
        let appearance = Editable.h1.appearance
        try await runSnapshotTest(view: EditableNoText(appearance: appearance))
    }
}
