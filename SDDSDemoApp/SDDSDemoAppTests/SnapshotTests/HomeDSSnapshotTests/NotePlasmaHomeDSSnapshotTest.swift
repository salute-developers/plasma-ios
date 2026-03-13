//
//  NotePlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.03.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class NotePlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testNoteCompactLDefaultTitleTextHasActionHomeDS() async throws {
        let noteCompactAppearance = NoteCompact.contentBeforeFixed.default.appearance
        let linkButtonAppearance = LinkButton.l.accent.appearance
        try await runSnapshotTest(view: NoteCompactLDefaultTitleTextHasAction(
            appearance: noteCompactAppearance, linkButtonAppearance: linkButtonAppearance)
        )
    }
    
    @MainActor
    func testNoteCompactMPositiveTitleTextHasCloseHomeDS() async throws {
        let noteCompactAppearance = NoteCompact.contentBeforeFixed.hasClose.positive.appearance
        try await runSnapshotTest(view: NoteCompactMPositiveTitleTextHasClose(appearance: noteCompactAppearance))
    }
    
    @MainActor
    func testNoteSNegativeTitleTextHasActionHomeDS() async throws {
        let noteAppearance = Note.contentBeforeFixed.negative.appearance
        let linkButtonAppearance = LinkButton.s.accent.appearance
        try await runSnapshotTest(view: NoteSNegativeTitleTextHasAction(
            appearance: noteAppearance, linkButtonAppearance: linkButtonAppearance)
        )
    }
    
    @MainActor
    func testNoteXsWarningTitleTextHasCloseHomeDS() async throws {
        let noteAppearance = Note.contentBeforeFixed.hasClose.warning.appearance
        try await runSnapshotTest(view: NoteXsWarningTitleTextHasClose(appearance: noteAppearance))
    }
    
    @MainActor
    func testNoteCompactLInfoTitleLongTextHasCloseHomeDS() async throws {
        let noteCompactAppearance = NoteCompact.contentBeforeFixed.hasClose.info.appearance
        try await runSnapshotTest(view: NoteCompactLInfoTitleLongTextHasClose(appearance: noteCompactAppearance))
    }
    
    @MainActor
    func testNoteLDefaultLongTitleTextHasActionHasCloseHomeDS() async throws {
        let noteAppearance = Note.contentBeforeFixed.hasClose.default.appearance
        let linkButtonAppearance = LinkButton.l.accent.appearance
        try await runSnapshotTest(view: NoteLDefaultLongTitleTextHasActionHasClose(
            appearance: noteAppearance,
            linkButtonAppearance: linkButtonAppearance)
        )
    }
    
    @MainActor
    func testNoteCompactLScalableDefaultTitleTextHasActionHomeDS() async throws {
        let noteCompactAppearance = NoteCompact.contentBeforeScalable.hasClose.default.appearance
        let linkButtonAppearance = LinkButton.l.accent.appearance
        try await runSnapshotTest(view: NoteCompactLScalableDefaultTitleTextHasAction(
            appearance: noteCompactAppearance, linkButtonAppearance: linkButtonAppearance))
    }
    
    @MainActor
    func testNoteXsScalableInfoHasCloseHomeDS() async throws {
        let noteAppearance = Note.contentBeforeScalable.hasClose.info.appearance
        try await runSnapshotTest(view: NoteXsScalableInfoHasClose(appearance: noteAppearance))
    }
    
    @MainActor
    func testNoteNoTextNoTitleHomeDS() async throws {
        let noteAppearance = Note.contentBeforeFixed.default.appearance
        try await runSnapshotTest(view: NoteNoTextNoTitle(appearance: noteAppearance))
    }
}
