import SwiftUI
import UIKit

struct SheetPresentationForSwiftUI<Content>: UIViewRepresentable where Content: View {
    
    @Binding var isPresented: Bool
    @Binding var scrollProgress: CGFloat
    let onDismiss: (() -> Void)?
    let detents: [UISheetPresentationController.Detent]
    let content: Content
    
    init(
        _ isPresented: Binding<Bool>,
        scrollProgress: Binding<CGFloat> = .constant(0),
        onDismiss: (() -> Void)? = nil,
        detents: [UISheetPresentationController.Detent] = [.medium()],
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = isPresented
        self._scrollProgress = scrollProgress
        self.onDismiss = onDismiss
        self.detents = detents
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let viewController = UIViewController()
        
        let hostingController = UIHostingController(rootView: content)
        
        viewController.addChild(hostingController)
        viewController.view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
        ])
        hostingController.didMove(toParent: viewController)
        
        if let sheetController = viewController.presentationController as? UISheetPresentationController {
            sheetController.detents = detents
            sheetController.prefersGrabberVisible = true
            sheetController.prefersScrollingExpandsWhenScrolledToEdge = false
            sheetController.largestUndimmedDetentIdentifier = .medium
            
            sheetController.delegate = context.coordinator
        }
        
        if isPresented {
            uiView.window?.rootViewController?.present(viewController, animated: true)
        } else {
            uiView.window?.rootViewController?.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented, scrollProgress: $scrollProgress, onDismiss: onDismiss)
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        @Binding var isPresented: Bool
        @Binding var scrollProgress: CGFloat
        let onDismiss: (() -> Void)?
        
        init(isPresented: Binding<Bool>, scrollProgress: Binding<CGFloat>, onDismiss: (() -> Void)? = nil) {
            self._isPresented = isPresented
            self._scrollProgress = scrollProgress
            self.onDismiss = onDismiss
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            isPresented = false
            onDismiss?()
        }
        
        func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {

        }
        
        func sheetPresentationControllerDidSetSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {

        }
    }
}
