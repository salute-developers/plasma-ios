//
//  NoteTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.11.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Note]
 */

/**
 PLASMA-T2315
 */
struct NoteCompactLDefaultTitleTextHasAction : View {
    var appearance: NoteCompactAppearance
    var linkButtonAppearance: ButtonAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNoteCompact(
            title: "Title",
            text: "Text",
            onClose: {}
        ) {
            Image.image("notePlasma")
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
        } action: {
            LinkButton(
                title: "Label",
                appearance: linkButtonAppearance
            ) {}
        }
        .environment(\.noteCompactAppearance, appearance)
    }
}

/**
 PLASMA-T2316
 */
struct NoteCompactMPositiveTitleTextHasClose : View {
    var appearance: NoteCompactAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNoteCompact(
            title: "Title",
            text: "Text",
            onClose: {}
        ) {
            Image.image("notePlasma")
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
        } action: {}
            .environment(\.noteCompactAppearance, appearance)
    }
}

/**
 PLASMA-T2317
 */
struct NoteSNegativeTitleTextHasAction : View {
    var appearance: NoteAppearance
    var linkButtonAppearance: ButtonAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNote(
            title: "Title",
            text: "Text",
            onClose: {}
        ) {
            Image.image("notePlasma")
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
        } action: {
            LinkButton(
                title: "Label",
                appearance: linkButtonAppearance
            ) {}
        }
        .environment(\.noteAppearance, appearance)
    }
}

/**
 PLASMA-T2318
 */
struct NoteXsWarningTitleTextHasClose : View {
    var appearance: NoteAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNote(
            title: "Title",
            text: "Text",
            onClose: {}
        ) {
            Image.image("notePlasma")
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
        } action: {}
            .environment(\.noteAppearance, appearance)
    }
}

/**
 PLASMA-T2319
 */
struct NoteCompactLInfoTitleLongTextHasClose : View {
    var appearance: NoteCompactAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNoteCompact(
            title: "Title",
            text: longText,
            onClose: {}
        ) {
            Image.image("notePlasma")
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
        } action: {}
            .environment(\.noteCompactAppearance, appearance)
    }
}

/**
 PLASMA-T2320
 */
struct NoteLDefaultLongTitleTextHasActionHasClose : View {
    var appearance: NoteAppearance
    var linkButtonAppearance: ButtonAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNote(
            title: longTitle,
            text: longText,
            onClose: {}
        ) {
            Image.image("notePlasma")
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
        } action: {
            LinkButton(
                title: "Label",
                appearance: linkButtonAppearance
            ) {}
        }
        .environment(\.noteAppearance, appearance)
    }
}

/**
 PLASMA-T2321
 */
struct NoteCompactLScalableDefaultTitleTextHasAction : View {
    var appearance: NoteCompactAppearance
    var linkButtonAppearance: ButtonAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNoteCompact(
            title: "Title",
            text: "Text",
            onClose: {}
        ) {
            Image.image("notePlasma")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
                .applyIf(appearance.size.iconSize == 0) {
                    $0.frame(width: 36, height: 36)
                }
        } action: {
            LinkButton(
                title: "Label",
                appearance: linkButtonAppearance
            ) {}
        }
        .environment(\.noteCompactAppearance, appearance)
    }
}

/**
 PLASMA-T2322
 */
struct NoteXsScalableInfoHasClose : View {
    var appearance: NoteAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNote(
            title: "Title",
            text: "Text",
            onClose: {}
        ) {
            Image.image("notePlasma")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
                .applyIf(appearance.size.iconSize == 0) {
                    $0.frame(width: 36, height: 36)
                }
        } action: {}
            .environment(\.noteAppearance, appearance)
    }
}

/**
 PLASMA-T2181
 */
struct NoteNoTextNoTitle : View {
    var appearance: NoteAppearance
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SDDSNote(
            title: "",
            text: "",
            onClose: {}
        ) {
            Image.image("notePlasma")
                .foregroundColor(appearance.iconColor.color(for: colorScheme))
        } action: {}
            .environment(\.noteAppearance, appearance)
    }
}

private let longTitle = "Lorem Ipsum is simply dummy text of the printing and typesetting"

private let longText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type 
specimen book. It has survived not only five centuries, but also the leap into 
electronic typesetting, remaining essentially unchanged. It was popularised in 
the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
and more recently with desktop publishing software like Aldus PageMaker including 
versions of Lorem Ipsum.
"""
