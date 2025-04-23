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
            appearance: Avatar.m.default.appearance,
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
            appearance: Avatar.xxl.default.appearance,
            accessibility: AvatarAccessibility()
        )
    }
}

struct AvatarGroupSizeS: View {
    var body: some View {
        SDDSAvatarGroup(
            data: exampleAvatars,
            lastAvatar: lastAvatarData,
            size: defaultSize
        )
    }
}
    
var exampleAvatars: [SDDSAvatarData] = (1...2).map { i in
    SDDSAvatarData(
        text: "MS",
        image: .image(Image.image("checker")),
        placeholderImage: nil,
        status: .online,
        appearance: Avatar.s.default.appearance,
        accessibility: AvatarAccessibility()
    )
}

    var lastAvatarData: SDDSAvatarData {
        SDDSAvatarData(
            text: "+3",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.s.default.appearance,
            accessibility: AvatarAccessibility()
        )
    }

var defaultSize: AvatarGroupSizeConfiguration {
        DefaultAvatarGroupSize()
    }

struct DefaultAvatarGroupSize: AvatarGroupSizeConfiguration {
    var maxDisplayingAvatarCount: Int { 1 }
    var borderWidth: CGFloat { 1 }
    var spacing: CGFloat { 5 }
}
