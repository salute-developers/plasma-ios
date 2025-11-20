import SwiftUI
@_exported import SDDSThemeCore

struct DrawerVerticalView<Header: View, Content: View, Footer: View>: View {
    @Binding var isPresented: Bool
    let appearance: DrawerAppearance
    let alignment: DrawerAlignment
    let overlayAppearance: OverlayAppearance?
    let onClose: (() -> Void)?
    let header: () -> Header
    let content: () -> Content
    let footer: () -> Footer
    
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var drawerHeight: CGFloat = 0
    @State private var hasAppeared: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
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
                
                drawerContainer(geometry: geometry)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            handleDragChanged(value: value)
                        }
                        .onEnded { value in
                            handleDragEnded(value: value, geometry: geometry)
                        }
                )
            }
        }
        .onAppear {
            if !hasAppeared {
                hasAppeared = true
                let screenWidth = UIScreen.main.bounds.width
                let screenHeight = UIScreen.main.bounds.height
                
                switch alignment {
                case .top:
                    dragOffset = -screenHeight
                case .bottom:
                    dragOffset = screenHeight
                default:
                    break
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        dragOffset = 0
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func drawerContainer(geometry: GeometryProxy) -> some View {
                VStack {
                    if alignment == .top {
                        drawerView(geometry: geometry)
                        Spacer()
                    } else {
                        Spacer()
                        drawerView(geometry: geometry)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .offset(y: currentOffset(geometry: geometry))
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
        .background(
            GeometryReader { drawerGeometry in
                Color.clear
                    .preference(key: DrawerHeightPreferenceKey.self, value: drawerGeometry.size.height)
            }
        )
        .onPreferenceChange(DrawerHeightPreferenceKey.self) { height in
            if height > 0 {
                drawerHeight = height
            }
        }
    }
    
    private func handleDragChanged(value: DragGesture.Value) {
        if !isDragging {
            isDragging = true
        }
        
            let translation = value.translation.height
            
            if alignment == .top {
                if translation < 0 {
                    dragOffset = translation
                }
            } else {
                if translation > 0 {
                    dragOffset = translation
            }
        }
    }
    
    private func handleDragEnded(value: DragGesture.Value, geometry: GeometryProxy) {
        isDragging = false
        
        let threshold: CGFloat = 80
        let velocityThreshold: CGFloat = 300
        
        let shouldClose: Bool
        
        if alignment == .top {
            let velocity = value.velocity.height
            shouldClose = (velocity < -velocityThreshold && dragOffset < 0) || dragOffset < -threshold
        } else {
            let velocity = value.velocity.height
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
    
    private func currentOffset(geometry: GeometryProxy) -> CGFloat {
        return dragOffset
    }
    
    private func closeDrawer(geometry: GeometryProxy) {
        let screenHeight = geometry.size.height
        
        let finalOffset: CGFloat
        switch alignment {
        case .top:
            finalOffset = -screenHeight
        case .bottom:
            finalOffset = screenHeight
        default:
            finalOffset = 0
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
