//
//  BadgeTestCases.swift
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
 Тест-кейсы для компонента [Badge, IconBadge]
 */

struct BadgeSizeLDefaultContentLeft: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: Badge.l.default.appearance
        )
    }
}

struct BadgeSizeMAccentContentRight: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: Image.image("plasma"),
            alignment: .trailing,
            style: .basic,
            appearance: Badge.m.accent.appearance
        )
    }
}

struct BadgeSizeSPositivePilled: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: Badge.s.pilled.positive.appearance
        )
    }
}

struct BadgeSizeXsWarning: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: Badge.xs.warning.appearance
        )
    }
}

struct BadgeSizeLNegative: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: Badge.l.negative.appearance
        )
    }
}

struct BadgeSizeMDark: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: Badge.m.dark.appearance
        )
    }
}

struct BadgeSizeSLight: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: Badge.s.light.appearance
        )
    }
}

struct BadgeSizeLDefaultClear: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: BadgeClear.l.default.appearance
        )
    }
}

struct BadgeSizeLDefaultTransparent: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: BadgeTransparent.l.default.appearance
        )
    }
}

struct BadgeSizeMNegativeClear: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: BadgeClear.m.negative.appearance
        )
    }
}

struct BadgeSizeSWarningTransparent: View {
    var body: some View {
        BasicBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: BadgeTransparent.s.pilled.warning.appearance
        )
    }
}

struct IconBadgeSizeLDefault: View {
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: IconBadge.l.default.appearance
        )
    }
}

struct IconBadgeSizeMAccentPilled: View {
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: IconBadge.m.pilled.accent.appearance
        )
    }
}

struct IconBadgeSizeSPositiveClear: View {
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: IconBadgeClear.s.positive.appearance
        )
    }
}

struct IconBadgeSizeXsWarningTransparent: View {
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: IconBadgeTransparent.xs.warning.appearance
        )
    }
}

struct IconBadgeSizeLNegative: View {
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: IconBadge.l.negative.appearance
        )
    }
}

struct IconBadgeSizeMDark: View {
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: IconBadge.m.dark.appearance
        )
    }
}

struct IconBadgeSizeSLight: View {
    var body: some View {
        IconBadge(
            label: "",
            image: Image.image("plasma"),
            alignment: .leading,
            style: .basic,
            appearance: IconBadge.s.light.appearance
        )
    }
}
