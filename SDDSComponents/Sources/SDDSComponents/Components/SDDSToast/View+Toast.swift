import SwiftUI

private struct ToastParams<ContentStart: View, ContentEnd: View> {
    let isPresented: Binding<Bool>
    let text: String
    let appearance: ToastAppearance
    let position: ToastPosition
    let duration: TimeInterval
    let onShow: ((ToastID) -> Void)?
    let onClose: ((ToastID) -> Void)?
    let contentStart: () -> ContentStart
    let contentEnd: () -> ContentEnd
}

public extension View {
    func toast<ContentStart: View, ContentEnd: View>(
        isPresented: Binding<Bool>,
        text: String,
        appearance: ToastAppearance,
        position: ToastPosition = .topCenter,
        duration: TimeInterval = 3.0,
        onShow: ((ToastID) -> Void)? = nil,
        onClose: ((ToastID) -> Void)? = nil,
        @ViewBuilder contentStart: @escaping () -> ContentStart,
        @ViewBuilder contentEnd: @escaping () -> ContentEnd
    ) -> some View {
        let params = ToastParams(
            isPresented: isPresented,
            text: text,
            appearance: appearance,
            position: position,
            duration: duration,
            onShow: onShow,
            onClose: onClose,
            contentStart: contentStart,
            contentEnd: contentEnd
        )
        
        return self
            .task(id: isPresented.wrappedValue) {
                if isPresented.wrappedValue {
                    showToast(params: params)
                }
            }
    }
    
    private func showToast<ContentStart: View, ContentEnd: View>(
        params: ToastParams<ContentStart, ContentEnd>
    ) {
        let toastID = UUID()
        WindowOverlayService.shared.showInStack(
            content: {
                SDDSToast(
                    text: params.text,
                    contentStart: params.contentStart,
                    contentEnd: params.contentEnd,
                    appearance: params.appearance,
                    onClose: {
                        WindowOverlayService.shared.hideInStack(id: toastID)
                        params.onClose?(toastID)
                    }
                )
            },
            id: toastID,
            position: params.position,
            duration: params.duration,
            onClose: nil
        )
        params.onShow?(toastID)
        params.isPresented.wrappedValue = false
    }
} 
 
