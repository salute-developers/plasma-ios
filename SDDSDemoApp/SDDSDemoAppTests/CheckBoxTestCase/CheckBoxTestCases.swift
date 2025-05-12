//
//  CheckBoxTestCases.swift
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
Тест-кейсы для компонента [CheckBox, CheckBoxGroup]
 */

struct CheckBoxSizeLNegative: View {
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.l.negative.appearance
        )
    }
}

struct CheckBoxSizeLNegativeUnchecked: View {
    var body: some View {
        SDDSCheckbox(
            state: .constant(.deselected),
            title: "",
            subtitle: "",
            isEnabled: true,
            appearance: Checkbox.l.negative.appearance
        )
    }
}

struct CheckBoxSizeM: View {
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.m.default.appearance
        )
    }
}

struct CheckBoxSizeS: View {
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.s.default.appearance
        )
    }
}

struct CheckBoxSizeSDisabled: View {
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: false,
            appearance: Checkbox.s.default.appearance
        )
    }
}

struct CheckBoxSizeMIndeterminate: View {
    var body: some View {
        SDDSCheckbox(
            state: .constant(.indeterminate),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.m.default.appearance
        )
    }
}

struct CheckBoxSizeMNoLabelNoDescription: View {
    var body: some View {
        SDDSCheckbox(
            state: .constant(.selected),
            title: "",
            subtitle: "",
            isEnabled: true,
            appearance: Checkbox.m.default.appearance
        )
    }
}

struct CheckBoxGroupSizeM: View {
    var body: some View {
        let parent = CheckboxData(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.m.default.appearance
       )
        
        let child = (0..<2).map { index in
            CheckboxData(
                state: .constant(.selected),
                title: "Label",
                subtitle: "Description",
                isEnabled: true,
                appearance: Checkbox.m.default.appearance
            )
        }
        return Group {
            SDDSCheckboxGroup(
                behaviour: .hierarchical(parent: parent, child: child),
                size: SDDSCheckboxGroupSize.medium,
                appearance: CheckboxGroup.m.appearance
            )
        }
    }
}

struct CheckBoxGroupSizeS: View {
    var body: some View {
        let parent = CheckboxData(
            state: .constant(.indeterminate),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            appearance: Checkbox.s.default.appearance
       )
        
        let children: [CheckboxData] = (0..<1).flatMap { index in
            [
                CheckboxData(
                state: .constant(.selected),
                title: "Label",
                subtitle: "Description",
                isEnabled: true,
                appearance: Checkbox.s.default.appearance
            ),
                CheckboxData(
                state: .constant(.deselected),
                title: "Label",
                subtitle: "Description",
                isEnabled: true,
                appearance: Checkbox.s.default.appearance
                )
            ]
        }
        return Group {
            SDDSCheckboxGroup(
                behaviour: .hierarchical(parent: parent, child: children),
                size: SDDSCheckboxGroupSize.small,
                appearance: CheckboxGroup.s.appearance
            )
        }
    }
}

struct CheckBoxGroupSizeMDisabled: View {
    var body: some View {
        let parent = CheckboxData(
            state: .constant(.deselected),
            title: "Label",
            subtitle: "Description",
            isEnabled: false,
            appearance: Checkbox.m.default.appearance
       )
        
        let child = (0..<2).map { index in
            CheckboxData(
                state: .constant(.deselected),
                title: "Label",
                subtitle: "Description",
                isEnabled: false,
                appearance: Checkbox.m.default.appearance
            )
        }
        return Group {
            SDDSCheckboxGroup(
                behaviour: .hierarchical(parent: parent, child: child),
                size: SDDSCheckboxGroupSize.medium,
                appearance: CheckboxGroup.m.appearance
            )
        }
    }
}
