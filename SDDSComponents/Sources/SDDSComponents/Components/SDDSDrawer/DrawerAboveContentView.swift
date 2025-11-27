import SwiftUI
@_exported import SDDSThemeCore

struct DrawerAboveContentView<Header: View, Content: View, Footer: View>: View {
    @Binding var isPresented: Bool
    let appearance: DrawerAppearance
    let alignment: DrawerAlignment
    let overlayAppearance: OverlayAppearance?
    let closePlacement: DrawerClosePlacement
    let peekOffset: CGFloat?
    let hasHeader: Bool
    let hasFooter: Bool
    let onClose: (() -> Void)?
    let header: () -> Header
    let content: () -> Content
    let footer: () -> Footer
    
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var drawerHeight: CGFloat = 0
    @State private var drawerWidth: CGFloat = 0
    @State private var hasAppeared: Bool = false
    @State private var initialDragOffset: CGFloat = 0
    
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
                initializeDrawerPosition()
            }
        }
    }
    
    @ViewBuilder
    private func drawerContainer(geometry: GeometryProxy) -> some View {
        Group {
            if alignment == .top || alignment == .bottom {
                verticalContainer(geometry: geometry)
            } else {
                horizontalContainer(geometry: geometry)
            }
        }
    }
    
    @ViewBuilder
    private func verticalContainer(geometry: GeometryProxy) -> some View {
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
        .offset(y: currentOffset(geometry: geometry) + peekOffsetForVertical())
    }
    
    @ViewBuilder
    private func horizontalContainer(geometry: GeometryProxy) -> some View {
        HStack {
            if alignment == .left {
                drawerView(geometry: geometry)
                Spacer()
            } else {
                Spacer()
                drawerView(geometry: geometry)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .offset(x: currentOffset(geometry: geometry) + peekOffsetForHorizontal())
    }
    
    private func peekOffsetForVertical() -> CGFloat {
        guard let peekOffset = peekOffset else { return 0 }
        switch alignment {
        case .top:
            return -drawerHeight + peekOffset
        case .bottom:
            return drawerHeight - peekOffset
        default:
            return 0
        }
    }
    
    private func peekOffsetForHorizontal() -> CGFloat {
        guard let peekOffset = peekOffset else { return 0 }
        switch alignment {
        case .left:
            return -drawerWidth + peekOffset
        case .right:
            return drawerWidth - peekOffset
        default:
            return 0
        }
    }
    
    @ViewBuilder
    private func drawerView(geometry: GeometryProxy) -> some View {
        SDDSDrawer(
            appearance: appearance,
            onClose: {
                closeDrawer(geometry: geometry)
            },
            closePlacement: closePlacement,
            hasHeader: hasHeader,
            hasFooter: hasFooter,
            header: header,
            content: content,
            footer: footer
        )
        .readSize { size in
            drawerHeight = size.height
            drawerWidth = size.width
        }
    }
    
    private func handleDragChanged(value: DragGesture.Value) {
        if !isDragging {
            isDragging = true
            initialDragOffset = dragOffset
        }
        
        switch alignment {
        case .top:
            let translation = value.translation.height
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragChanged(
                    translation: translation,
                    maxOffset: drawerHeight - peekOffset!,
                    wasExpanded: initialDragOffset > 0,
                    isPositiveDirection: true
                )
            } else {
                if translation < 0 {
                    dragOffset = translation
                }
            }
        case .bottom:
            let translation = value.translation.height
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragChanged(
                    translation: translation,
                    maxOffset: -(drawerHeight - peekOffset!),
                    wasExpanded: initialDragOffset < 0,
                    isPositiveDirection: false
                )
            } else {
                if translation > 0 {
                    dragOffset = translation
                }
            }
        case .left:
            let translation = value.translation.width
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragChanged(
                    translation: translation,
                    maxOffset: drawerWidth - peekOffset!,
                    wasExpanded: initialDragOffset > 0,
                    isPositiveDirection: true
                )
            } else {
                if translation < 0 {
                    dragOffset = translation
                }
            }
        case .right:
            let translation = value.translation.width
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragChanged(
                    translation: translation,
                    maxOffset: -(drawerWidth - peekOffset!),
                    wasExpanded: initialDragOffset < 0,
                    isPositiveDirection: false
                )
            } else {
                if translation > 0 {
                    dragOffset = translation
                }
            }
        }
    }
    
    private func handlePeekOffsetDragChanged(
        translation: CGFloat,
        maxOffset: CGFloat,
        wasExpanded: Bool,
        isPositiveDirection: Bool
    ) {
        if isPositiveDirection {
            if translation > 0 {
                if wasExpanded {
                    dragOffset = initialDragOffset
                } else {
                    dragOffset = min(maxOffset, initialDragOffset + translation)
                }
            } else if translation < 0 {
                dragOffset = initialDragOffset + translation
            }
        } else {
            if translation < 0 {
                if wasExpanded {
                    dragOffset = initialDragOffset
                } else {
                    dragOffset = max(maxOffset, initialDragOffset + translation)
                }
            } else if translation > 0 {
                dragOffset = initialDragOffset + translation
            }
        }
    }
    
    private func handleDragEnded(value: DragGesture.Value, geometry: GeometryProxy) {
        isDragging = false
        
        let threshold: CGFloat = 80
        let velocityThreshold: CGFloat = 300
        
        let shouldClose: Bool
        
        switch alignment {
        case .top:
            let velocity = value.velocity.height
            let translation = value.translation.height
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragEnded(
                    velocity: velocity,
                    translation: translation,
                    threshold: threshold,
                    velocityThreshold: velocityThreshold,
                    wasExpanded: initialDragOffset > 0,
                    expandedOffset: drawerHeight - peekOffset!,
                    geometry: geometry
                )
                return
            } else {
                shouldClose = (velocity < -velocityThreshold && dragOffset < 0) || dragOffset < -threshold
            }
        case .bottom:
            let velocity = value.velocity.height
            let translation = value.translation.height
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragEnded(
                    velocity: velocity,
                    translation: translation,
                    threshold: threshold,
                    velocityThreshold: velocityThreshold,
                    wasExpanded: initialDragOffset < 0,
                    expandedOffset: -(drawerHeight - peekOffset!),
                    geometry: geometry
                )
                return
            } else {
                shouldClose = (velocity > velocityThreshold && dragOffset > 0) || dragOffset > threshold
            }
        case .left:
            let velocity = value.velocity.width
            let translation = value.translation.width
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragEnded(
                    velocity: velocity,
                    translation: translation,
                    threshold: threshold,
                    velocityThreshold: velocityThreshold,
                    wasExpanded: initialDragOffset > 0,
                    expandedOffset: drawerWidth - peekOffset!,
                    geometry: geometry
                )
                return
            } else {
                shouldClose = (velocity < -velocityThreshold && dragOffset < 0) || dragOffset < -threshold
            }
        case .right:
            let velocity = value.velocity.width
            let translation = value.translation.width
            if peekOffset != nil && isPresented {
                handlePeekOffsetDragEnded(
                    velocity: velocity,
                    translation: translation,
                    threshold: threshold,
                    velocityThreshold: velocityThreshold,
                    wasExpanded: initialDragOffset < 0,
                    expandedOffset: -(drawerWidth - peekOffset!),
                    geometry: geometry
                )
                return
            } else {
                shouldClose = (velocity > velocityThreshold && dragOffset > 0) || dragOffset > threshold
            }
        }
        
        if shouldClose {
            closeDrawer(geometry: geometry)
        } else {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                dragOffset = 0
            }
        }
    }
    
    private func handlePeekOffsetDragEnded(
        velocity: CGFloat,
        translation: CGFloat,
        threshold: CGFloat,
        velocityThreshold: CGFloat,
        wasExpanded: Bool,
        expandedOffset: CGFloat,
        geometry: GeometryProxy
    ) {
        let isPositiveExpanded = expandedOffset > 0
        let shouldExpand: Bool
        let shouldClose: Bool
        let shouldCollapse: Bool
        
        if wasExpanded {
            shouldExpand = false
            if isPositiveExpanded {
                shouldClose = false
                shouldCollapse = (velocity < 0 || translation < -threshold)
            } else {
                shouldClose = false
                shouldCollapse = (velocity > 0 || translation > threshold)
            }
        } else {
            if isPositiveExpanded {
                shouldExpand = (velocity > velocityThreshold && dragOffset > 0) || dragOffset > threshold
                shouldClose = dragOffset < 0 && (velocity < -velocityThreshold || translation < -threshold)
            } else {
                shouldExpand = (velocity < -velocityThreshold && dragOffset < 0) || dragOffset < -threshold
                shouldClose = dragOffset > 0 && (velocity > velocityThreshold || translation > threshold)
            }
            shouldCollapse = false
        }
        
        if shouldClose {
            closeDrawer(geometry: geometry)
        } else if shouldExpand {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                dragOffset = expandedOffset
            }
        } else if shouldCollapse {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                dragOffset = 0
            }
        } else {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                if wasExpanded {
                    dragOffset = expandedOffset
                } else {
                    dragOffset = 0
                }
            }
        }
    }
    
    private func currentOffset(geometry: GeometryProxy) -> CGFloat {
        return dragOffset
    }
    
    private func closeDrawer(geometry: GeometryProxy) {
        let screenWidth = geometry.size.width
        let screenHeight = geometry.size.height
        
        let finalOffset: CGFloat
        switch alignment {
        case .top:
            finalOffset = -screenHeight
        case .bottom:
            finalOffset = screenHeight
        case .left:
            finalOffset = -screenWidth
        case .right:
            finalOffset = screenWidth
        }
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            dragOffset = finalOffset
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isPresented = false
            onClose?()
        }
    }
    
    private func initializeDrawerPosition() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        switch alignment {
        case .top:
            dragOffset = -screenHeight
        case .bottom:
            dragOffset = screenHeight
        case .left:
            dragOffset = -screenWidth
        case .right:
            dragOffset = screenWidth
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                dragOffset = 0
            }
        }
    }
}

