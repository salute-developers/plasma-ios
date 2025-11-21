import SwiftUI
@_exported import SDDSThemeCore

struct DrawerHorizontalView<MainContent: View, Header: View, Content: View, Footer: View>: View {
    let mainContent: MainContent
    let alignment: DrawerAlignment
    @Binding var isPresented: Bool
    let appearance: DrawerAppearance
    let overlayAppearance: OverlayAppearance?
    let onClose: (() -> Void)?
    let header: () -> Header
    let content: () -> Content
    let footer: () -> Footer
    
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var drawerWidth: CGFloat = 0
    @State private var hasAppeared: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                if alignment == .left {
                    if isPresented {
                        drawerView(geometry: geometry)
                    }
                    
                    mainContent
                        .frame(width: geometry.size.width)
                } else {
                    mainContent
                        .frame(width: geometry.size.width)
                    
                    if isPresented {
                        drawerView(geometry: geometry)
                    }
                }
            }
            .offset(x: hStackOffset)
            .animation(.spring(response: 0.3, dampingFraction: 0.8), value: hStackOffset)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                Group {
                    if isPresented {
                        if let overlayAppearance = overlayAppearance {
                            SDDSOverlay(
                                isPresented: .constant(true),
                                appearance: overlayAppearance
                            ) {
                                Color.clear
                            }
                            .onTapGesture {
                                closeDrawer(geometry: geometry)
                            }
                        }
                    }
                }
            )
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        handleDragChanged(value: value, geometry: geometry)
                    }
                    .onEnded { value in
                        handleDragEnded(value: value, geometry: geometry)
                    }
            )
        }
        .onChange(of: isPresented) { newValue in
            if newValue && !hasAppeared {
                hasAppeared = true
            } else if !newValue {
                hasAppeared = false
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    dragOffset = 0
                }
            }
        }
        .onChange(of: drawerWidth) { newWidth in
            if isPresented && hasAppeared && newWidth > 0 {
                let initialWidth = newWidth
                
                if dragOffset == 0 {
                    if alignment == .left {
                        dragOffset = -initialWidth
                    } else {
                        dragOffset = initialWidth
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            dragOffset = 0
                        }
                    }
                }
            }
        }
    }
    
    private var hStackOffset: CGFloat {
        if !isPresented || drawerWidth <= 0 {
            return 0
        }
        
        if alignment == .left {
            return drawerWidth + dragOffset
        } else {
            return -drawerWidth + dragOffset
        }
    }
    
    @ViewBuilder
    private func drawerView(geometry: GeometryProxy) -> some View {
        SDDSDrawer(
            appearance: appearance,
            onClose: {
                closeDrawer(geometry: geometry)
            },
            header: header,
            content: content,
            footer: footer
        )
        .fixedSize(horizontal: true, vertical: false)
        .background(
            GeometryReader { drawerGeometry in
                Color.clear
                    .preference(key: DrawerWidthPreferenceKey.self, value: drawerGeometry.size.width)
            }
        )
        .onPreferenceChange(DrawerWidthPreferenceKey.self) { width in
            if width > 0 {
                drawerWidth = width
            }
        }
        .frame(width: drawerWidth > 0 ? drawerWidth : nil)
    }
    
    private func handleDragChanged(value: DragGesture.Value, geometry: GeometryProxy) {
        if !isDragging {
            isDragging = true
        }
        
        let translation = value.translation.width
        
        var transaction = Transaction(animation: .interactiveSpring())
        
        if alignment == .left {
            if translation < 0 {
                withTransaction(transaction) {
                    dragOffset = translation
                }
            }
        } else {
            if translation > 0 {
                withTransaction(transaction) {
                    dragOffset = translation
                }
            }
        }
    }
    
    private func handleDragEnded(value: DragGesture.Value, geometry: GeometryProxy) {
        isDragging = false
        
        let threshold: CGFloat = 80
        let velocityThreshold: CGFloat = 300
        let screenWidth = geometry.size.width
        let drawerWidthValue = drawerWidth > 0 ? drawerWidth : screenWidth * 0.8
        
        let shouldClose: Bool
        
        if alignment == .left {
            let velocity = value.velocity.width
            shouldClose = (velocity < -velocityThreshold && dragOffset < 0) || dragOffset < -threshold
        } else {
            let velocity = value.velocity.width
            shouldClose = (velocity > velocityThreshold && dragOffset > 0) || dragOffset > threshold
        }
        
        if shouldClose {
            closeDrawer(geometry: geometry)
        } else {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                dragOffset = 0
            }
        }
    }
    
    private func closeDrawer(geometry: GeometryProxy) {
        let screenWidth = geometry.size.width
        let drawerWidthValue = drawerWidth > 0 ? drawerWidth : screenWidth * 0.8
        
        let finalOffset: CGFloat
        if alignment == .left {
            finalOffset = -drawerWidthValue
        } else {
            finalOffset = drawerWidthValue
        }
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            dragOffset = finalOffset
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
            onClose?()
        }
    }
}
