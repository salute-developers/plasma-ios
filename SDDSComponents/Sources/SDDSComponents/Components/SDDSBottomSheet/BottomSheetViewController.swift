import SwiftUI
import UIKit

struct BottomSheetViewController<Header: View, Content: View, Footer: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var bottomSheetScrollProgress: CGFloat
    let content: SDDSBottomSheet<Header, Content, Footer>
    let configuration: BottomSheetPresentationConfiguration
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let pathDrawer = content.appearance.size.pathDrawer as? CornerRadiusDrawer
            let cornerRadius = pathDrawer?.cornerRadius ?? 0
            let wrapperViewController = BottomSheetWrapperViewController(content: content, cornerRadius: cornerRadius)
            wrapperViewController.modalPresentationStyle = .custom
            
            let transitioningDelegate = context.coordinator.transitioningDelegate
            transitioningDelegate.configuration = configuration
            transitioningDelegate.onBottomSheetScrollChange = { value in
                self.bottomSheetScrollProgress = value
            }
            wrapperViewController.transitioningDelegate = transitioningDelegate
            
            if uiViewController.presentedViewController == nil {
                uiViewController.present(wrapperViewController, animated: true)
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

private final class BottomSheetWrapperViewController: UIViewController {
    private let hostingController: UIHostingController<AnyView>
    private let cornerRadius: CGFloat
    
    init(content: some View, cornerRadius: CGFloat) {
        self.hostingController = UIHostingController(rootView: AnyView(content))
        self.cornerRadius = cornerRadius
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        setupHostingController()
    }
    
    private func setupHostingController() {
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.layer.cornerRadius = cornerRadius
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
