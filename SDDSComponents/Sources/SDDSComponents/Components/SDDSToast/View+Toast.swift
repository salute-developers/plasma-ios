import SwiftUI

private struct ToastParams<ContentStart: View, Content: View, ContentEnd: View> {
    let isPresented: Binding<Bool>
    let appearance: ToastAppearance
    let position: ToastPosition
    let duration: TimeInterval
    let contentEndPosition: ToasContentEndPosition
    let onShow: ((ToastID) -> Void)?
    let onClose: ((ToastID) -> Void)?
    let contentStart: () -> ContentStart
    let content: () -> Content
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
        return self.toast(
            isPresented: isPresented,
            appearance: appearance,
            position: position,
            duration: duration,
            contentEndPosition: .centerRight,
            onShow: onShow,
            onClose: onClose,
            contentStart: contentStart,
            content: { Text(text) },
            contentEnd: contentEnd
        )
    }
} 
 
extension View {
    func toast<ContentStart: View, Content: View, ContentEnd: View>(
        isPresented: Binding<Bool>,
        appearance: ToastAppearance,
        position: ToastPosition = .topCenter,
        duration: TimeInterval = 3.0,
        contentEndPosition: ToasContentEndPosition,
        onShow: ((ToastID) -> Void)? = nil,
        onClose: ((ToastID) -> Void)? = nil,
        @ViewBuilder contentStart: @escaping () -> ContentStart,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder contentEnd: @escaping () -> ContentEnd
    ) -> some View {
        let params = ToastParams(
            isPresented: isPresented,
            appearance: appearance,
            position: position,
            duration: duration,
            contentEndPosition: contentEndPosition,
            onShow: onShow,
            onClose: onClose,
            contentStart: contentStart,
            content: content,
            contentEnd: contentEnd
        )
        
        return self
            .task(id: isPresented.wrappedValue) {
                if isPresented.wrappedValue {
                    showToast(params: params)
                }
            }
    }
    
    private func showToast<ContentStart: View, Content: View, ContentEnd: View>(
        params: ToastParams<ContentStart, Content, ContentEnd>
    ) {
        let toastID = UUID()
        WindowOverlayService.shared.showInStack(
            content: {
                SDDSToast(
                    contentStart: params.contentStart,
                    content: params.content,
                    contentEnd: params.contentEnd,
                    appearance: params.appearance,
                    contentEndPosition: params.contentEndPosition,
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
