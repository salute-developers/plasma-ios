import UIKit
import SwiftUI

final class GlobalPopoverManager {
    static let shared = GlobalPopoverManager()
    private var window: UIWindow?
    private var scene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    private var tapGesture: UITapGestureRecognizer?
    private var onClose: (() -> Void)?
    private var lastFrame: CGRect = .zero
    private var contentBuilder: (() -> AnyView)?
    
    func show<Content: View>(
        @ViewBuilder content: @escaping () -> Content,
        at frame: CGRect,
        onClose: (() -> Void)? = nil
    ) {
        guard let scene = scene else {
            print("No active window scene found")
            return
        }

        self.lastFrame = frame
        self.contentBuilder = { AnyView(content()) }
        self.onClose = onClose
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChange),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hide))
        self.tapGesture = tapGesture
        
        let window = UIWindow(windowScene: scene)
        window.windowLevel = .alert + 1
        window.backgroundColor = .clear
        window.isHidden = false
        window.makeKeyAndVisible()
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
    
    @objc func hide() {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        window?.isHidden = true
        window = nil
        onClose?()
    }
}
