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
    let onShouldChange: (() -> (Bool))?
    let keyboardType: UIKeyboardType
    let enableSelection: Bool
    let onEditingChanged: ((Bool) -> Void)?
    
    init(text: Binding<String>,
         isFocused: Binding<Bool>,
         textColor: Color,
         textAlignment: TextAlignment,
         cursorColor: Color,
         typography: TypographyToken,
         readOnly: Bool,
         keyboardType: UIKeyboardType = .default,
         enableSelection: Bool = true,
         onShouldChange: (() -> (Bool))? = nil,
         onEditingChanged: ( (Bool) -> Void)? = nil
    ) {
        _text = text
        _isFocused = isFocused
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.cursorColor = cursorColor
        self.typography = typography
        self.readOnly = readOnly
        self.keyboardType = keyboardType
        self.enableSelection = enableSelection
        self.onShouldChange = onShouldChange
        self.onEditingChanged = onEditingChanged
    }
    
    private var uiTextField: UITextField {
        guard enableSelection else {
            return NonSelectableTextField()
        }
        return UITextField()
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: FocusableTextField

        init(_ parent: FocusableTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            guard parent.enableSelection else {
                return
            }
            parent.text = textField.text ?? ""
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return (parent.onShouldChange?() ?? true) && !parent.readOnly
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isFocused = true
            parent.onEditingChanged?(true)
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isFocused = false
            parent.onEditingChanged?(false)
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.isFocused = false
            return true
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        let textField = uiTextField
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = keyboardType
        textField.delegate = context.coordinator
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textFieldDidChange), for: .editingChanged)
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
            if isFocused  {
                if !textField.isFirstResponder {
                    textField.becomeFirstResponder()
                }
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
