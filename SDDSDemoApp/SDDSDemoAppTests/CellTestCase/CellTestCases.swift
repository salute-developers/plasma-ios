//
//  CellTestCases.swift
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
Тест-кейсы для компонента [Cell]
 */

struct CellSizeLAvatarHasDisclosure: View {
    var body: some View {
        SDDSCell(
            appearance: Cell.l.appearance,
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
    var body: some View {
        SDDSCell(
            appearance: Cell.m.appearance,
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
    var body: some View {
        SDDSCell(
            appearance: Cell.s.appearance,
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
    var body: some View {
        SDDSCell(
            appearance: Cell.xs.appearance,
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
    var body: some View {
        SDDSCell(
            appearance: Cell.l.appearance,
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
    var body: some View {
        SDDSCell(
            appearance: Cell.m.appearance,
            label: "Label",
            title: "Title",
            subtitle: "",
            disclosureEnabled: false,
            disclosureText: "",
            leftContent: {
                AvatarTestVariation.avatar
            },
            rightContent: {
                IconButtonTestVariation.iconbutton
            }
        )
    }
}

struct CellSizeSIconHasDisclosureText: View {
    var body: some View {
        SDDSCell(
            appearance: Cell.s.appearance,
            label: "",
            title: "Title",
            subtitle: "Subtitle",
            disclosureEnabled: true,
            disclosureText: "text",
            leftContent: {
                IconButtonTestVariation.iconbutton
            },
            rightContent: {}
        )
    }
}

struct CellSizeXsRadioboxAvatar: View {
    var body: some View {
        SDDSCell(
            appearance: Cell.xs.appearance,
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
    var body: some View {
        SDDSCell(
            appearance: Cell.xs.appearance,
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
    var body: some View {
        SDDSCell(
            appearance: Cell.m.appearance,
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
   static var iconbutton: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.s.clear.appearance,
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
