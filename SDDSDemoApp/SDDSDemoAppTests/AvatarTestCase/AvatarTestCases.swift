//
//  AvatarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons
/**
 Теск-кейсы для компонента [Avatar, AvatarGroup]
 */
struct AvatarSizeM: View {
    var appearance: AvatarAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .online,
            appearance: appearance,
            accessibility: AvatarAccessibility()
        )
    }
}

struct AvatarSizeXxl: View {
    var appearance: AvatarAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: appearance,
            accessibility: AvatarAccessibility()
        )
    }
}

struct AvatarGroupSizeS: View {
    var appearance: AvatarAppearance
    
    var body: some View {
        SDDSAvatarGroup(
            data: exampleAvatars(with: appearance),
            lastAvatar: lastAvatarData(with: appearance),
            appearance: AvatarGroupAppearance(
                size: defaultSize,
                avatarAppearance: lastAvatarData(with: appearance).appearance
            )
        )
    }
}

func exampleAvatars(with appearance: AvatarAppearance) -> [SDDSAvatarData] {
    (1...2).map { i in
        SDDSAvatarData(
            text: "MS",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: appearance,
            accessibility: AvatarAccessibility()
        )
    }
}
    
func lastAvatarData(with appearance: AvatarAppearance) -> SDDSAvatarData {
    SDDSAvatarData(
        text: "+3",
        image: nil,
        placeholderImage: nil,
        status: .hidden,
        appearance: appearance,
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
    var appearance: AvatarAppearance
    var counterAppearance: CounterAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .online,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topLeft,
                content: {
                    SDDSCounter(
                        text: "1",
                        appearance: counterAppearance,
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
    var appearance: AvatarAppearance
    var counterAppearance: CounterAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topRight,
                content: {
                    SDDSCounter(
                        text: "123",
                        appearance: counterAppearance,
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
    var appearance: AvatarAppearance
    var counterAppearance: CounterAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .hidden,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomRight,
                content: {
                        SDDSCounter(
                            text: "1",
                            appearance: counterAppearance,
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
    var appearance: AvatarAppearance
    var counterAppearance: CounterAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomLeft,
                content: {
                        SDDSCounter(
                            text: "1",
                            appearance: counterAppearance,
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
    var appearance: AvatarAppearance
    var badgeAppearance: BadgeAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .hidden,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topLeft,
                content: {
                    SDDSBadge(
                        label: "Label",
                        image: Image.image("plasma"),
                        alignment: .leading,
                        style: .basic,
                        appearance: badgeAppearance
                    )
                }
            )
        )
    }
}

struct AvatarSizeXxlBadgeBottomRight: View {
    var appearance: AvatarAppearance
    var badgeAppearance: BadgeAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomRight,
                content: {
                    SDDSBadge(
                        label: "Label",
                        image: Image.image("plasma"),
                        alignment: .trailing,
                        style: .basic,
                        appearance: badgeAppearance
                    )
                }
            )
        )
    }
}

struct AvatarSizeLBadgeTopRight: View {
    var appearance: AvatarAppearance
    var badgeAppearance: BadgeAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .online,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .topRight,
                content: {
                    SDDSBadge(
                        label: "",
                        image: Image.image("plasma"),
                        alignment: .leading,
                        style: .basic,
                        appearance: badgeAppearance
                    )
                }
            )
        )
    }
}

struct AvatarSizeMBadgeBottomLeft: View {
    var appearance: AvatarAppearance
    var badgeAppearance: BadgeAppearance
    
    var body: some View {
        SDDSAvatar(
            text: "MS",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: appearance,
            accessibility: AvatarAccessibility(),
            extra: AvatarExtra(
                placement: .bottomLeft,
                content: {
                    SDDSBadge(
                        label: "Label",
                        image: nil,
                        alignment: .leading,
                        style: .basic,
                        appearance: badgeAppearance
                    )
                }
            )
        )
    }
}
