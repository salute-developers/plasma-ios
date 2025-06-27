import SwiftUI
import UIKit

struct TextLineCounter: UIViewRepresentable {
    let text: String
    let font: UIFont
    let width: CGFloat
    let lineSpacing: CGFloat
    let onUpdate: (Int) -> Void

    init(text: String, font: UIFont, width: CGFloat, lineSpacing: CGFloat = 0, onUpdate: @escaping (Int) -> Void) {
        self.text = text
        self.font = font
        self.width = width
        self.lineSpacing = lineSpacing
        self.onUpdate = onUpdate
    }

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = font
        label.lineBreakMode = .byWordWrapping
        label.preferredMaxLayoutWidth = width
        
        if lineSpacing > 0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            label.attributedText = NSAttributedString(
                string: text,
                attributes: [.paragraphStyle: paragraphStyle]
            )
        } else {
            label.text = text
        }

        DispatchQueue.main.async {
            updateLineCount(label: label)
        }

        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.font = font
        uiView.preferredMaxLayoutWidth = width
        
        if lineSpacing > 0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            uiView.attributedText = NSAttributedString(
                string: text,
                attributes: [.paragraphStyle: paragraphStyle]
            )
        } else {
            uiView.text = text
        }
        
        DispatchQueue.main.async {
            updateLineCount(label: uiView)
        }
    }
    
    private func updateLineCount(label: UILabel) {
        let size = label.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
        let effectiveLineHeight = font.lineHeight + lineSpacing
        let lines = Int(round(size.height / effectiveLineHeight))
        onUpdate(lines)
    }
}
