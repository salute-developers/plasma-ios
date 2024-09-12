import SwiftUI
import SDDSThemeCore

struct FocusableTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var isFocused: Bool
    let textColor: Color
    let textAlignment: TextAlignment
    let cursorColor: Color
    let typography: TypographyToken
    let readOnly: Bool
    var onEditingChanged: ((Bool) -> Void)? = nil

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: FocusableTextField

        init(_ parent: FocusableTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return !parent.readOnly
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

    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = context.coordinator
        configure(textField)
        
        containerView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textField.topAnchor.constraint(equalTo: containerView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }

    func updateUIView(_ view: UIView, context: Context) {
        guard let textField = view.subviews.first as? UITextField else {
            return
        }
        
        textField.text = text
        configure(textField)

        DispatchQueue.main.async {
            if isFocused {
                textField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
    }

    private func configure(_ textField: UITextField) {
        textField.textColor = UIColor(textColor)
        
        let nsTextAlignment: NSTextAlignment
        switch textAlignment {
        case .center:
            nsTextAlignment = .center
        case .leading:
            nsTextAlignment = .left
        case .trailing:
            nsTextAlignment = .right
        }
        
        textField.textAlignment = nsTextAlignment
        textField.tintColor = UIColor(cursorColor)
        textField.font = typography.uiFont
    }
}
