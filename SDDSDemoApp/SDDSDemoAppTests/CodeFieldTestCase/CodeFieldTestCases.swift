//
//  CodeFieldTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.08.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [CodeField]
 */

/**
 PLASMA-T2026
 */
struct CodeFieldLCaptionLeftLengthFour : View {
    var appearance: CodeFieldAppearance
    @State private var code: String = ""
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)
    
    var body: some View {
        SDDSCodeField(
            code: $code,
            groups: CodeFieldGroup.four,
            validation: CodeFieldDisabledValidation(),
            validationResult: $validationResult,
            caption: "Caption",
            captionAlignment: .leading,
            keyboardType: .numberPad,
            isFocused: true,
            appearance: appearance,
            isAnimating: false,
            onCodeChanged: { code in }
        )
    }
}

/**
 PLASMA-T2027
 */
struct CodeFieldMSegmentedLengthFive : View {
    var appearance: CodeFieldAppearance
    @State private var code: String = ""
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)
    
    var body: some View {
        SDDSCodeField(
            code: $code,
            groups: CodeFieldGroup.five,
            validation: CodeFieldDisabledValidation(),
            validationResult: $validationResult,
            caption: "Caption",
            captionAlignment: .center,
            keyboardType: .numberPad,
            appearance: appearance,
            isAnimating: false,
            onCodeChanged: { code in }
        )
    }
}

/**
 PLASMA-T2028
 */
struct CodeFieldLLengthSixNoCaption : View {
    var appearance: CodeFieldAppearance
    @State private var code: String = ""
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)
    
    var body: some View {
        SDDSCodeField(
            code: $code,
            groups: CodeFieldGroup.six,
            validation: CodeFieldDisabledValidation(),
            validationResult: $validationResult,
            caption: "",
            captionAlignment: .leading,
            keyboardType: .numberPad,
            appearance: appearance,
            isAnimating: false,
            onCodeChanged: { code in }
        )
    }
}

/**
 PLASMA-T2029
 */
struct CodeFieldMSegmentedLengthSix : View {
    var appearance: CodeFieldAppearance
    @State private var code: String = ""
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)
    
    var body: some View {
        SDDSCodeField(
            code: $code,
            groups: CodeFieldGroup.six,
            validation: CodeFieldDisabledValidation(),
            validationResult: $validationResult,
            caption: "Caption",
            captionAlignment: .center,
            keyboardType: .numberPad,
            appearance: appearance,
            isAnimating: false,
            onCodeChanged: { code in }
        )
    }
}

/**
 PLASMA-T2218
 */
struct CodeFieldLInputWrongCode : View {
    var appearance: CodeFieldAppearance
    @State private var code: String = "2222"
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)
    
    var body: some View {
        SDDSCodeField(
            code: $code,
            groups: CodeFieldGroup.four,
            validation: CodeFieldOnlyDigitsValidation(code: "1234", groups: CodeFieldGroup.four),
            validationResult: $validationResult,
            caption: "Caption",
            captionAlignment: .center,
            keyboardType: .numberPad,
            appearance: appearance,
            isAnimating: false,
            onCodeChanged: { code in }
        )
    }
}

/**
 PLASMA-T2219
 */
struct CodeFieldLInputLetterError : View {
    var appearance: CodeFieldAppearance
    @State private var code: String = "q"
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)
    
    var body: some View {
        SDDSCodeField(
            code: $code,
            groups: CodeFieldGroup.four,
            validation: CodeFieldOnlyDigitsValidation(code: "1234", groups: CodeFieldGroup.four),
            validationResult: $validationResult,
            caption: "Caption",
            captionAlignment: .center,
            keyboardType: .numberPad,
            appearance: appearance,
            isAnimating: false,
            onCodeChanged: { code in }
        )
    }
}
