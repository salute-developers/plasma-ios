//
//  ChipTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Chip]
 */

struct ChipSizeLDefaultHasClear: View {
    var appearance: ChipAppearance
    
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("chipClose"),
            appearance: appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeMSecondaryPilled: View {
    var appearance: ChipAppearance
    
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeSAccent: View {
    var appearance: ChipAppearance
    
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeXsDefaultIcon: View {
    var appearance: ChipAppearance
    
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: nil,
            appearance: appearance,
            removeAction: {}
        )
    }
}

struct ChipSizeLDisabled: View {
    var appearance: ChipAppearance
    
    var body: some View {
        SDDSChip(
            title: "Label",
            isEnabled: false,
            iconImage: nil,
            buttonImage: Image.image("chipClose"),
            appearance: appearance,
            removeAction: {}
        )
    }
}

struct ChipGroupLDense: View {
    var appearance: ChipAppearance
    var chipGroupAppearance: ChipGroupAppearance
    
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: chipGroupAppearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}

struct ChipGroupMSecondary: View {
    var appearance: ChipAppearance
    var chipGroupAppearance: ChipGroupAppearance
    
    var body: some View {
        let chipData = (0..<20).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: chipGroupAppearance
        )
        .frame(width: 375, height: 250, alignment: .top)
    }
}

struct ChipGroupSAccent: View {
    var appearance: ChipAppearance
    var chipGroupAppearance: ChipGroupAppearance
    
    var body: some View {
        let chipData = (0..<20).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: chipGroupAppearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}

struct ChipGroupXs: View {
    var appearance: ChipAppearance
    var chipGroupAppearance: ChipGroupAppearance
    
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: nil,
                appearance: appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: chipGroupAppearance
        )
        .frame(width: 275, height: 20, alignment: .top)
    }
}

struct ChipGroupLSecondaryPilled: View {
    var appearance: ChipAppearance
    var chipGroupAppearance: ChipGroupAppearance
    
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: Image.image("chipIcon"),
                buttonImage: Image.image("chipClose"),
                appearance: appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: chipGroupAppearance
        )
        .frame(width: 375, height: 140, alignment: .top)
    }
}

struct ChipGroupMAccentWide: View {
    var appearance: ChipAppearance
    var chipGroupAppearance: ChipGroupAppearance
    
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("chipClose"),
                appearance: appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: chipGroupAppearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}

struct ChipGroupLSecondaryHasClose: View {
    var appearance: ChipAppearance
    var chipGroupAppearance: ChipGroupAppearance
    
    var body: some View {
        let chipData = (0..<5).map { _ in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: nil,
                buttonImage: Image.image("chipClose"),
                appearance: appearance,
                accessibility: ChipAccessibility(),
                removeAction: {}
            )
        }

        SDDSChipGroup(
            data: chipData,
            appearance: chipGroupAppearance
        )
        .frame(width: 375, height: 120, alignment: .top)
    }
}
