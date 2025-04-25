import SwiftUI

struct AvatarPlacementContainer<Content: View>: View {
    let extraContent: Content
    let extraPlacement: AvatarExtraPlacement
    let extraOffset: CGPoint
    
    public init(
        extraPlacement: AvatarExtraPlacement = .topRight,
        extraOffset: CGPoint = .zero,
        @ViewBuilder extraContent: () -> Content =  { EmptyView() }
        
    ) {
        self.extraContent = extraContent()
        self.extraOffset = extraOffset
        self.extraPlacement = extraPlacement
    }
    
    public var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        switch extraPlacement {
        case .topRight:
            HStack {
                Spacer()
                    .frame(minWidth: 0)
                extraContent
                    .offset(x: extraOffset.x, y: -extraOffset.y)
            }
        case .topLeft:
            HStack {
                extraContent
                    .offset(x: -extraOffset.x, y: -extraOffset.y)
                Spacer()
                    .frame(minWidth: 0)
            }
        case .bottomRight:
            VStack {
                Spacer()
                    .frame(minHeight: 0)
                HStack {
                    Spacer()
                        .frame(minWidth: 0)
                    extraContent
                        .offset(x: extraOffset.x, y: extraOffset.y)
                }
            }
        case .bottomLeft:
            VStack {
                Spacer()
                    .frame(minHeight: 0)
                HStack {
                    extraContent
                        .offset(x: -extraOffset.x, y: extraOffset.y)
                    Spacer()
                        .frame(minWidth: 0)
                }
            }
        }
    }
}
