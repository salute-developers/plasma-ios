//
//  NoteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.11.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class NoteSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testNoteCompactLDefaultTitleTextHasAction() async throws {
        let noteCompactAppearance = NoteCompact.l.default.appearance
        let linkButtonAppearance = LinkButton.l.accent.appearance
        try await runSnapshotTest(view: NoteCompactLDefaultTitleTextHasAction(
            appearance: noteCompactAppearance, linkButtonAppearance: linkButtonAppearance)
        )
    }
    
    @MainActor
    func testNoteCompactMPositiveTitleTextHasClose() async throws {
        let noteCompactAppearance = NoteCompact.m.hasClose.positive.appearance
        try await runSnapshotTest(view: NoteCompactMPositiveTitleTextHasClose(appearance: noteCompactAppearance))
    }
    
    @MainActor
    func testNoteSNegativeTitleTextHasAction() async throws {
        let noteAppearance = Note.s.negative.appearance
        let linkButtonAppearance = LinkButton.s.accent.appearance
        try await runSnapshotTest(view: NoteSNegativeTitleTextHasAction(
            appearance: noteAppearance, linkButtonAppearance: linkButtonAppearance)
        )
    }
    
    @MainActor
    func testNoteXsWarningTitleTextHasClose() async throws {
        let noteAppearance = Note.xs.hasClose.warning.appearance
        try await runSnapshotTest(view: NoteXsWarningTitleTextHasClose(appearance: noteAppearance))
    }
    
    @MainActor
    func testNoteCompactLInfoTitleLongTextHasClose() async throws {
        let noteCompactAppearance = NoteCompact.l.hasClose.info.appearance
        try await runSnapshotTest(view: NoteCompactLInfoTitleLongTextHasClose(appearance: noteCompactAppearance))
    }
    
    @MainActor
    func testNoteLDefaultLongTitleTextHasActionHasClose() async throws {
        let noteAppearance = Note.l.hasClose.default.appearance
        let linkButtonAppearance = LinkButton.l.accent.appearance
        try await runSnapshotTest(view: NoteLDefaultLongTitleTextHasActionHasClose(appearance: noteAppearance, linkButtonAppearance: linkButtonAppearance))
    }
    
    @MainActor
    func testNoteCompactLScalableDefaultTitleTextHasAction() async throws {
        let noteCompactAppearance = NoteCompact.l.contentScalable.default.appearance
        let linkButtonAppearance = LinkButton.l.accent.appearance
        try await runSnapshotTest(view: NoteCompactLScalableDefaultTitleTextHasAction(
            appearance: noteCompactAppearance, linkButtonAppearance: linkButtonAppearance))
    }
    
    @MainActor
    func testNoteXsScalableInfoHasClose() async throws {
        let noteAppearance = Note.xs.hasCloseContentScalable.info.appearance
        try await runSnapshotTest(view: NoteXsScalableInfoHasClose(appearance: noteAppearance))
    }
    
    @MainActor
    func testNoteNoTextNoTitle() async throws {
        let noteAppearance = Note.l.default.appearance
        try await runSnapshotTest(view: NoteNoTextNoTitle(appearance: noteAppearance))
    }
}
