import SwiftUI
@_exported import SDDSThemeCore

struct ExpandingTextEditor: UIViewRepresentable {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    @Binding var isFocused: Bool
    let readOnly: Bool
    let typographyToken: TypographyToken
    let accentColor: Color
    let textColor: Color
    let textAlignment: TextAlignment
    let paddingInsets: EdgeInsets
    let onChange: (_ newText: String) -> ()

    init(text: Binding<String>,
         textHeight: Binding<CGFloat>,
         isFocused: Binding<Bool>,
         readOnly: Bool,
         typographyToken: TypographyToken,
         accentColor: Color = .blue,
         textColor: Color = .black,
         textAlignment: TextAlignment = .leading,
         paddingInsets: EdgeInsets = .init(),
         onChange: @escaping (_ newText: String) -> ()
    ) {
        _text = text
        _textHeight = textHeight
        _isFocused = isFocused
        self.readOnly = readOnly
        self.typographyToken = typographyToken
        self.accentColor = accentColor
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.paddingInsets = paddingInsets
        self.onChange = onChange
    }

    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(top: paddingInsets.top, left: paddingInsets.leading, bottom: paddingInsets.bottom, right: paddingInsets.trailing)
        textView.textAlignment = textAlignment.nsTextAlignment
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.maximumNumberOfLines = 0
        textView.autocorrectionType = .no
        textView.font = typographyToken.uiFont
        textView.textColor = UIColor(textColor)
        textView.tintColor = UIColor(accentColor)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = !readOnly
        
        containerView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textView.topAnchor.constraint(equalTo: containerView.topAnchor),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if let textView = uiView.subviews.first as? UITextView {
            if isFocused {
                textView.becomeFirstResponder()
            } else {
                textView.resignFirstResponder()
            }
            
            DispatchQueue.main.async {
                textView.text = text

                self.updateHeight(textView)
            }
        }
    }
    
    private func updateHeight(_ textView: UITextView) {
        let fixedWidth = textView.bounds.size.width
        let size = CGSize(width: fixedWidth, height: .greatestFiniteMagnitude)
        let estimatedSize = textView.sizeThatFits(size)

        let newHeight = max(typographyToken.lineHeight, estimatedSize.height)
        if textHeight != newHeight {
            textHeight = newHeight
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: ExpandingTextEditor

        init(_ parent: ExpandingTextEditor) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
            parent.updateHeight(textView)
            
            parent.onChange(textView.text)
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            parent.isFocused = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            parent.isFocused = false
        }
    }
}

private extension TextAlignment {
    var nsTextAlignment: NSTextAlignment {
        switch self {
        case .center:
            return .center
        case .leading:
            return .left
        case .trailing:
            return .right
        }
    }
}
