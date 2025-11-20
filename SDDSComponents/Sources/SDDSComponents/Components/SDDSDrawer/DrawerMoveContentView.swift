import SwiftUI
@_exported import SDDSThemeCore

struct DrawerMoveContentView<MainContent: View, Header: View, Content: View, Footer: View>: View {
    let mainContent: MainContent
    let alignment: DrawerAlignment
    @Binding var isPresented: Bool
    let appearance: DrawerAppearance
    let overlayAppearance: OverlayAppearance?
    let closePlacement: DrawerClosePlacement
    let hasHeader: Bool
    let hasFooter: Bool
    let onClose: (() -> Void)?
    let header: () -> Header
    let content: () -> Content
    let footer: () -> Footer
    let explicitDrawerWidth: CGFloat?
    let explicitDrawerHeight: CGFloat?
    
    @State private var dragOffset: CGFloat = 0
    @State private var contentOffset: CGFloat
    @State private var isDragging: Bool = false
    @State private var hasAppeared: Bool = false
    @State private var dragStarted: Bool = false
    
    init(
        mainContent: MainContent,
        alignment: DrawerAlignment,
        isPresented: Binding<Bool>,
        appearance: DrawerAppearance,
        overlayAppearance: OverlayAppearance?,
        closePlacement: DrawerClosePlacement,
        hasHeader: Bool,
        hasFooter: Bool,
        onClose: (() -> Void)?,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder footer: @escaping () -> Footer,
        explicitDrawerWidth: CGFloat?,
        explicitDrawerHeight: CGFloat?
    ) {
        self.mainContent = mainContent
        self.alignment = alignment
        self._isPresented = isPresented
        self.appearance = appearance
        self.overlayAppearance = overlayAppearance
        self.closePlacement = closePlacement
        self.hasHeader = hasHeader
        self.hasFooter = hasFooter
        self.onClose = onClose
        self.header = header
        self.content = content
        self.footer = footer
        self.explicitDrawerWidth = explicitDrawerWidth
        self.explicitDrawerHeight = explicitDrawerHeight
        
        let initialOffset: CGFloat
        switch alignment {
        case .left:
            initialOffset = -(explicitDrawerWidth ?? 0)
        case .right:
            initialOffset = 0
        case .top:
            initialOffset = -(explicitDrawerHeight ?? 0)
        case .bottom:
            initialOffset = 0
        }
        self._contentOffset = State(initialValue: initialOffset)
    }
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if alignment == .left || alignment == .right {
                    horizontalLayout(geometry: geometry)
                } else {
                    verticalLayout(geometry: geometry)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .simultaneousGesture(
            DragGesture(minimumDistance: 10)
                .onChanged { value in
                    handleDragChanged(value: value)
                }
                .onEnded { value in
                    handleDragEnded(value: value)
                }
        )
        .onChange(of: isPresented) { newValue in
            if !isDragging {
                toggleDrawer()
            }
        }
    }
    
    @ViewBuilder
    private func horizontalLayout(geometry: GeometryProxy) -> some View {
        HStack(spacing: 0) {
            if alignment == .left {
                drawerView
                mainContentWithOverlay
                    .frame(width: geometry.size.width)
            } else {
                mainContentWithOverlay
                    .frame(width: geometry.size.width)
                drawerView
            }
        }
        .offset(x: contentOffset)
    }
    
