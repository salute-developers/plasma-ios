import SwiftUI
import UIKit

struct BottomSheetViewController<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let content: Content
    let configuration: BottomSheetPresentationConfiguration
    let onBottomSheetScrollChange: OnBottomSheetScrollChange
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let hostingController = UIHostingController(rootView: content)
            hostingController.modalPresentationStyle = .custom
            
            let transitioningDelegate = context.coordinator.transitioningDelegate
            transitioningDelegate.configuration = configuration
            transitioningDelegate.onBottomSheetScrollChange = onBottomSheetScrollChange
            hostingController.transitioningDelegate = transitioningDelegate
            
            if uiViewController.presentedViewController == nil {
                uiViewController.present(hostingController, animated: true)
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
