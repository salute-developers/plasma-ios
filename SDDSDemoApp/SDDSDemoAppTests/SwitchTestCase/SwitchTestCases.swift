//
//  SwitchTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSservTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Chip]
 */

struct SwitchSizeL: View {
    var appearance: SwitchAppearance
    
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            appearance: appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeM: View {
    var appearance: SwitchAppearance
    
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "",
            isOn: .constant(false),
            isEnabled: true,
            appearance: appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeS: View {
    var appearance: SwitchAppearance
    
    var body: some View {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            appearance: appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeDisabled: View {
    var appearance: SwitchAppearance
    
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: false,
            appearance: appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeDisabledOff: View {
    var appearance: SwitchAppearance
    
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: .constant(false),
            isEnabled: false,
            appearance: appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