    @ViewBuilder
    private func verticalLayout(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            if alignment == .top {
                drawerView
                mainContentWithOverlay
                    .frame(height: geometry.size.height)
            } else {
                mainContentWithOverlay
                    .frame(height: geometry.size.height)
                drawerView
            }
        }
        .offset(y: contentOffset)
    }
    
    @ViewBuilder
    private var mainContentWithOverlay: some View {
        mainContent
            .overlay(
                Group {
                    if isPresented {
                        if let overlayAppearance = overlayAppearance {
                            SDDSOverlay(
                                isPresented: .constant(true),
                                appearance: overlayAppearance
                            ) {
                                Color.clear
                                    .contentShape(Rectangle())
                            }
                            .onTapGesture {
                                closeDrawer()
                            }
                            .allowsHitTesting(true)
                        }
                    }
                }
                .allowsHitTesting(isPresented && overlayAppearance != nil)
        )
    }
    
    private func toggleDrawer() {
        withAnimation(.easeIn(duration: 0.3)) {
            switch alignment {
            case .left:
                contentOffset = isPresented ? 0 : -(explicitDrawerWidth ?? 0)
            case .right:
                contentOffset = isPresented ? -(explicitDrawerWidth ?? 0) : 0
            case .top:
                contentOffset = isPresented ? 0 : -(explicitDrawerHeight ?? 0)
            case .bottom:
                contentOffset = isPresented ? -(explicitDrawerHeight ?? 0) : 0
            }
        }
    }
    
    private func handleDragChanged(value: DragGesture.Value) {
        let horizontalMovement = abs(value.translation.width)
        let verticalMovement = abs(value.translation.height)
        
        let isHorizontalAlignment = alignment == .left || alignment == .right
        let isVerticalAlignment = alignment == .top || alignment == .bottom
        
        if !dragStarted {
            if isHorizontalAlignment && horizontalMovement > verticalMovement && horizontalMovement > 10 {
                dragStarted = true
                isDragging = true
            } else if isVerticalAlignment && verticalMovement > horizontalMovement && verticalMovement > 10 {
                dragStarted = true
                isDragging = true
            } else {
                return
            }
        } else {
            if isHorizontalAlignment && verticalMovement > horizontalMovement {
                return
            } else if isVerticalAlignment && horizontalMovement > verticalMovement {
                return
            }
        }
        
        if !isDragging {
            isDragging = true
        }
        
        switch alignment {
        case .left:
            let translation = value.translation.width
            if isPresented {
                if translation < 0 {
                    let newOffset = translation
                    contentOffset = max(-(explicitDrawerWidth ?? 0), newOffset)
                }
            } else {
                if translation > 0 {
                    let newOffset = -(explicitDrawerWidth ?? 0) + translation
                    contentOffset = min(0, newOffset)
                }
            }
        case .right:
            let translation = value.translation.width
            if isPresented {
                if translation > 0 {
                    let newOffset = -(explicitDrawerWidth ?? 0) + translation
                    contentOffset = min(0, newOffset)
                }
            } else {
                if translation < 0 {
                    let newOffset = translation
                    contentOffset = max(-(explicitDrawerWidth ?? 0), newOffset)
                }
            }
        case .top:
            let translation = value.translation.height
            if isPresented {
                if translation < 0 {
                    let newOffset = translation
                    contentOffset = max(-(explicitDrawerHeight ?? 0), newOffset)
                }
            } else {
                if translation > 0 {
                    let newOffset = -(explicitDrawerHeight ?? 0) + translation
                    contentOffset = min(0, newOffset)
                }
            }
        case .bottom:
            let translation = value.translation.height
            if isPresented {
                if translation > 0 {
                    let newOffset = -(explicitDrawerHeight ?? 0) + translation
                    contentOffset = min(0, newOffset)
                }
            } else {
                if translation < 0 {
                    let newOffset = translation
                    contentOffset = max(-(explicitDrawerHeight ?? 0), newOffset)
                }
            }
        }
    }
    
    private func handleDragEnded(value: DragGesture.Value) {
        isDragging = false
        dragStarted = false
        
        let threshold: CGFloat = 80
        let velocityThreshold: CGFloat = 300
        
        let shouldToggle: Bool
        
        switch alignment {
        case .left:
            let translation = value.translation.width
            let velocity = value.velocity.width
            if isPresented {
                shouldToggle = (velocity < -velocityThreshold && translation < 0) || translation < -threshold
            } else {
                shouldToggle = (velocity > velocityThreshold && translation > 0) || translation > threshold
            }
        case .right:
            let translation = value.translation.width
            let velocity = value.velocity.width
            if isPresented {
                shouldToggle = (velocity > velocityThreshold && translation > 0) || translation > threshold
            } else {
                shouldToggle = (velocity < -velocityThreshold && translation < 0) || translation < -threshold
            }
        case .top:
            let translation = value.translation.height
            let velocity = value.velocity.height
            if isPresented {
                shouldToggle = (velocity < -velocityThreshold && translation < 0) || translation < -threshold
            } else {
                shouldToggle = (velocity > velocityThreshold && translation > 0) || translation > threshold
            }
        case .bottom:
            let translation = value.translation.height
            let velocity = value.velocity.height
            if isPresented {
                shouldToggle = (velocity > velocityThreshold && translation > 0) || translation > threshold
            } else {
                shouldToggle = (velocity < -velocityThreshold && translation < 0) || translation < -threshold
            }
        }
        
        if shouldToggle {
            isPresented.toggle()
        } else {
            toggleDrawer()
        }
    }
    
    @ViewBuilder
    private var drawerView: some View {
        SDDSDrawer(
            appearance: appearance,
            onClose: {
                closeDrawer()
            },
            closePlacement: closePlacement,
            hasHeader: hasHeader,
            hasFooter: hasFooter,
            header: header,
            content: content,
            footer: footer
        )
        .frame(
            width: (alignment == .left || alignment == .right) ? explicitDrawerWidth : nil,
            height: (alignment == .top || alignment == .bottom) ? explicitDrawerHeight : nil
        )
    }
    
    private func closeDrawer() {
        withAnimation(.easeIn(duration: 0.3)) {
            isPresented.toggle()
        }
    }
}

