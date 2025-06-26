//
//  ChipTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
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

struct ChipGroupLDense: View {
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: Chip.l.default.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: ChipGroupDense.l.default.appearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}

struct ChipGroupMSecondary: View {
    var body: some View {
        let chipData = (0..<20).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: Chip.m.secondary.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: ChipGroupWide.m.secondary.appearance
        )
        .frame(width: 375, height: 250, alignment: .top)
    }
}

struct ChipGroupSAccent: View {
    var body: some View {
        let chipData = (0..<20).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: Chip.s.accent.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: ChipGroupDense.s.accent.appearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}

struct ChipGroupXs: View {
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: Chip.xs.default.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: ChipGroupDense.xs.default.appearance
        )
        .frame(width: 275, height: 20, alignment: .top)
    }
}

struct ChipGroupLSecondaryPilled: View {
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: Image.image("chipIcon"),
                buttonImage: Image.image("chipClose"),
                appearance: Chip.l.pilled.secondary.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: ChipGroupDense.l.pilled.secondary.appearance
        )
        .frame(width: 375, height: 140, alignment: .top)
    }
}

struct ChipGroupMAccentWide: View {
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("chipClose"),
                appearance: Chip.m.accent.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: ChipGroupWide.m.accent.appearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}

struct ChipGroupLSecondaryHasClose: View {
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("chipClose"),
                appearance: Chip.l.secondary.appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: ChipGroupDense.l.secondary.appearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}
