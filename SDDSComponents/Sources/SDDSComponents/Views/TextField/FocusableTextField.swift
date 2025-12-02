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
    let mask: TextFieldMask?
    let onShouldChange: ((String) -> (Bool))?
    let keyboardType: UIKeyboardType
    let enableSelection: Bool
    let onEditingChanged: ((Bool) -> Void)?
    let onMaskComplete: ((Bool) -> Void)?
    
    init(text: Binding<String>,
         isFocused: Binding<Bool>,
         textColor: Color,
         textAlignment: TextAlignment,
         cursorColor: Color,
         typography: TypographyToken,
         readOnly: Bool,
         mask: TextFieldMask? = nil,
         keyboardType: UIKeyboardType = .default,
         enableSelection: Bool = true,
         onShouldChange: ((String) -> (Bool))? = nil,
         onEditingChanged: ( (Bool) -> Void)? = nil,
         onMaskComplete: ((Bool) -> Void)? = nil
    ) {
        _text = text
        _isFocused = isFocused
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.cursorColor = cursorColor
        self.typography = typography
        self.readOnly = readOnly
        self.mask = mask
        self.keyboardType = keyboardType
        self.enableSelection = enableSelection
        self.onShouldChange = onShouldChange
        self.onEditingChanged = onEditingChanged
        self.onMaskComplete = onMaskComplete
    }
    
    private var uiTextField: UITextField {
        guard enableSelection else {
            return NonSelectableTextField()
        }
        return UITextField()
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: FocusableTextField
        var maskListener: MaskedTextInputListener?

        init(_ parent: FocusableTextField) {
            self.parent = parent
        }
        
        func updateMaskFormat(for text: String) {
            guard let mask = parent.mask, mask.isDynamic else {
                return
            }
            
            let newFormat = mask.format(input: text)
            if let listener = maskListener {
                listener.primaryMaskFormat = newFormat
            }
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            guard parent.enableSelection else {
                return
            }
            
            // Если маска не используется, обновляем текст напрямую
            // При использовании маски текст обновляется через onMaskedTextChangedCallback
            if maskListener == nil {
                parent.text = textField.text ?? ""
            }
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Если маска используется, всегда возвращаем true
            // MaskedTextInputListener сам контролирует логику изменений
            if let listener = maskListener, !parent.readOnly {
                if let mask = parent.mask, mask.isDynamic {
                    let currentText = textField.text ?? ""
                    let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
                    let digitsOnly = updatedText.filter { $0.isNumber || $0 == "," || $0 == "." }
                    if !digitsOnly.isEmpty {
                        let newFormat = mask.format(input: digitsOnly)
                        listener.primaryMaskFormat = newFormat
                    }
                }
                return listener.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
            }
            
            // Без маски используем обычную логику
            return (parent.onShouldChange?(string) ?? true)
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            // Вызывается либо напрямую (без маски), либо через проксирование от MaskedTextInputListener
            parent.isFocused = true
            parent.onEditingChanged?(true)
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            // Вызывается либо напрямую (без маски), либо через проксирование от MaskedTextInputListener
            parent.isFocused = false
            parent.onEditingChanged?(false)
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            // Если маска не используется, обновляем текст напрямую
            // Если маска используется, текст обновляется через onMaskedTextChangedCallback
            if parent.mask == nil {
                parent.text = textField.text ?? ""
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Вызывается либо напрямую (без маски), либо через проксирование от MaskedTextInputListener
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
        textField.keyboardType = mask != nil ? .numberPad : keyboardType
        
        // Настройка маски, если она указана
        if let mask = mask {
            let initialFormat = mask.format(input: text)
            let maskListener = MaskedTextInputListener(
                primaryFormat: initialFormat,
                autocomplete: true,
                autocompleteOnFocus: false
            )
            
            // Callback для обновления текста через coordinator
            maskListener.onMaskedTextChangedCallback = { textInput, value, complete, _ in
                DispatchQueue.main.async {
                    let newText = textInput.allText
                    context.coordinator.parent.text = newText
                    context.coordinator.parent.onMaskComplete?(complete)
                }
            }
            
            context.coordinator.maskListener = maskListener
        }
        
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
        
        // Обновляем текст только если он отличается от текущего
        if textField.text != text {
            if let maskListener = context.coordinator.maskListener {
                if let mask = mask, mask.isDynamic {
                    let digitsOnly = text.filter { $0.isNumber || $0 == "," || $0 == "." }
                    let newFormat = mask.format(input: digitsOnly)
                    maskListener.primaryMaskFormat = newFormat
                }
                // Применяем маску к новому тексту
                let result = maskListener.put(text: text, into: textField, autocomplete: true)
                self.onMaskComplete?(result.complete)
            } else {
                textField.text = text
            }
        }
        
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
