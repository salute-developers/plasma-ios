//
//  CodeInputTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 11.09.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [CodeInput]
 */

/**
 PLASMA-T2105
 */
struct CodeInputLCodeLengthFourCaptionLeft : View {
    var appearance: CodeInputAppearance
    @State private var code: String = ""
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)
    var body: some View {
        SDDSCodeInput(
            code: $code,
            groups: CodeFieldGroup.four,
            validation: CodeFieldDisabledValidation(),
            validationResult: $validationResult,
            caption: "Caption",
            captionAlignment: .leading,
            keyboardType: .numberPad,
            isFocused: true,
            isHidden: false,
            appearance: appearance,
            isAnimating: false
        )
    }
}

/**
 PLASMA-T2106
 */
struct CodeInputMCodeLengthFiveCaptionCenter : View {
   var appearance: CodeInputAppearance
   @State private var code: String = ""
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.five,
           validation: CodeFieldDisabledValidation(),
           validationResult: $validationResult,
           caption: "Caption",
           captionAlignment: .center,
           keyboardType: .numberPad,
           isFocused: true,
           isHidden: false,
           appearance: appearance,
           isAnimating: false
       )
   }
}

/**
 PLASMA-T2108
 */
struct CodeInputSCodeLengthSix : View {
   var appearance: CodeInputAppearance
   @State private var code: String = ""
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.six,
           validation: CodeFieldDisabledValidation(),
           validationResult: $validationResult,
           caption: "Caption",
           captionAlignment: .center,
           keyboardType: .numberPad,
           isFocused: true,
           isHidden: false,
           appearance: appearance,
           isAnimating: false
       )
   }
}

/**
 PLASMA-T2109
 */
struct CodeInputSCodeLengthSixNoCaption : View {
   var appearance: CodeInputAppearance
   @State private var code: String = ""
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.six,
           validation: CodeFieldDisabledValidation(),
           validationResult: $validationResult,
           caption: "",
           captionAlignment: .center,
           keyboardType: .numberPad,
           isFocused: true,
           isHidden: false,
           appearance: appearance,
           isAnimating: false
       )
   }
}

/**
 PLASMA-T2110
 */
struct CodeInputMCodeLengthSixHidden : View {
   var appearance: CodeInputAppearance
   @State private var code: String = "1"
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.six,
           validation: CodeFieldOnlyDigitsValidation(code: "1234", groups: CodeFieldGroup.four),
           validationResult: $validationResult,
           caption: "Caption",
           captionAlignment: .center,
           keyboardType: .numberPad,
           isFocused: true,
           isHidden: true,
           appearance: appearance,
           isAnimating: false
       )
   }
}

/**
 PLASMA-T2111
 */
struct CodeInputLInputLetterError : View {
   var appearance: CodeInputAppearance
   @State private var code: String = "q"
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.six,
           validation: CodeFieldOnlyDigitsValidation(code: "123456", groups: CodeFieldGroup.six),
           validationResult: $validationResult,
           caption: "Caption",
           captionAlignment: .center,
           keyboardType: .numberPad,
           isFocused: true,
           isHidden: false,
           appearance: appearance,
           isAnimating: false
       )
   }
}

/**
 PLASMA-T2116
 */
struct CodeInputLInputWrongCode : View {
   var appearance: CodeInputAppearance
   @State private var code: String = "222333"
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.six,
           validation: CodeFieldOnlyDigitsValidation(code: "123456", groups: CodeFieldGroup.six),
           validationResult: $validationResult,
           caption: "Caption",
           captionAlignment: .center,
           keyboardType: .numberPad,
           isFocused: true,
           isHidden: false,
           appearance: appearance,
           isAnimating: false
       )
   }
}

/**
 PLASMA-T2221
 */
struct CodeInputCorrectCode : View {
   var appearance: CodeInputAppearance
   @State private var code: String = "1234"
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.four,
           validation: CodeFieldOnlyDigitsValidation(code: "1234", groups: CodeFieldGroup.four),
           validationResult: $validationResult,
           caption: "Caption",
           captionAlignment: .leading,
           keyboardType: .numberPad,
           isFocused: true,
           isHidden: false,
           appearance: appearance,
           isAnimating: false
       )
   }
}

/**
 PLASMA-T2244
 */
struct CodeInputCaptionLongText : View {
   var appearance: CodeInputAppearance
   @State private var code: String = ""
   @State private var validationResult: CodeFieldValidationResult = .success(.initial)
   var body: some View {
       SDDSCodeInput(
           code: $code,
           groups: CodeFieldGroup.four,
           validation: CodeFieldDisabledValidation(),
           validationResult: $validationResult,
           caption: "Here is a very long caption to test the code field component",
           captionAlignment: .center,
           keyboardType: .numberPad,
           isFocused: false,
           isHidden: false,
           appearance: appearance,
           isAnimating: false
       )
   }
}
