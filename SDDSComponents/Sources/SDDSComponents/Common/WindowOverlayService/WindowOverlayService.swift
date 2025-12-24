import UIKit
import SwiftUI

final class WindowOverlayService: NSObject {
    static let shared = WindowOverlayService()
    private var overlayContainerView: UIView?
    private var scene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    private var tapGesture: UITapGestureRecognizer?
    private var onClose: (() -> Void)?
    private var lastFrame: CGRect = .zero
    private var contentBuilder: (() -> AnyView)?
    private var rootViewController: UIViewController?
    private var hostingController: UIHostingController<AnyView>?
    private var overlayHostingController: UIHostingController<AnyView>?
    private var stackedToasts: [StackedToast] = []
    private var toastContainerView: PassthroughView?
    private var hideOnTap: Bool = true
    
    private override init() {
        super.init()
    }
    
    private func getExistingWindow() -> UIWindow? {
        return scene?.windows.first
    }
    
    private func setupToastContainer() {
        guard let window = scene?.windows.first else { return }
        
        if toastContainerView == nil {
            toastContainerView = PassthroughView(frame: window.bounds)
            toastContainerView?.backgroundColor = .clear
            
            window.addSubview(toastContainerView!)
        }
        
        toastContainerView?.frame = window.bounds
    }
    
