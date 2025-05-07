//
//  ChipTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Chip]
 */

struct ChipSizeLDefaultHasClear: View {
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("chipClose"),
            appearance: Chip.l.default.appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeMSecondaryPilled: View {
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: Chip.m.pilled.secondary.appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeSAccent: View {
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: Chip.s.accent.appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeXsDefaultIcon: View {
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: nil,
            appearance: Chip.xs.default.appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeLDisabled: View {
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: false,
            iconImage: nil,
            buttonImage: Image.image("chipClose"),
            appearance: Chip.l.default.appearance,
            removeAction: {}
        )
    }
}
