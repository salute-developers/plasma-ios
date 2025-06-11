//
//  TextFieldTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 03.06.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [TextFIeld/TextFieldClear]
 */

/**
 PLASMA-T1501
 */
struct TextFieldSizeLDefaultRequiredStartInnerLabel: View {
    @State private var value = TextFieldValue.single("Value")
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
            required: true,
            divider: false,
            appearance: TextField.l.innerLabel.requiredStart.default.appearance,
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
 PLASMA-T1517
 */
struct TextFieldSizeMSuccessOuterOptional: View {
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
            appearance: TextField.m.outerLabel.success.appearance,
            layout: .default,
            iconContent: Action { },
            actionContent: Action {
                Image.image("textFieldIconActionTest")
            }
        )
    }
}

/**
 PLASMA-T1554
 */
struct TextFieldSizeSWarningRequiredEndInnerLabel: View {
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
            required: true,
            divider: false,
            appearance: TextField.s.innerLabel.requiredEnd.warning.appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: Action {}
        )
    }
}

/**
 PLASMA-T1555
 */
struct TextFieldSizeXsErrorInnerOptional: View {
    @State private var value = TextFieldValue.single("")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            appearance: TextField.xs.error.appearance,
            layout: .default,
            iconContent: Action {},
            actionContent: Action {}
        )
    }
}

/**
 PLASMA-T1556
 */
