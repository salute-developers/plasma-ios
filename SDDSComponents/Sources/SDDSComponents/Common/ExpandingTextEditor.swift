import SwiftUI
import SDDSThemeCore

struct ExpandingTextEditor: UIViewRepresentable {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    let typographyToken: TypographyToken

    init(text: Binding<String>, textHeight: Binding<CGFloat>, typographyToken: TypographyToken) {
        _text = text
        _textHeight = textHeight
        self.typographyToken = typographyToken
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = context.coordinator
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.font = typographyToken.uiFont
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        updateHeight(uiView)
    }

    private func updateHeight(_ textView: UITextView) {
        let size = CGSize(width: textView.bounds.width, height: .greatestFiniteMagnitude)
        let estimatedSize = textView.sizeThatFits(size)
        textHeight = max(40, estimatedSize.height)
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
        }
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
