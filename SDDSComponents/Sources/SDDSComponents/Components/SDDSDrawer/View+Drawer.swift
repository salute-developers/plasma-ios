import SwiftUI
@_exported import SDDSThemeCore

// swiftlint:disable function_parameter_count
public extension View {
    func drawer<Header: View, Content: View, Footer: View>(
        isPresented: Binding<Bool>,
        appearance: DrawerAppearance,
        alignment: DrawerAlignment = .bottom,
        overlayAppearance: OverlayAppearance? = nil,
        drawerWidth: CGFloat? = nil,
        drawerHeight: CGFloat? = nil,
        moveContentEnabled: Bool = false,
        peekOffset: CGFloat? = nil,
        closePlacement: DrawerClosePlacement = .right,
        hasHeader: Bool,
        hasFooter: Bool,
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
            drawerWidth: drawerWidth,
            drawerHeight: drawerHeight,
            moveContentEnabled: moveContentEnabled,
            peekOffset: peekOffset,
            closePlacement: closePlacement,
            hasHeader: hasHeader,
            hasFooter: hasFooter,
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
        drawerWidth: CGFloat? = nil,
        drawerHeight: CGFloat? = nil,
        moveContentEnabled: Bool = false,
        peekOffset: CGFloat? = nil,
        closePlacement: DrawerClosePlacement = .right,
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.drawer(
            isPresented: isPresented,
            appearance: appearance,
            alignment: alignment,
            overlayAppearance: overlayAppearance,
            drawerWidth: drawerWidth,
            drawerHeight: drawerHeight,
            moveContentEnabled: moveContentEnabled,
            closePlacement: closePlacement,
            hasHeader: false,
            hasFooter: false,
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
        drawerWidth: CGFloat?,
        drawerHeight: CGFloat?,
        moveContentEnabled: Bool,
        peekOffset: CGFloat?,
        closePlacement: DrawerClosePlacement,
        hasHeader: Bool,
        hasFooter: Bool,
        onClose: (() -> Void)?,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder footer: @escaping () -> Footer
    ) -> some View {
        if moveContentEnabled {
            DrawerMoveContentView(
                mainContent: self,
                alignment: alignment,
                isPresented: isPresented,
                appearance: appearance,
                overlayAppearance: overlayAppearance,
                closePlacement: closePlacement,
                hasHeader: hasHeader,
                hasFooter: hasFooter,
                onClose: onClose,
                header: header,
                content: content,
                footer: footer,
                explicitDrawerWidth: drawerWidth,
                explicitDrawerHeight: drawerHeight
            )
        } else {
            ZStack {
                self
                
                if isPresented.wrappedValue {
                    DrawerAboveContentView(
                        isPresented: isPresented,
                        appearance: appearance,
                        alignment: alignment,
                        overlayAppearance: overlayAppearance,
                        closePlacement: closePlacement,
                        peekOffset: peekOffset,
                        hasHeader: hasHeader,
                        hasFooter: hasFooter,
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
// swiftlint:enable function_parameter_count
