import Foundation
import SwiftUI

struct RoundedCornersMask<Content: View>: UIViewRepresentable {
    var cornerRadius: CGFloat
    var content: Content

    func makeUIView(context: Context) -> UIView {
        let hostingController = UIHostingController(rootView: content)
        hostingController.view.backgroundColor = .clear

        hostingController.view.layer.cornerRadius = cornerRadius
        hostingController.view.layer.masksToBounds = true

        return hostingController.view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
