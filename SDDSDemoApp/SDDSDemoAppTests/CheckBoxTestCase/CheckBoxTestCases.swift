//
//  CheckBoxTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [CheckBox, CheckBoxGroup]
 */

struct CheckBoxSizeLNegative: View {
    var appearance: CheckboxAppearance
    
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct CheckBoxSizeLNegativeUnchecked: View {
    var appearance: CheckboxAppearance
    
    var body: some View {
        SDDSCheckbox(
            state: .constant(.deselected),
            title: "",
            subtitle: "",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct CheckBoxSizeM: View {
    var appearance: CheckboxAppearance
    
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct CheckBoxSizeS: View {
    var appearance: CheckboxAppearance
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct CheckBoxSizeSDisabled: View {
    var appearance: CheckboxAppearance
    
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: false,
            appearance: appearance
        )
    }
}

struct CheckBoxSizeMIndeterminate: View {
    var appearance: CheckboxAppearance
    
    var body: some View {
        SDDSCheckbox(
            state: .constant(.indeterminate),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct CheckBoxSizeMNoLabelNoDescription: View {
    var appearance: CheckboxAppearance
    
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "",
            subtitle: "",
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct CheckBoxGroupSizeM: View {
    var appearance: CheckboxAppearance
    var checkBoxGroupAppearance: CheckboxGroupAppearance
    
    var body: some View {
        let parent = CheckboxData(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
       )
        
        let child = (0..<2).map { index in
            CheckboxData(
                state: .constant(.selected),
                title: "Label",
                subtitle: "Description",
                isEnabled: true,
                appearance: appearance
            )
        }
        return Group {
            SDDSCheckboxGroup(
                behaviour: .hierarchical(parent: parent, child: child),
                size: SDDSCheckboxGroupSize.medium,
                appearance: checkBoxGroupAppearance
            )
        }
    }
}

struct CheckBoxGroupSizeS: View {
    var appearance: CheckboxAppearance
    var checkBoxGroupAppearance: CheckboxGroupAppearance
    
    var body: some View {
        let parent = CheckboxData(
            state: .constant(.indeterminate),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: appearance
       )
        
        let children: [CheckboxData] = (0..<1).flatMap { index in
            [
                CheckboxData(
                state: .constant(.selected),
                title: "Label",
                subtitle: "Description",
                isEnabled: true,
                appearance: appearance
            ),
                CheckboxData(
                state: .constant(.deselected),
                title: "Label",
                subtitle: "Description",
                isEnabled: true,
                appearance: appearance
                )
            ]
        }
        return Group {
            SDDSCheckboxGroup(
                behaviour: .hierarchical(parent: parent, child: children),
                size: SDDSCheckboxGroupSize.small,
                appearance: checkBoxGroupAppearance
            )
        }
    }
}

struct CheckBoxGroupSizeMDisabled: View {
    var appearance: CheckboxAppearance
    var checkBoxGroupAppearance: CheckboxGroupAppearance
    
    var body: some View {
        let parent = CheckboxData(
            state: .constant(.deselected),
            title: "Label",
            subtitle: "Description",
            isEnabled: false,
            appearance: appearance
       )
        
        let child = (0..<2).map { index in
            CheckboxData(
                state: .constant(.deselected),
                title: "Label",
                subtitle: "Description",
                isEnabled: false,
                appearance: appearance
            )
        }
        return Group {
            SDDSCheckboxGroup(
                behaviour: .hierarchical(parent: parent, child: child),
                size: SDDSCheckboxGroupSize.medium,
                appearance: checkBoxGroupAppearance
            )
        }
    }
}
