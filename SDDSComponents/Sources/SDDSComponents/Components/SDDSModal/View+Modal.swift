import SwiftUI

public extension View {
    func modal<Content: View>(
        isPresented: Binding<Bool>,
        appearance: ModalAppearance,
        closeImage: Image?,
        useNativeBlackout: Bool = true,
        subtheme: SubthemeData = SubthemeData(),
        onShow: (() -> Void)? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        let params = ModalParams(
            isPresented: isPresented,
            appearance: appearance,
            closeImage: closeImage,
            useNativeBlackout: useNativeBlackout,
            subtheme: subtheme,
            onShow: onShow,
            onClose: onClose,
            content: content
        )
        
        // AnyView обязателен. В iOS 26 SDK `.task(id:)` резолвится в перегрузку
        // task(id:name:priority:file:line:), помеченную @_alwaysEmitIntoClient: её
        // opaque type descriptor не экспортируется ни из SwiftUI.framework, ни из
        // SDDSComponents (эмитится как private external). Если этот opaque-тип
        // просачивается в публичный `some View`, приложение ссылается на descriptor
        // снаружи модуля и падает линковка: "Undefined symbol: opaque type descriptor
        // for ... View.task(id:name:priority:file:line:)". Стирание типа держит
        // descriptor внутри модуля. Не убирать без проверки архива на Xcode 26.
        return AnyView(
            ZStack {
                self
                
                if isPresented.wrappedValue {
                    color(useNativeBlackout: useNativeBlackout)
                    .ignoresSafeArea()
                }
            }
            .task(id: isPresented.wrappedValue) {
                if isPresented.wrappedValue {
                    showModal(params: params)
                }
            }
        )
    }
    
    private func color(useNativeBlackout: Bool) -> Color {
        if useNativeBlackout {
            Color.black.opacity(0.3)
        } else {
            Color.clear
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
                    onClose: {
                        WindowOverlayService.shared.hide()
                        params.isPresented.wrappedValue = false
                        params.onClose?()
                    }
                )
                .environment(\.subtheme, params.subtheme)
            },
            onClose: {
                params.isPresented.wrappedValue = false
                params.onClose?()
            }
        )
        params.onShow?()
    }
}

private struct ModalParams<Content: View> {
    let isPresented: Binding<Bool>
    let appearance: ModalAppearance
    let closeImage: Image?
    let useNativeBlackout: Bool
    let subtheme: SubthemeData
    let onShow: (() -> Void)?
    let onClose: (() -> Void)?
    let content: () -> Content
} 
