//
//  FormItemTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.05.2026.
//
import SDDSComponents
import SDDSServTheme
import SwiftUI
import UIKit

/**
 Тест-кейсы для компонента [FormItem]
 */
struct FormItemCommonCase: View {
    let appearance: FormItemAppearance
    let content: String
    let title: String?
    let titleCaption: String?
    let caption: String?
    let counter: String?
    let optional: String?
    let hasHint: Bool
    let hasCaptionIcon: Bool
    let enabled: Bool

    init(
        appearance: FormItemAppearance,
        content: String = "Form item text content.\nSecond line text.",
        title: String? = "Title",
        titleCaption: String? = "titleCaption",
        caption: String? = "Caption",
        counter: String? = "Counter",
        optional: String? = "Optional",
        hasHint: Bool = true,
        hasCaptionIcon: Bool = true,
        enabled: Bool = true
    ) {
        self.appearance = appearance
        self.content = content
        self.title = title
        self.titleCaption = titleCaption
        self.caption = caption
        self.counter = counter
        self.optional = optional
        self.hasHint = hasHint
        self.hasCaptionIcon = hasCaptionIcon
        self.enabled = enabled
    }

    var body: some View {
        VStack {
            SDDSFormItem(
                appearance: appearance,
                title: textOrNil(title),
                optional: textOrNil(optional),
                titleCaption: textOrNil(titleCaption),
                caption: captionOrNil(caption),
                counter: textOrNil(counter),
                hasHint: hasHint,
                enabled: enabled
            ) {
                Text(content)
            }
            .padding(16)
        }
        .frame(width: 360)
    }

    private func textOrNil(_ value: String?) -> (() -> AnyView)? {
        guard let value, !value.isEmpty else { return nil }
        return { AnyView(Text(value)) }
    }

    private func captionOrNil(_ value: String?) -> (() -> AnyView)? {
        guard let value, !value.isEmpty else { return nil }
        if hasCaptionIcon {
            return {
                AnyView(
                    HStack(spacing: 4) {
                        Image("textFieldIconActionTest")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text(value)
                    }
                )
            }
        }
        return { AnyView(Text(value)) }
    }
}

/**
 PLASMA-T2523
 */
struct FormItemLDefault: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2524
 */
struct FormItemMRequredStartPositive: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            titleCaption: "",
            counter: "",
            hasHint: false,
        )
    }
}

/**
 PLASMA-T2525
 */
struct FormItemSRequiredEndNegative: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
        )
    }
}

/**
 PLASMA-T2526
 */
struct FormItemXsTitleTopWarning: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            caption: "",
            counter: "",
        )
    }
}

/**
 PLASMA-T2527
 */
struct FormItemLTitleTopRequiredStartDefault: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            title: "Title text for testing long title in form component",
            hasCaptionIcon: false,
        )
    }
}

/**
 PLASMA-T2528
 */
struct FormItemLTitleTopRequiredEndPositive: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            titleCaption: "TitleCaption for testing long text",
            counter: "",
            hasHint: false,
        )
    }
}

/**
 PLASMA-T2529
 */
struct FormItemLTitleStartNegative: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            content: longText,
            titleCaption: "",
            counter: "",
            hasHint: false,
        )
    }
}

/**
 PLASMA-T2530
 */
struct FormItemLTitleStartRequiredStartWarning: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            titleCaption: "",
            hasHint: false,
        )
    }
}

/**
 PLASMA-T2531
 */
struct FormItemLTitleStartRequiredEndDefault: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            titleCaption: "",
            hasHint: false,
        )
    }
}

/**
 PLASMA-T2532
 */
struct FormItemDisabledXsTitleStartRequiredStartPositive: View {
    var appearance: FormItemAppearance
    
    var body: some View {
        FormItemCommonCase(
            appearance: appearance,
            titleCaption: "",
            counter: "",
            hasHint: false,
            enabled: false,
        )
    }
}

private let longText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type 
specimen book.
"""
