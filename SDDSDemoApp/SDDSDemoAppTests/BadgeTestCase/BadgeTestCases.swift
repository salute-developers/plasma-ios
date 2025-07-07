//
//  BadgeTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Badge, IconBadge]
 */

struct BadgeSizeLDefaultContentLeft: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeMAccentContentRight: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: Image.image("plasma"),
            alignment: .trailing,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeSPositivePilled: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeXsWarning: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeLNegative: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeMDark: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeSLight: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeLDefaultClear: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeLDefaultTransparent: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeMNegativeClear: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct BadgeSizeSWarningTransparent: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct IconBadgeSizeLDefault: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct IconBadgeSizeMAccentPilled: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct IconBadgeSizeSPositiveClear: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct IconBadgeSizeXsWarningTransparent: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct IconBadgeSizeLNegative: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct IconBadgeSizeMDark: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}

struct IconBadgeSizeSLight: View {
    var appearance: BadgeAppearance
    
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: appearance
        )
    }
}
