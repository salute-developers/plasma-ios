import UIKit
import SwiftUI

final class WindowOverlayService {
    static let shared = WindowOverlayService()
    private var window: UIWindow?
    private var scene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    private var tapGesture: UITapGestureRecognizer?
    private var onClose: (() -> Void)?
    private var lastFrame: CGRect = .zero
    private var contentBuilder: (() -> AnyView)?
    private var rootViewController: UIViewController?
    private var hostingController: UIHostingController<AnyView>?
    private var stackedToasts: [StackedToast] = []
    private var toastContainerView: PassthroughView?
    
    private init() {}
    
    private func createWindow() -> UIWindow? {
        guard let scene = scene else {
            print("No active window scene found")
            return nil
        }
        
        let window = UIWindow(windowScene: scene)
        window.windowLevel = .alert + 1
        window.backgroundColor = .clear
        window.isHidden = false
        window.makeKeyAndVisible()
        
        return window
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
        guard let window = createWindow() else { return }
        window.isUserInteractionEnabled = true
        
        self.lastFrame = frame
        self.contentBuilder = { AnyView(
            content()
        ) }
        self.onClose = onClose
        
        setupOrientationObserver()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideGesture))
        self.tapGesture = tapGesture
        window.addGestureRecognizer(tapGesture)
        
        let hosting = createHostingController(for: frame, window: window)
        
        window.rootViewController = hosting
        self.window = window
    }

    @objc private func orientationDidChange() {
        guard let window = self.window, let content = self.contentBuilder else { return }
        let hosting = createHostingController(for: lastFrame, window: window)
        window.rootViewController = hosting
    }

    private func createHostingController(for frame: CGRect, window: UIWindow) -> UIHostingController<some View> {
        let screenBounds = UIScreen.main.bounds
        let offsetX = frame.origin.x - screenBounds.width / 2 + frame.width / 2
        
        let isLandscape = UIDevice.current.orientation.isLandscape
        let offsetY: CGFloat
        if isLandscape || UIDevice.current.orientation == .portraitUpsideDown {
            offsetY = frame.origin.y + window.safeAreaInsets.bottom - (screenBounds.height - window.safeAreaInsets.bottom) / 2
        } else {
            offsetY = frame.origin.y - screenBounds.height / 2 + 3 * frame.height / 2 - window.safeAreaInsets.top
        }

        let hosting = UIHostingController(rootView:
            contentBuilder?()
                .frame(width: frame.width, height: frame.height)
                .offset(x: offsetX, y: offsetY)
                .ignoresSafeArea(.all)
        )
        hosting.view.backgroundColor = .clear
        return hosting
    }
    
    @objc private func hideGesture(_ gesture: UITapGestureRecognizer) {
        var location = gesture.location(in: window)
        
        let screenBounds = UIScreen.main.bounds
        let offsetX = lastFrame.origin.x - screenBounds.width / 2 + lastFrame.width / 2
        
        let isLandscape = UIDevice.current.orientation.isLandscape
        let offsetY: CGFloat
        if isLandscape || UIDevice.current.orientation == .portraitUpsideDown {
            location.y += 20
            offsetY = lastFrame.origin.y + (window?.safeAreaInsets.bottom ?? 0) - (screenBounds.height - (window?.safeAreaInsets.bottom ?? 0)) / 2
        } else {
            location.y -= 40
            offsetY = lastFrame.origin.y - screenBounds.height / 2 + 3 * lastFrame.height / 2 - (window?.safeAreaInsets.top ?? 0)
        }
        
        let contentFrame = CGRect(
            x: screenBounds.width / 2 - lastFrame.width / 2 + offsetX,
            y: lastFrame.origin.y,
            width: lastFrame.width,
            height: lastFrame.height
        )
                
        if contentFrame.contains(location) {
            return
        }
        hide()
    }
    
    func hide() {
        removeOrientationObserver()
        window?.isHidden = true
        window = nil
        onClose?()
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
