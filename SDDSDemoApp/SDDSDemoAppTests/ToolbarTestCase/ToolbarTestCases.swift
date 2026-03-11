//
//  ToolbarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 11.03.2026.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Toolbar]
 */
struct ToolbarNoDivider: View {
    let appearance: ToolbarAppearance
    let buttonAppearance: ButtonAppearance
    let iconButtonAppearance: ButtonAppearance
    
    var body: some View {
        VStack {
            SDDSToolbar(
                slots: toolbarData(iconButtonApearance: iconButtonAppearance, buttonAppearance: buttonAppearance),
                slotsAmount: 3,
                hasDivider: false,
                appearance: appearance
            )
        }.background(Color(.systemGray6))
    }
}

struct ToolbarHasDivider: View {
    let appearance: ToolbarAppearance
    let buttonAppearance: ButtonAppearance
    let iconButtonAppearance: ButtonAppearance
    
    var body: some View {
        VStack {
            SDDSToolbar(
                slots: toolbarData(iconButtonApearance: iconButtonAppearance, buttonAppearance: buttonAppearance),
                slotsAmount: 3,
                hasDivider: true,
                appearance: appearance
            )
        }.background(Color(.systemGray6))
    }
}

private func toolbarData(
    iconButtonApearance: ButtonAppearance,
    buttonAppearance: ButtonAppearance
) -> [ToolbarSlotData] {
    let iconButtons = [
        AnyView(
            IconButton(
                iconAttributes: ButtonIconAttributes(image: Asset.starFill36.image, alignment: .leading),
                appearance: iconButtonApearance,
                action: {}
            )
        ),
        AnyView(
            IconButton(
                iconAttributes: ButtonIconAttributes(image: Asset.starFill36.image, alignment: .leading),
                appearance: iconButtonApearance,
                action: {}
            )
        )
    ]
    
    return [
        ToolbarSlotData(views: iconButtons),
        ToolbarSlotData(
            views: [
                AnyView(
                    BasicButton(
                        title: "Label",
                        subtitle: "",
                        appearance: buttonAppearance,
                        action: {}
                    )
                )
            ]),
        ToolbarSlotData(views: iconButtons)
    ]
}
