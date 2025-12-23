//
//  MasksTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 11.12.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Mask]
 */

/**
 PLASMA-T1243
 */
struct MaskPhonePlaceholder: View {
    var appearance: TextFieldAppearance
    
    @State private var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .phone(.russia),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {},
            actionContent: .init {}
        )
    }
}

/**
 PLASMA-T1244
 */
struct MaskPhonePlaceholderOptional: View {
    var appearance: TextFieldAppearance
    
    @State private var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .phone(.russia),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {},
            actionContent: .init {}
        )
    }
}

/**
 PLASMA-T1247
 */
struct MaskPhoneDisabled: View {
    var appearance: TextFieldAppearance
    
    @State private var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: true,
            readOnly: false,
            required: false,
            divider: false,
            mask: .phone(.russia),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 PLASMA-T1248
 */
struct MaskPhoneReadOnly: View {
    var appearance: TextFieldAppearance
    
    @State private var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: true,
            required: false,
            divider: false,
            mask: .phone(.russia),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 PLASMA-T1281
 */
struct MaskPhoneInput: View {
    var appearance: TextFieldAppearance
    
    @State var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .phone(.custom(format: "+7 ([000]) [000]-[00]-[00]")),
            maskDisplayMode: .onInput,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 PLASMA-T2377
 */
struct MaskDate: View {
    var appearance: TextFieldAppearance
    
    @State var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .date(.short),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 Mask for Date type test
 */
struct MaskDateType: View {
    var appearance: TextFieldAppearance
    
    @State var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .date(.short),
            maskDisplayMode: .onInput,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 Mask for full Date type test
 */
struct MaskFullDateType: View {
    var appearance: TextFieldAppearance
    
    @State var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .date(.full),
            maskDisplayMode: .onInput,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 PLASMA-T2378
 */
struct MaskTime: View {
    var appearance: TextFieldAppearance
    
    @State private var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .time(.short),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 Mask for Time type test
 */
struct MaskTimeInput: View {
    var appearance: TextFieldAppearance
    
    @State var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .time(.short),
            maskDisplayMode: .onInput,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 PLASMA-T2379
 */
struct MaskNumber: View {
    var appearance: TextFieldAppearance
    
    @State private var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .number(.integer),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {},
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 Mask for Number type test
 */
struct MaskNumberInput: View {
    var appearance: TextFieldAppearance
    
    @State var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .number(.integer),
            maskDisplayMode: .onInput,
            appearance: appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 PLASMA-T2380
 */
struct MaskPhoneTBTA: View {
    var appearance: TextFieldAppearance
    
    @State private var value = TextFieldValue.single("")
    
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "",
            caption: "Caption",
            textBefore: "TB",
            textAfter: "TA",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            mask: .phone(.russia),
            maskDisplayMode: .always,
            appearance: appearance,
            layout: .default,
            iconContent: .init {},
            actionContent: .init {}
        )
    }
}