struct TextFieldSizeLSuccessRequiredStartOuterLabel: View {
    @State private var value = TextFieldValue.single("Value")
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
            required: true,
            divider: false,
            appearance: TextField.l.innerLabel.requiredStart.success.appearance,
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
 PLASMA-T1557
 */
struct TextFieldSizeMWarningInnerOptional: View {
    @State private var value = TextFieldValue.single("Value")
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
            appearance: TextField.m.innerLabel.warning.appearance,
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
 PLASMA-T1558
 */
struct TextFieldReadOnly: View {
    @State private var value = TextFieldValue.single("")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: true,
            divider: false,
            appearance: TextField.s.innerLabel.requiredEnd.default.appearance,
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
 PLASMA-T1559
 */
struct TextFieldSizeXsSuccessOptionalOuterLabel: View {
    @State private var value = TextFieldValue.single("Value")
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
            appearance: TextField.xs.outerLabel.success.appearance,
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
 PLASMA-T1560
 */
struct TextFieldDisabled: View {
    @State private var value = TextFieldValue.single("Value")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: true,
            readOnly: false,
            required: true,
            divider: false,
            appearance: TextField.l.innerLabel.requiredStart.default.appearance,
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
 PLASMA-T1561
 */
struct TextFieldSizeMErrorOptionalOuterLabel: View {
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
            appearance: TextField.m.outerLabel.error.appearance,
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
 PLASMA-T1563
 */
struct TextFieldSizeSWarningRequiredEndInnerLabelFocused: View {
    @State private var value = TextFieldValue.single("Value")
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
            required: true,
            divider: false,
            appearance: TextField.s.innerLabel.requiredEnd.warning.appearance,
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
 PLASMA-T1564
 */
struct TextFieldSizeMSuccessChipsOptionalInnerLabel: View {
    @State private var value = TextFieldValue.multiple("", chips)
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
            appearance: TextField.m.innerLabel.success.appearance,
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
 PLASMA-T1565
 */
struct TextFieldSizeSDefaultChipsRequiredEndOuterLabel: View {
    @State private var value = TextFieldValue.multiple("", chips)
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
            required: true,
            divider: false,
            appearance: TextField.s.outerLabel.requiredEnd.default.appearance,
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
 PLASMA-T1566
 */
struct TextFieldClearSizeLErrorOptionalInnerLabel: View {
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
            divider: true,
            appearance: TextFieldClear.l.innerLabel.error.appearance,
            layout: .clear,
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
 PLASMA-T1567
 */
struct TextFieldClearSizeMWarningInnerLabelRequiredStart: View {
    @State private var value = TextFieldValue.single("Value")
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
            required: true,
            divider: true,
            appearance: TextFieldClear.m.innerLabel.requiredStart.warning.appearance,
            layout: .clear,
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
 PLASMA-T1568
 */
struct TextFieldClearSizeSDefaultOptionalOuter: View {
    @State private var value = TextFieldValue.single("")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: true,
            divider: true,
            appearance: TextFieldClear.s.outerLabel.default.appearance,
            layout: .clear,
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
 PLASMA-T1569
 */
struct TextFieldClearSizeXsSuccessOuterLabelRequireEnd: View {
    @State private var value = TextFieldValue.single("Value")
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
            required: true,
            divider: true,
            appearance: TextFieldClear.xs.outerLabel.requiredEnd.success.appearance,
            layout: .clear,
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
 PLASMA-T1570
 */
struct TextFieldClearSizeLInnerLabelRequiredEnd: View {
    @State private var value = TextFieldValue.single("Value")
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
            required: true,
            divider: true,
            appearance: TextFieldClear.l.innerLabel.requiredEnd.default.appearance,
            layout: .clear,
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
 PLASMA-T1571
 */
struct TextFieldClearSizeMErrorInnerRequiredStart: View {
    @State private var value = TextFieldValue.single("Value")
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
            required: true,
            divider: true,
            appearance: TextFieldClear.l.requiredStart.error.appearance,
            layout: .clear,
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
 PLASMA-T1933
 */
struct TextFieldClearSizeLErrorTBTA: View {
    @State private var value = TextFieldValue.single("")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "TB",
            textAfter: "TA",
            disabled: false,
            readOnly: false,
            required: true,
            divider: true,
            appearance: TextFieldClear.l.requiredStart.error.appearance,
            layout: .clear,
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
 PLASMA-T962
 */
struct TextFieldInputText: View {
    @State private var value = TextFieldValue.single("абвгдежзabcdefg@#643!#")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "",
            textBefore: "",
            textAfter: "",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            appearance: TextField.l.innerLabel.warning.appearance,
            layout: .default,
            iconContent: .init {
                Image.image("textFieldIconTest")
            },
            actionContent: .init {}
        )
    }
}

/**
 PLASMA-T1942
 */
struct TextFieldSizeXlDefaultOptionalInnerLabel: View {
    @State private var value = TextFieldValue.single("Value")
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
            appearance: TextField.xl.innerLabel.default.appearance,
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
 PLASMA-T1572
 */
struct TextFieldSizeLTBTA: View {
    @State private var value = TextFieldValue.single("Value")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "TB Prefix",
            textAfter: "TA Suffix",
            disabled: false,
            readOnly: false,
            required: true,
            divider: false,
            appearance: TextField.l.outerLabel.requiredStart.default.appearance,
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
 PLASMA-T1891
 */
struct TextFieldSizeLRequiredStartOuterLabelDisabled: View {
    @State private var value = TextFieldValue.single("Value")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "Optional",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "",
            textAfter: "",
            disabled: true,
            readOnly: false,
            required: true,
            divider: false,
            appearance: TextField.l.outerLabel.requiredStart.default.appearance,
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
 PLASMA-T1935
 */
struct TextFieldSizeLTBTAEmptyValue: View {
    @State private var value = TextFieldValue.single("")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "TB",
            textAfter: "TA",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            appearance: TextField.l.default.appearance,
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
 PLASMA-T1920
 */
struct TextFieldSizeLTBTACyrillic: View {
    @State private var value = TextFieldValue.single("Value")
    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Label",
            optionalTitle: "",
            placeholder: "Placeholder",
            caption: "Caption",
            textBefore: "Префикс",
            textAfter: "Суффикс",
            disabled: false,
            readOnly: false,
            required: false,
            divider: false,
            appearance: TextField.l.innerLabel.requiredStart.default.appearance,
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

private let chips = (1...3).map { _ in
    ChipData(
        title: "Chip",
        isEnabled: true,
        iconImage: nil,
        buttonImage: nil,
        appearance: Chip.s.default.appearance,
        accessibility: ChipAccessibility(),
        removeAction: {}
    )
}
