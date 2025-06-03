import SwiftUI

struct AutoCloseModifier: ViewModifier {
    let duration: TimeInterval?
    let onClose: (() -> Void)?
    
    @State private var autoCloseTimer: Timer?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if let duration = duration {
                    autoCloseTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
                        onClose?()
                    }
                }
            }
            .onDisappear {
                autoCloseTimer?.invalidate()
                autoCloseTimer = nil
            }
    }
}

extension View {
    func autoClose(duration: TimeInterval?, onClose: (() -> Void)? = nil) -> some View {
        modifier(AutoCloseModifier(duration: duration, onClose: onClose))
    }
} 