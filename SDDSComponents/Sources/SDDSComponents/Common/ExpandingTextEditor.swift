import SwiftUI
import SDDSThemeCore

struct ExpandingTextEditor: UIViewRepresentable {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    @Binding var isFocused: Bool
    @Binding var scrollbarData: ScrollbarData
    let readOnly: Bool
    let typographyToken: TypographyToken
    let accentColor: Color
    let textColor: Color
    let textAlignment: TextAlignment
    let paddingInsets: EdgeInsets
    let showsVerticalScrollIndicator: Bool
    let dynamicHeight: Bool
    let onChange: (_ newText: String) -> ()
    init(text: Binding<String>,
         textHeight: Binding<CGFloat>,
         isFocused: Binding<Bool>,
         scrollbarData: Binding<ScrollbarData>,
         readOnly: Bool,
         typographyToken: TypographyToken,
         accentColor: Color = .blue,
         textColor: Color = .black,
         textAlignment: TextAlignment = .leading,
         paddingInsets: EdgeInsets = .init(),
         trailingContentPadding: CGFloat = 0,
         showsVerticalScrollIndicator: Bool = true,
         dynamicHeight: Bool = true,
         onChange: @escaping (_ newText: String) -> ()
    ) {
        _text = text
        _textHeight = textHeight
        _isFocused = isFocused
        self._scrollbarData = scrollbarData
        self.readOnly = readOnly
        self.typographyToken = typographyToken
        self.accentColor = accentColor
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.paddingInsets = paddingInsets
        self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        self.dynamicHeight = dynamicHeight
        self.onChange = onChange
    }
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = !dynamicHeight
        textView.backgroundColor = .clear
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.maximumNumberOfLines = 0
        textView.autocorrectionType = .no
        textView.translatesAutoresizingMaskIntoConstraints = false
        updateTextViewProperties(textView: textView)
        
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
        guard let textView = uiView.subviews.first as? UITextView else {
            return
        }
        updateTextViewProperties(textView: textView)
        DispatchQueue.main.async {
            scrollbarData.contentHeight = textView.contentSize.height
            scrollbarData.visibleHeight = textView.frame.size.height
            
            if isFocused {
                if !textView.isFirstResponder {
                    textView.becomeFirstResponder()
                }
            } else {
                textView.resignFirstResponder()
            }
            
            textView.text = text
            self.updateHeight(textView)
        }
    }
    
    private func updateHeight(_ textView: UITextView) {
        guard dynamicHeight else {
            return
        }
        
        var fixedWidth = textView.bounds.size.width
        let size = CGSize(width: fixedWidth, height: .greatestFiniteMagnitude)
        let estimatedSize = textView.sizeThatFits(size)
        let newHeight = max(typographyToken.lineHeight, estimatedSize.height)
        if textHeight != newHeight {
            textHeight = newHeight
        }
    }
    
    private func updateTextViewProperties(textView: UITextView) {
        textView.textContainerInset = UIEdgeInsets(
            top: paddingInsets.top,
            left: paddingInsets.leading,
            bottom: paddingInsets.bottom,
            right: paddingInsets.trailing
        )
        textView.textAlignment = textAlignment.nsTextAlignment
        textView.font = typographyToken.uiFont
        textView.textColor = UIColor(textColor)
        textView.tintColor = UIColor(accentColor)
        textView.isEditable = !readOnly
        textView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: ExpandingTextEditor
        var hideScrollbarTimer: Timer?
        
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
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.scrollbarData.contentOffset = scrollView.contentOffset
        }
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            parent.scrollbarData.scrollEnded = false
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate: Bool) {
            hideScrollbarTimer = Timer.scheduledTimer(
                withTimeInterval: 1,
                repeats: false
            ) { [weak self] _ in
                self?.parent.scrollbarData.scrollEnded = true
            }
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
