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
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonMAccent: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonSWarning: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonXsDark: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: nil,
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonLIsLoading: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonLIsDisabled: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonLSecondary: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct ButtonMClearSpaceBetween: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.spaceBetween),
            action: {}
        )
    }
}

struct ButtonSPositiveLongText: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "LabelLabelLabelLabelLabelLabelLabelLabel",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonXlDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct ButtonXxsDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct IсonButtonLDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonMAccent: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonSWarning: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXsDark: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonIsLoading: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonIsDisabled: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonLSecondaryPilled: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonMClear: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonSPositive: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXsNegativePilledIsLoading: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonLWhite: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXlDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct IconButtonXxsDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
}

struct LinkButtonLDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonLIsLoading: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: true,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonLSecondary: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonMAccent: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonLIsDisabled: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: true,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonSWarning: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonXsNegative: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonXlDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

struct LinkButtonXxsDefault: View {
    var appearance: ButtonAppearance
    
    var body: some View {
        LinkButton(
            title: "Label",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}

