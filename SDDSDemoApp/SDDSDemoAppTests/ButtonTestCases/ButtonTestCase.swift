//
//  ButtonTestCase.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 15.04.2025.
//
import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Button, IconButton, LinkButton]
 */

struct ButtonLDefault: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.l.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonMAccent: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.m.accent.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonSWarning: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.s.warning.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonXsDark: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: nil,
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.xs.dark.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonLIsLoading: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.l.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonLIsDisabled: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.l.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonLSecondary: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.l.secondary.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct ButtonMClearSpaceBetween: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.m.clear.appearance,
            layoutMode: .fixedWidth(.spaceBetween),
            action: {}
        )
    }
}

struct ButtonSPositiveLongText: View {
    var body: some View {
        BasicButton(
            title: "LabelLabelLabelLabelLabelLabelLabelLabel",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.s.positive.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonXlDefault: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.xl.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonXxsDefault: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.xxs.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct IсonButtonLDefault: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.l.default.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonMAccent: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.m.accent.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonSWarning: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.s.warning.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXsDark: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.xs.dark.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonIsLoading: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.l.default.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonIsDisabled: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.l.default.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonLSecondaryPilled: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.l.pilled.secondary.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonMClear: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.m.clear.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonSPositive: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.s.positive.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXsNegativePilledIsLoading: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.xs.pilled.negative.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonLWhite: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.l.white.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXlDefault: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.xl.default.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXxsDefault: View {
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.xxs.default.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct LinkButtonLDefault: View {
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.l.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonLIsLoading: View {
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.l.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonLSecondary: View {
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.l.secondary.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonMAccent: View {
    var body: some View {
        LinkButton(
            title: "Label",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.m.accent.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonLIsDisabled: View {
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.l.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonSWarning: View {
    var body: some View {
        LinkButton(
            title: "Label",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.s.warning.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonXsNegative: View {
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.xs.negative.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonXlDefault: View {
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.xl.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonXxsDefault: View {
    var body: some View {
        LinkButton(
            title: "Label",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: LinkButton.xxs.default.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

