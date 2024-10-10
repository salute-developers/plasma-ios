import SwiftUI

struct FocusableTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var isFocused: Bool
    var onEditingChanged: ((Bool) -> Void)? = nil

    var textColor: UIColor = .black
    var textAlignment: NSTextAlignment = .left
    var cursorColor: UIColor = .blue
    var font: UIFont = UIFont.systemFont(ofSize: 17)

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: FocusableTextField

        init(_ parent: FocusableTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isFocused = true
            parent.onEditingChanged?(true)
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isFocused = false
            parent.onEditingChanged?(false)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        configure(textField)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        configure(uiView)

        DispatchQueue.main.async {
            if isFocused {
                uiView.becomeFirstResponder()
            } else {
                uiView.resignFirstResponder()
            }
        }
    }

    private func configure(_ textField: UITextField) {
        textField.textColor = textColor
        textField.textAlignment = textAlignment
        textField.tintColor = cursorColor
        textField.font = font
    }
}

extension FocusableTextField {
    func foregroundColor(_ color: Color) -> FocusableTextField {
        var copy = self
        copy.textColor = UIColor(color)
        return copy
    }

    func multilineTextAlignment(_ alignment: TextAlignment) -> FocusableTextField {
        var copy = self
        switch alignment {
        case .leading:
            copy.textAlignment = .left
        case .center:
            copy.textAlignment = .center
        case .trailing:
            copy.textAlignment = .right
        }
        return copy
    }

    func accentColor(_ color: Color) -> FocusableTextField {
        var copy = self
        copy.cursorColor = UIColor(color)
        return copy
    }

    func typography(_ token: TypographyToken) -> FocusableTextField {
        var copy = self
        copy.font = token.uiFont
        return copy
    }
}
