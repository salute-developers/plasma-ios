import SwiftUI
import SDDSIcons

public extension View {
    func notification<Content: View>(
        isPresented: Binding<Bool>,
        appearance: NotificationAppearance,
        position: ToastPosition = .topCenter,
        duration: TimeInterval = 3.0,
        hasClose: Bool = true,
        onShow: ((ToastID) -> Void)? = nil,
        onClose: ((ToastID) -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.toast(
            isPresented: isPresented,
            appearance: toastAppearance(from: appearance),
            position: position,
            duration: duration,
            contentEndPosition: .topRight,
            onShow: onShow,
            onClose: onClose,
            contentStart: { EmptyView() },
            content: content,
            contentEnd: {
                if hasClose {
                    Asset.close36.image
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    EmptyView()
                }
            }
        )
    }
    
    private func toastAppearance(from notificationAppearance: NotificationAppearance) -> ToastAppearance {
        var appearance = ToastAppearance()
        appearance.backgroundColor = notificationAppearance.backgroundColor
        appearance.textColor = nil
        appearance.contentEndColor = notificationAppearance.closeColor
        
        var size = ZeroToastSize()
        size.contentEndSize = notificationAppearance.size.closeSize
        size.paddingEnd = notificationAppearance.size.paddingEnd
        size.paddingStart = notificationAppearance.size.paddingStart
        size.paddingTop = notificationAppearance.size.paddingTop
        size.paddingBottom = notificationAppearance.size.paddingBottom
        size.shape = notificationAppearance.size.shape
        appearance.size = size
        
        return appearance
    }
}