    private func setupOrientationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChange),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
    
    private func removeOrientationObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
    
    func show<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        at frame: CGRect,
        hideOnTap: Bool = true,
        onClose: (() -> Void)? = nil
    ) {
        guard let existingWindow = getExistingWindow() else {
            print("No existing window found")
            return
        }
        
        self.lastFrame = frame
        self.contentBuilder = { AnyView(
            content()
        ) }
        self.onClose = onClose
        self.hideOnTap = hideOnTap
        
        if overlayHostingController != nil {
            updateContent(in: existingWindow, frame: frame, content: content, onClose: onClose)
            return
        }
        
        setupOrientationObserver()
        
        setupOverlayContainer(in: existingWindow)
        
        let hosting = createHostingController(for: frame, window: existingWindow)
        overlayHostingController = hosting
        
        if let container = overlayContainerView {
            hosting.view.frame = calculateViewFrame(for: frame, in: existingWindow)
            hosting.view.backgroundColor = UIColor.clear
            hosting.view.isUserInteractionEnabled = true
            container.addSubview(hosting.view)
            
            if let containerView = container as? OverlayContainerView {
                containerView.contentView = hosting.view
            }
            
            setupTapGesture()
        }
    }
    
    private func setupOverlayContainer(in window: UIWindow) {
        if overlayContainerView == nil {
            let containerView = OverlayContainerView(frame: window.bounds)
            containerView.backgroundColor = .clear
            containerView.isUserInteractionEnabled = true
            window.addSubview(containerView)
            overlayContainerView = containerView
        }
        overlayContainerView?.frame = window.bounds
        if let containerView = overlayContainerView as? OverlayContainerView {
            containerView.contentView = overlayHostingController?.view
        }
    }
    
    private func setupTapGesture() {
        if let oldGesture = tapGesture, let container = overlayContainerView {
            container.removeGestureRecognizer(oldGesture)
        }
        
        if hideOnTap, let container = overlayContainerView {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideGesture))
            tapGesture.cancelsTouchesInView = false
            tapGesture.delegate = self
            container.addGestureRecognizer(tapGesture)
            self.tapGesture = tapGesture
        } else {
            self.tapGesture = nil
        }
    }
    
    private func calculateViewFrame(for frame: CGRect, in window: UIWindow) -> CGRect {
        return frame
    }
    
    private func updateContent<Content: View>(
        in window: UIWindow,
        frame: CGRect,
        @ViewBuilder content: @escaping () -> Content,
        onClose: (() -> Void)?
    ) {
        self.lastFrame = frame
        self.contentBuilder = { AnyView(
            content()
        ) }
        self.onClose = onClose
        
        if let existingController = overlayHostingController {
            let baseContent = contentBuilder?() ?? AnyView(EmptyView())
            let newContent = baseContent
                .frame(width: frame.width, height: frame.height)
                .ignoresSafeArea(.all)
            
            existingController.rootView = AnyView(newContent)
            existingController.view.frame = calculateViewFrame(for: frame, in: window)
            
            if let containerView = overlayContainerView as? OverlayContainerView {
                containerView.contentView = existingController.view
            }
            
            setupTapGesture()
        } else {
            let hosting = createHostingController(for: frame, window: window)
            overlayHostingController = hosting
            
            if let container = overlayContainerView {
                hosting.view.frame = calculateViewFrame(for: frame, in: window)
                hosting.view.backgroundColor = UIColor.clear
                hosting.view.isUserInteractionEnabled = true
                container.addSubview(hosting.view)
                
                if let containerView = container as? OverlayContainerView {
                    containerView.contentView = hosting.view
                }
                
                setupTapGesture()
            }
        }
    }
    

    @objc private func orientationDidChange() {
        guard let window = getExistingWindow(), let content = self.contentBuilder else { return }
        overlayContainerView?.frame = window.bounds
        
        if let existingController = overlayHostingController {
            let baseContent = contentBuilder?() ?? AnyView(EmptyView())
            let newContent = baseContent
                .frame(width: lastFrame.width, height: lastFrame.height)
                .ignoresSafeArea(.all)
            
            existingController.rootView = AnyView(newContent)
            existingController.view.frame = calculateViewFrame(for: lastFrame, in: window)
        } else {
            let hosting = createHostingController(for: lastFrame, window: window)
            overlayHostingController = hosting
            
            if let container = overlayContainerView {
                hosting.view.frame = calculateViewFrame(for: lastFrame, in: window)
                hosting.view.backgroundColor = UIColor.clear
                hosting.view.isUserInteractionEnabled = true
                container.addSubview(hosting.view)
                
                if let containerView = container as? OverlayContainerView {
                    containerView.contentView = hosting.view
                }
                
                setupTapGesture()
            }
        }
    }

    private func createHostingController(for frame: CGRect, window: UIWindow) -> UIHostingController<AnyView> {
        let baseContent = contentBuilder?() ?? AnyView(EmptyView())
        let content = baseContent
            .frame(width: frame.width, height: frame.height)
            .ignoresSafeArea(.all)

        let hosting = UIHostingController(rootView: AnyView(content))
        hosting.view.backgroundColor = UIColor.clear
        return hosting
    }
    
    @objc private func hideGesture(_ gesture: UITapGestureRecognizer) {
        guard hideOnTap, gesture.state == .ended else { return }
        
        guard let container = overlayContainerView,
              let hostingView = overlayHostingController?.view else {
            hide()
            return
        }
        
        let location = gesture.location(in: container)
        let hostingLocation = container.convert(location, to: hostingView)
        
        if hostingView.bounds.contains(hostingLocation) {
            if let hitView = hostingView.hitTest(hostingLocation, with: nil) {
                return
            }
        }
        
        hide()
    }
    
    func hide() {
        removeOrientationObserver()
        overlayHostingController?.view.removeFromSuperview()
        overlayHostingController = nil
        if let gesture = tapGesture, let container = overlayContainerView {
            container.removeGestureRecognizer(gesture)
        }
        tapGesture = nil
        overlayContainerView?.removeFromSuperview()
        overlayContainerView = nil
        onClose?()
    }
    
    func updateContentIfVisible<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        at frame: CGRect? = nil,
        onClose: (() -> Void)? = nil
    ) {
        if let window = getExistingWindow(), 
           let existingController = overlayHostingController,
           existingController.view.superview != nil {
            self.contentBuilder = { AnyView(content()) }
            
            let targetFrame = frame ?? lastFrame
            self.lastFrame = targetFrame
            if let onClose = onClose {
                self.onClose = onClose
            }
            
            RunLoop.main.perform(inModes: [.common]) { [weak self, weak existingController] in
                guard let self = self, let existingController = existingController,
                      let window = self.getExistingWindow(),
                      existingController.view.superview != nil else {
                    return
                }
                
                let baseContent = self.contentBuilder?() ?? AnyView(EmptyView())
                let newContent = baseContent
                    .frame(width: targetFrame.width, height: targetFrame.height)
                    .ignoresSafeArea(.all)
                
                existingController.rootView = AnyView(newContent)
                existingController.view.frame = self.calculateViewFrame(for: targetFrame, in: window)
            }
        } else {
            let targetFrame = frame ?? lastFrame
            guard targetFrame.width > 0 && targetFrame.height > 0 else {
                return
            }
            self.contentBuilder = { AnyView(content()) }
            if let onClose = onClose {
                self.onClose = onClose
            }
            show(content: content, at: targetFrame, onClose: onClose)
        }
    }
    
    private func updateStackedToasts() {
        guard !stackedToasts.isEmpty else {
            hostingController?.view.removeFromSuperview()
            hostingController = nil
            return
        }
        
        guard let firstToast = stackedToasts.first else { return }
        let position = firstToast.position
        
        let stackView = VStack(spacing: 8) {
            if position.stackDirection == .down {
                ForEach(stackedToasts) { toast in
                    toast.view
                        .padding(.zero)
                        .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                }
            } else {
                ForEach(stackedToasts.reversed()) { toast in
                    toast.view
                        .padding(.zero)
                        .transition(.opacity.animation(.easeInOut(duration: 0.3)))
                }
            }
        }
        .padding(.zero)
        .animation(.easeInOut(duration: 0.3), value: stackedToasts.count)
        
        let stackViewContainer = stackView
            .background(Color.clear)
        
        let horizontalContainer = Group {
            switch position.horizontalAlignment {
            case .leading:
                HStack {
                    stackViewContainer
                    Spacer()
                }
            case .trailing:
                HStack {
                    Spacer()
                    stackViewContainer
                }
            case .center:
                HStack {
                    Spacer()
                    stackViewContainer
                    Spacer()
                }
            default:
                EmptyView()
            }
        }
        
        let hostingView = AnyView(
            Group {
                switch position.verticalAlignment {
                case .top:
                    VStack {
                        horizontalContainer
                        Spacer()
                    }
                case .bottom:
                    VStack {
                        Spacer()
                        horizontalContainer
                    }
                case .center:
                    VStack {
                        Spacer()
                        horizontalContainer
                        Spacer()
                    }
                default:
                    EmptyView()
                }
            }
        )
        
        if hostingController == nil {
            hostingController = UIHostingController(rootView: hostingView)
            hostingController?.view.backgroundColor = .clear
            hostingController?.view.isUserInteractionEnabled = true
            
            setupToastContainer()
            toastContainerView?.hostingView = hostingController!.view
            toastContainerView?.addSubview(hostingController!.view)
            hostingController?.view.frame = toastContainerView?.bounds ?? .zero
        } else {
            hostingController?.rootView = hostingView
        }
    }
    
    func showInStack<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        id: ToastID,
        position: ToastPosition,
        duration: TimeInterval,
        onClose: (() -> Void)? = nil
    ) {
        let toast = StackedToast(
            id: id,
            view: AnyView(content()),
            position: position,
            duration: duration,
            onClose: onClose
        )
        
        withAnimation(.easeInOut(duration: 0.3)) {
        stackedToasts.append(toast)
            updateStackedToasts()
        }
        
        if duration > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) { [weak self] in
                self?.hideInStack(id: id)
            }
        }
    }
    
    func hideInStack(id: ToastID) {
        guard let index = stackedToasts.firstIndex(where: { $0.id == id }) else {
            return
        }
        
        let toast = stackedToasts.remove(at: index)
        toast.onClose?()
        
        withAnimation(.easeInOut(duration: 0.3)) {
            updateStackedToasts()
        }
        
        if stackedToasts.isEmpty {
            toastContainerView?.removeFromSuperview()
            toastContainerView = nil
        }
    }
    
    func hideAllInStack() {
        stackedToasts.forEach { $0.onClose?() }
        
        withAnimation(.easeInOut(duration: 0.3)) {
        stackedToasts.removeAll()
        updateStackedToasts()
        }
        
        toastContainerView?.removeFromSuperview()
        toastContainerView = nil
    }

    func showCentered<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        onClose: (() -> Void)? = nil
    ) {
        let contentView = content()
        let hostingController = UIHostingController(rootView: contentView)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        hostingController.view.layoutIfNeeded()
        
        let size = hostingController.view.systemLayoutSizeFitting(
            CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height),
            withHorizontalFittingPriority: .fittingSizeLevel,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        let x = (UIScreen.main.bounds.width - size.width) / 2
        let y = (UIScreen.main.bounds.height - size.height) / 2
        let frame = CGRect(x: x, y: y, width: size.width, height: size.height)
        
        show(
            content: { contentView },
            at: frame,
            onClose: onClose
        )
    }
}

extension WindowOverlayService: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let container = overlayContainerView,
              let hostingView = overlayHostingController?.view else {
            return true
        }
        
        let location = touch.location(in: container)
        let hostingLocation = container.convert(location, to: hostingView)
        
        if hostingView.bounds.contains(hostingLocation) {
            if let hitView = hostingView.hitTest(hostingLocation, with: nil) {
                return false
            }
        }
        
        return true
    }
}

