import SwiftUI
import UIKit

struct TextLineCounter: UIViewRepresentable {
    let text: String
    let font: UIFont
    let width: CGFloat
    let lineHeight: CGFloat?
    let lineSpacing: CGFloat
    let onUpdate: (Int) -> Void

    init(
        text: String,
        font: UIFont,
        width: CGFloat,
        lineHeight: CGFloat? = nil,
        lineSpacing: CGFloat = 0,
        onUpdate: @escaping (Int) -> Void
    ) {
        self.text = text
        self.font = font
        self.width = width
        self.lineHeight = lineHeight
        self.lineSpacing = lineSpacing
        self.onUpdate = onUpdate
    }

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = font
        label.lineBreakMode = .byWordWrapping
        label.preferredMaxLayoutWidth = width
        label.attributedText = attributedText()

        DispatchQueue.main.async {
            updateLineCount(label: label)
        }

        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.font = font
        uiView.preferredMaxLayoutWidth = width
        uiView.attributedText = attributedText()
        
        DispatchQueue.main.async {
            updateLineCount(label: uiView)
        }
    }
    
    private func updateLineCount(label: UILabel) {
        let size = label.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
        let baseLineHeight = lineHeight ?? font.lineHeight
        let effectiveLineHeight = baseLineHeight + lineSpacing
        let lines = Int(round(size.height / effectiveLineHeight))
        onUpdate(lines)
    }
    
    private func attributedText() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = .byWordWrapping
        if let lineHeight {
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
        }
        
        return NSAttributedString(
            string: text,
            attributes: [
                .font: font,
                .paragraphStyle: paragraphStyle
            ]
        )
    }
}
