//
//  CellTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Cell]
 */

struct CellSizeLAvatarHasDisclosure: View {
    var appearance: CellAppearance

    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "Label",
            title: "Title",
            subtitle: "Subtitle",
            disclosureEnabled: true,
            disclosureText: "",
            leftContent: {
                AvatarTestVariation.avatar
            },
            rightContent: {}
        )
    }
}

struct CellSizeMTitleAvatar: View {
    var appearance: CellAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "",
            title: "Title",
            subtitle: "",
            disclosureEnabled: false,
            disclosureText: "",
            leftContent: {
                AvatarTestVariation.avatar
            },
            rightContent: {}
        )
    }
}

struct CellSizeSSubtitleHasDisclosure: View {
    var appearance: CellAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "",
            title: "",
            subtitle: "Subtitle",
            disclosureEnabled: true,
            disclosureText: "",
            leftContent: {},
            rightContent: {}
        )
    }
}

struct CellSizeXsLabelAvatar: View {
    var appearance: CellAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "Label",
            title: "",
            subtitle: "",
            disclosureEnabled: false,
            disclosureText: "",
            leftContent: {
                AvatarTestVariation.avatar
            },
            rightContent: {}
        )
    }
}

struct CellLHasDisclosureText: View {
    var appearance: CellAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "Label",
            title: "Title",
            subtitle: "Subtitle",
            disclosureEnabled: true,
            disclosureText: "text",
            leftContent: {},
            rightContent: {}
        )
    }
}

struct CellSizeMAvatarIcon: View {
    var appearance: CellAppearance
    var iconButtonAppearance: ButtonAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "Label",
            title: "Title",
            subtitle: "",
            disclosureEnabled: false,
            disclosureText: "",
            leftContent: {
                AvatarTestVariation.avatar
            },
            rightContent: {
                IconButton(
                    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                    isDisabled: false,
                    isLoading: false,
                    spinnerImage: Image.image("spinner"),
                    appearance: iconButtonAppearance,
                    layoutMode: .fixedWidth(.packed),
                    action: {}
                )
            }
        )
    }
}

struct CellSizeSIconHasDisclosureText: View {
    var appearance: CellAppearance
    var iconButtonAppearance: ButtonAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "",
            title: "Title",
            subtitle: "Subtitle",
            disclosureEnabled: true,
            disclosureText: "text",
            leftContent: {
                IconButton(
                    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                    isDisabled: false,
                    isLoading: false,
                    spinnerImage: Image.image("spinner"),
                    appearance: iconButtonAppearance,
                    layoutMode: .fixedWidth(.packed),
                    action: {}
                )
            },
            rightContent: {}
        )
    }
}

struct CellSizeXsRadioboxAvatar: View {
    var appearance: CellAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "Label",
            title: "Title",
            subtitle: "Subtitle",
            disclosureEnabled: false,
            disclosureText: "",
            leftContent: {
                RadioboxTestVariation.radiobox
            },
            rightContent: {
                AvatarTestVariation.avatar
            }
        )
    }
}

struct CellSizeLSwitchCheckbox: View {
    var appearance: CellAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "",
            title: "Title",
            subtitle: "",
            disclosureEnabled: false,
            disclosureText: "",
            leftContent: {
                SwitchTestVaration.`switch`
            },
            rightContent: {
                CheckboxTestVariation.checkbox
            }
        )
    }
}

struct CellSizeMCheckboxHasDisclosure: View {
    var appearance: CellAppearance
    
    var body: some View {
        SDDSCell(
            appearance: appearance,
            label: "Label",
            title: "",
            subtitle: "",
            disclosureEnabled: true,
            disclosureText: "",
            leftContent: {
                CheckboxTestVariation.checkbox
            },
            rightContent: {}
        )
    }
}

internal struct IconButtonTestVariation {
    var iconButtonAppearance: ButtonAppearance
    var iconbutton: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: iconButtonAppearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

internal struct CheckboxTestVariation {
    static var checkbox: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "",
            subtitle: "",
            isEnabled: true
        )
    }
}

internal struct RadioboxTestVariation {
    static var radiobox: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "",
            subtitle: "",
            isEnabled: true
        )
    }
}

internal struct AvatarTestVariation {
    static var avatar: some View {
        SDDSAvatar(
            text: "AM",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            accessibility: AvatarAccessibility()
        )
    }
}

internal struct SwitchTestVaration {
    static var `switch`: some View {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
