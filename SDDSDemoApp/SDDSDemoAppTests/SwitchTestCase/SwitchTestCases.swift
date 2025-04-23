//
//  SwitchTestCases.swift
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
Тест-кейсы для компонента [Chip]
 */

struct SwitchSizeL: View {
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            appearance: Switch.l.appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeM: View {
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "",
            isOn: .constant(false),
            isEnabled: true,
            appearance: Switch.m.appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeS: View {
    var body: some View {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            appearance: Switch.s.appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeDisabled: View {
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: false,
            appearance: Switch.m.appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchSizeDisabledOff: View {
    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: .constant(false),
            isEnabled: false,
            appearance: Switch.m.appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
