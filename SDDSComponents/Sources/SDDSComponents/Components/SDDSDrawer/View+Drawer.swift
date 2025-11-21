import SwiftUI
@_exported import SDDSThemeCore

public extension View {
    func drawer<Header: View, Content: View, Footer: View>(
        isPresented: Binding<Bool>,
        appearance: DrawerAppearance,
        alignment: DrawerAlignment = .bottom,
        overlayAppearance: OverlayAppearance? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder footer: @escaping () -> Footer
    ) -> some View {
        drawerWithZStack(
            isPresented: isPresented,
            appearance: appearance,
            alignment: alignment,
            overlayAppearance: overlayAppearance,
            onClose: onClose,
            header: header,
            content: content,
            footer: footer
        )
    }
}

public extension View {
    func drawer<Content: View>(
        isPresented: Binding<Bool>,
        appearance: DrawerAppearance,
        alignment: DrawerAlignment = .bottom,
        overlayAppearance: OverlayAppearance? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.drawer(
            isPresented: isPresented,
            appearance: appearance,
            alignment: alignment,
            overlayAppearance: overlayAppearance,
            onClose: onClose,
            header: { EmptyView() },
            content: content,
            footer: { EmptyView() }
        )
    }
}

private extension View {
    @ViewBuilder
    func drawerWithZStack<Header: View, Content: View, Footer: View>(
        isPresented: Binding<Bool>,
        appearance: DrawerAppearance,
        alignment: DrawerAlignment,
        overlayAppearance: OverlayAppearance?,
        onClose: (() -> Void)?,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder footer: @escaping () -> Footer
    ) -> some View {
        ZStack {
            if alignment == .left || alignment == .right {
                DrawerHorizontalView(
                    mainContent: self,
                    alignment: alignment,
                    isPresented: isPresented,
                    appearance: appearance,
                    overlayAppearance: overlayAppearance,
                    onClose: onClose,
                    header: header,
                    content: content,
                    footer: footer
                )
            } else {
                self
                
                if isPresented.wrappedValue {
                    DrawerVerticalView(
                        isPresented: isPresented,
                        appearance: appearance,
                        alignment: alignment,
                        overlayAppearance: overlayAppearance,
                        onClose: onClose,
                        header: header,
                        content: content,
                        footer: footer
                    )
                }
            }
        }
    }
    
}

