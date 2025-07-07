//
//  RadioBoxTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [RadioBox, RadioBoxGroup]
 */

struct RadioBoxSizeM: View {
    var appearance: RadioboxAppearance
    
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct RadioBoxSizeSUnchecked: View {
    var appearance: RadioboxAppearance
    
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(false),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct RadioBoxSizeMNoDescription: View {
    var appearance: RadioboxAppearance
    
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct RadioBoxSizeMDisabled: View {
    var appearance: RadioboxAppearance
    
    var body: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "Description",
            isEnabled: false,
            appearance: appearance
        )
    }
}

struct RadioBoxGroupSizeM: View {
    var appearance: RadioboxAppearance
    var radioBoxGroupAppearance: RadioboxGroupAppearance
    
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "Label",
                subtitle: "Description",
                isSelected: .constant(index == 0),
                appearance: appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.medium,
            appearance: radioBoxGroupAppearance
        )
    }
}

struct RadioBoxGroupSizeS: View {
    var appearance: RadioboxAppearance
    var radioBoxGroupAppearance: RadioboxGroupAppearance
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "Label",
                subtitle: "Description",
                isSelected: .constant(index == 1),
                appearance: appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.small,
            appearance: radioBoxGroupAppearance
        )
    }
}

struct RadioBoxGroupSizeMDescription: View {
    var appearance: RadioboxAppearance
    var radioBoxGroupAppearance: RadioboxGroupAppearance
    
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "",
                subtitle: "Description",
                isSelected: .constant(index == 0),
                appearance: appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.medium,
            appearance: radioBoxGroupAppearance
        )
    }
}

struct RadioBoxGroupSizeSLabel: View {
    var appearance: RadioboxAppearance
    var radioBoxGroupAppearance: RadioboxGroupAppearance
    
    var body: some View {
        let radioboxData = (0...2).map {index in
            RadioboxData(
                title: "Label",
                subtitle: "",
                isSelected: .constant(index == 1),
                appearance: appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(
            radioboxData: radioboxData,
            size: SDDSRadioboxGroupSize.small,
            appearance: radioBoxGroupAppearance
        )
    }
}
