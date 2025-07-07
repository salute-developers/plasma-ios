//
//  AvatarTestCases.swift
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
 Теск-кейсы для компонента [Avatar, AvatarGroup]
 */
struct AvatarSizeM: View {
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .online,
            appearance: Avatar.m.appearance,
            accessibility: AvatarAccessibility()
        )
    }
}

struct AvatarSizeXxl: View {
    var body: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: Avatar.xxl.appearance,
            accessibility: AvatarAccessibility()
        )
    }
}

struct AvatarGroupSizeS: View {
    var body: some View {
        SDDSAvatarGroup(
            data: exampleAvatars,
            lastAvatar: lastAvatarData,
            appearance: AvatarGroupAppearance(
                size: defaultSize,
                avatarAppearance: lastAvatarData.appearance
            )
        )
    }
}
    
var exampleAvatars: [SDDSAvatarData] = (1...2).map { i in
    SDDSAvatarData(
        text: "MS",
        image: .image(Image.image("checker")),
        placeholderImage: nil,
        status: .online,
        appearance: Avatar.s.appearance,
        accessibility: AvatarAccessibility()
    )
}

    var lastAvatarData: SDDSAvatarData {
        SDDSAvatarData(
            text: "+3",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.s.appearance,
            accessibility: AvatarAccessibility()
        )
    }

var defaultSize: AvatarGroupSizeConfiguration {
        DefaultAvatarGroupSize()
    }

struct DefaultAvatarGroupSize: AvatarGroupSizeConfiguration {
    var borderWidth: CGFloat { 1 }
    var spacing: CGFloat { 5 }
}

struct AvatarSizeXxlCounterTopLeft: View {
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .online,
            appearance: Avatar.xxl.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topLeft,
                content: {
                    SDDSCounter(
                        text: "1",
                        appearance: Counter.m.negative.appearance,
                        isAnimating: false,
                        isHighlighted: false,
                        isHovered: false,
                        isSelected: false
                    )
                }
            )
        )
    }
}

struct AvatarSizeLCounterTopRight: View {
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.l.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topRight,
                content: {
                    SDDSCounter(
                        text: "123",
                        appearance: Counter.s.negative.appearance,
                        isAnimating: false,
                        isHighlighted: false,
                        isHovered: false,
                        isSelected: false
                    )
                }
            )
        )
    }
}

struct AvatarSizeMCounterBottomRight: View {
    var body: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.m.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomRight,
                content: {
                        SDDSCounter(
                            text: "1",
                            appearance: Counter.xs.negative.appearance,
                            isAnimating: false,
                            isHighlighted: false,
                            isHovered: false,
                            isSelected: false
                    )
                }
            )
        )
    }
}

struct AvatarSizeSCounterBottomLeft: View {
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.s.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomLeft,
                content: {
                        SDDSCounter(
                            text: "1",
                            appearance: Counter.xxs.negative.appearance,
                            isAnimating: false,
                            isHighlighted: false,
                            isHovered: false,
                            isSelected: false
                    )
                }
            )
        )
    }
}

struct AvatarSizeXxlBadgeTopLeft: View {
    var body: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.xxl.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topLeft,
                content: {
                    SDDSBadge(
                        label: "Label",
                        image: Image.image("plasma"),
                        alignment: .leading,
                        style: .basic,
                        appearance: Badge.m.pilled.accent.appearance
                    )
                }
            )
        )
    }
}

struct AvatarSizeXxlBadgeBottomRight: View {
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.xxl.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomRight,
                content: {
                    SDDSBadge(
                        label: "Label",
                        image: Image.image("plasma"),
                        alignment: .trailing,
                        style: .basic,
                        appearance: Badge.m.pilled.accent.appearance
                    )
                }
            )
        )
    }
}

struct AvatarSizeLBadgeTopRight: View {
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .online,
            appearance: Avatar.l.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topRight,
                content: {
                    SDDSBadge(
                        label: "",
                        image: Image.image("plasma"),
                        alignment: .leading,
                        style: .basic,
                        appearance: Badge.s.pilled.accent.appearance
                    )
                }
            )
        )
    }
}

struct AvatarSizeMBadgeBottomLeft: View {
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.m.appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomLeft,
                content: {
                    SDDSBadge(
                        label: "Label",
                        image: nil,
                        alignment: .leading,
                        style: .basic,
                        appearance: Badge.xs.pilled.accent.appearance
                    )
                }
            )
        )
    }
}
