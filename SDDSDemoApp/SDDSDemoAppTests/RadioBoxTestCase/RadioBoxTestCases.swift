//
//  RadioBoxTestCases.swift
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
Тест-кейсы для компонента [RadioBox, RadioBoxGroup]
 */

struct RadioBoxSizeM: View {
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Radiobox.m.appearance
        )
    }
}

struct RadioBoxSizeSUnchecked: View {
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(false),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Radiobox.s.appearance
        )
    }
}

struct RadioBoxSizeMNoDescription: View {
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "",
            isEnabled: true,
            appearance: Radiobox.m.appearance
        )
    }
}

struct RadioBoxSizeMDisabled: View {
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "Description",
            isEnabled: false,
            appearance: Radiobox.m.appearance
        )
    }
}

struct RadioBoxGroupSizeM: View {
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "Label",
                subtitle: "Description",
                isSelected: .constant(index == 0),
                appearance: Radiobox.m.appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.medium,
            appearance: RadioboxGroup.m.appearance
        )
    }
}

struct RadioBoxGroupSizeS: View {
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "Label",
                subtitle: "Description",
                isSelected: .constant(index == 1),
                appearance: Radiobox.s.appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.small,
            appearance: RadioboxGroup.s.appearance
        )
    }
}

struct RadioBoxGroupSizeMDescription: View {
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "",
                subtitle: "Description",
                isSelected: .constant(index == 0),
                appearance: Radiobox.m.appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.medium,
            appearance: RadioboxGroup.m.appearance
        )
    }
}

struct RadioBoxGroupSizeSLabel: View {
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "Label",
                subtitle: "",
                isSelected: .constant(index == 1),
                appearance: Radiobox.s.appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.small,
            appearance: RadioboxGroup.s.appearance
        )
    }
}
