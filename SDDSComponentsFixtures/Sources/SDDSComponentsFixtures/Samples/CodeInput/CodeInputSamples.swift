import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCodeInput_Simple: View {
    @State private var code = ""
    @State private var validationResult: CodeFieldValidationResult = .success(.initial)

    var body: some View {
        SDDSCodeInput(
            code: $code,
            groups: CodeFieldGroup.four,
            validation: CodeFieldDisabledValidation(),
            validationResult: $validationResult,
            caption: "Введите код из СМС",
            captionAlignment: .center,
            appearance: CodeInput.m.appearance
        )
    }
}
