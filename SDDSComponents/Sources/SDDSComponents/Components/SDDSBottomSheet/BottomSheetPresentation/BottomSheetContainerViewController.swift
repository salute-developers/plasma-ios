import UIKit
import SwiftUI

final class BottomSheetContainerViewController: UIViewController {
    private let hostingController: UIHostingController<AnyView>
    private let handleView: BottomSheetHandleUIView
    private let cornerRadius: CGFloat
    private let appearance: BottomSheetAppearance
    
    private var handleBottomConstraint: NSLayoutConstraint?
    private var handleTopConstraint: NSLayoutConstraint?
    
    init(content: some View, cornerRadius: CGFloat, appearance: BottomSheetAppearance) {
        self.hostingController = UIHostingController(rootView: AnyView(content))
        self.cornerRadius = cornerRadius
        self.handleView = BottomSheetHandleUIView(appearance: appearance)
        self.appearance = appearance
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
        hostingController.view.clipsToBounds = false
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.addSubview(handleView)
        
        handleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            handleView.widthAnchor.constraint(equalToConstant: appearance.size.handleWidth),
            handleView.heightAnchor.constraint(equalToConstant: appearance.size.handleHeight),
            handleView.centerXAnchor.constraint(equalTo: hostingController.view.centerXAnchor)
        ])
        
        let handleTotalOffset: CGFloat
        switch appearance.handlePlacement {
        case .outer, .auto:
            handleBottomConstraint = handleView.bottomAnchor.constraint(equalTo: hostingController.view.topAnchor, constant: -appearance.size.handleOffset)
            NSLayoutConstraint.activate([handleBottomConstraint!])
            handleTotalOffset = appearance.size.handleOffset + appearance.size.handleHeight
        case .inner:
            handleTopConstraint = handleView.topAnchor.constraint(equalTo: hostingController.view.topAnchor, constant: appearance.size.handleOffset)
            NSLayoutConstraint.activate([handleTopConstraint!])
            handleTotalOffset = 0
        case .none:
            handleView.isHidden = true
            handleTotalOffset = 0
        }
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: handleTotalOffset),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateHandlePosition(progress: CGFloat) {
        guard appearance.handlePlacement == .auto else { return }
        
        // В outer позиции handle находится над контентом
        let outerPosition = -appearance.size.handleOffset
        // В inner позиции handle находится внутри контента, но не выше safe area
        let safeAreaTop = view.safeAreaInsets.top
        let innerPosition = max(appearance.size.handleOffset + appearance.size.handleHeight, safeAreaTop)
        
        // Интерполируем между позициями
        let currentPosition = outerPosition + (innerPosition - outerPosition) * progress
        
        handleBottomConstraint?.constant = currentPosition
    }
}
