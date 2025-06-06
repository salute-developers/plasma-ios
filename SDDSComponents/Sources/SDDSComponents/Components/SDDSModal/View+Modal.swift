import SwiftUI
import SDDSIcons

public extension View {
    func modal<Content: View>(
        isPresented: Binding<Bool>,
        appearance: ModalAppearance,
        closeImage: Image = Asset.close36.image,
        useNativeBlackout: Bool = true,
        onShow: (() -> Void)? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        let params = ModalParams(
            isPresented: isPresented,
            appearance: appearance,
            closeImage: closeImage,
            useNativeBlackout: useNativeBlackout,
            onShow: onShow,
            onClose: onClose,
            content: content
        )
        
        return self
            .task(id: isPresented.wrappedValue) {
                if isPresented.wrappedValue {
                    showModal(params: params)
                }
            }
    }
    
    private func showModal<Content: View>(
        params: ModalParams<Content>
    ) {
        WindowOverlayService.shared.showCentered(
            content: {
                SDDSModal(
                    content: params.content,
                    closeImage: params.closeImage,
                    appearance: params.appearance,
                    useNativeBlackout: params.useNativeBlackout,
                    onClose: {
                        WindowOverlayService.shared.hide()
                        params.onClose?()
                    }
                )
            },
            onClose: nil
        )
        params.onShow?()
        params.isPresented.wrappedValue = false
    }
}

private struct ModalParams<Content: View> {
    let isPresented: Binding<Bool>
    let appearance: ModalAppearance
    let closeImage: Image
    let useNativeBlackout: Bool
    let onShow: (() -> Void)?
    let onClose: (() -> Void)?
    let content: () -> Content
} 
