//
//  ButtonGroupTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.09.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [ButtonGroup]
 */

/**
 PLASMA-T1366
 */
struct ButtonGroupLDefaultNoGap: View {
    var appearance: ButtonAppearance
    var buttonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...5).map { index in
            ButtonData(
                title: "Label \(index)",
                buttonStyle: .basic,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: buttonGroupAppearance,
            layout: .horizontal
        )
    }
}

/**
 PLASMA-T2144
 */
struct ButtonGroupMDenseDefaultHorizontal: View {
    var appearance: ButtonAppearance
    var buttonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...3).map { index in
            ButtonData(
                title: "Label \(index)",
                buttonStyle: .basic,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: buttonGroupAppearance,
            layout: .horizontal
        )
    }
}

/**
 PLASMA-T2145
 */
struct ButtonGroupSWideDefaultSegmentedHorizontal: View {
    var appearance: ButtonAppearance
    var buttonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...3).map { index in
            ButtonData(
                title: "Label \(index)",
                buttonStyle: .basic,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: buttonGroupAppearance,
            layout: .horizontal
        )
    }
}

/**
 PLASMA-T2146
 */
struct ButtonGroupXsGapNoneDefaultVertical: View {
    var appearance: ButtonAppearance
    var buttonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...3).map { index in
            ButtonData(
                title: "Label \(index)",
                buttonStyle: .basic,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: buttonGroupAppearance,
            layout: .vertical
        )
    }
}

/**
 PLASMA-T2147
 */
struct ButtonGroupXxsItemCountTenDefaultSegmented: View {
    var appearance: ButtonAppearance
    var buttonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...10).map { index in
            ButtonData(
                title: "Label \(index)",
                buttonStyle: .basic,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: buttonGroupAppearance,
            layout: .horizontal
        )
    }
}

/**
 PLASMA-T2152
 */
struct IconButtonGroupAmountThreeHorizontal: View {
    var appearance: ButtonAppearance
    var iconButtonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...3).map { index in
            ButtonData(
                title: "Label \(index)",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                buttonStyle: .icon,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: iconButtonGroupAppearance,
            layout: .horizontal
        )
    }
}

/**
 PLASMA-T2156
 */
struct IconButtonGroupAmountThreeVertical: View {
    var appearance: ButtonAppearance
    var iconButtonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...3).map { index in
            ButtonData(
                title: "Label \(index)",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                buttonStyle: .icon,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: iconButtonGroupAppearance,
            layout: .vertical
        )
    }
}

/**
 PLASMA-T2157
 */
struct IconButtonGroupAmountTenHorizontal: View {
    var appearance: ButtonAppearance
    var iconButtonGroupAppearance: ButtonGroupAppearance
    
    var body: some View {
        let buttonData = (1...10).map { index in
            ButtonData(
                title: "Label \(index)",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                buttonStyle: .icon,
                appearance: appearance,
                action: {}
            )
        }
        SDDSButtonGroup(
            data: buttonData,
            appearance: iconButtonGroupAppearance,
            layout: .horizontal
        )
    }
}
