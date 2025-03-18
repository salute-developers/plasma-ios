import SwiftUI
import UIKit

struct BottomSheetViewController<Header: View, Content: View, Footer: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var detent: BottomSheetDetent?
    
    let content: SDDSBottomSheet<Header, Content, Footer>
    let configuration: BottomSheetPresentationConfiguration
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let pathDrawer = content.appearance.size.pathDrawer as? CornerRadiusDrawer
            let cornerRadius = pathDrawer?.cornerRadius ?? 0
            let containerViewController = BottomSheetContainerViewController(content: content, cornerRadius: cornerRadius, appearance: content.appearance)
            containerViewController.modalPresentationStyle = .custom
            
            let transitioningDelegate = context.coordinator.transitioningDelegate
            transitioningDelegate.configuration = configuration
            transitioningDelegate.onDismiss = {
                self.isPresented = false
            }
            transitioningDelegate.onBottomSheetScrollChange = { value in
                let presentedViewController = uiViewController.presentedViewController as? BottomSheetContainerViewController
                presentedViewController?.updateHandlePosition(progress: value)
            }
            transitioningDelegate.onChangeDetent = { detent in
                self.detent = detent
            }
            containerViewController.transitioningDelegate = transitioningDelegate
            
            if uiViewController.presentedViewController == nil {
                uiViewController.present(containerViewController, animated: true)
            }
        } else {
            if uiViewController.presentedViewController != nil {
                uiViewController.dismiss(animated: true)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject {
        let transitioningDelegate = BottomSheetTransitioningDelegate()
        var parent: BottomSheetViewController
        
        init(parent: BottomSheetViewController) {
            self.parent = parent
        }
    }
}
