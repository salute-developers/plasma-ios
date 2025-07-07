//
//  TextFieldTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 03.06.2025.
//

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
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1517
 */
struct TextFieldSizeMSuccessOuterOptional: View {
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
            appearance: appearance,
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
            required: true,
            divider: false,
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1557
 */
struct TextFieldSizeMWarningInnerOptional: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1558
 */
struct TextFieldReadOnly: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1559
 */
struct TextFieldSizeXsSuccessOptionalOuterLabel: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1560
 */
struct TextFieldDisabled: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1561
 */
struct TextFieldSizeMErrorOptionalOuterLabel: View {
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
 PLASMA-T1563
 */
struct TextFieldSizeSWarningRequiredEndInnerLabelFocused: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1564
 */
struct TextFieldSizeMSuccessChipsOptionalInnerLabel: View {
    var appearance: TextFieldAppearance
    var chipAppearance: ChipAppearance
    
    @State private var value: TextFieldValue
    init(
        appearance: TextFieldAppearance,
        chipAppearance: ChipAppearance
    ) {
        self.appearance = appearance
        self.chipAppearance = chipAppearance
        self._value = State(initialValue: TextFieldValue.multiple("", chips(with: chipAppearance)))
    }
    
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
 PLASMA-T1565
 */
struct TextFieldSizeSDefaultChipsRequiredEndOuterLabel: View {
    var appearance: TextFieldAppearance
    var chipAppearance: ChipAppearance
    
    @State private var value: TextFieldValue
    init(
        appearance: TextFieldAppearance,
        chipAppearance: ChipAppearance
    ) {
        self.appearance = appearance
        self.chipAppearance = chipAppearance
        self._value = State(initialValue: TextFieldValue.multiple("", chips(with: chipAppearance)))
    }
    
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
 PLASMA-T1566
 */
struct TextFieldClearSizeLErrorOptionalInnerLabel: View {
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
            divider: true,
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
            appearance: appearance,
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
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1572
 */
struct TextFieldSizeLTBTA: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1891
 */
struct TextFieldSizeLRequiredStartOuterLabelDisabled: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1935
 */
struct TextFieldSizeLTBTAEmptyValue: View {
    var appearance: TextFieldAppearance
    
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
 PLASMA-T1920
 */
struct TextFieldSizeLTBTACyrillic: View {
    var appearance: TextFieldAppearance
    
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

func chips(with chipAppearance: ChipAppearance) -> [ChipData] {
    (1...3).map { _ in
        ChipData(
            title: "Chip",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: chipAppearance,
            accessibility: ChipAccessibility(),
            removeAction: {}
        )
    }
}
