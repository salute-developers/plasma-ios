import SwiftUI
import SDDSThemeCore

public enum PopoverTailPosition {
    case top, bottom, left, right
}

struct PopoverTailRect: View {
    let width: CGFloat
    let height: CGFloat
    let color: Color
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: height)
    }
}

public struct SDDSPopover<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    
    private let appearance: PopoverAppearance
    private let content: Content
    private let tailPosition: PopoverTailPosition
    
    public init(
        appearance: PopoverAppearance,
        tailPosition: PopoverTailPosition = .bottom,
        @ViewBuilder content: () -> Content
    ) {
        self.appearance = appearance
        self.tailPosition = tailPosition
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            switch tailPosition {
            case .top:
                VStack(spacing: 0) {
                    PopoverTailRect(width: appearance.size.tailWidth, height: appearance.size.tailHeight, color: appearance.backgroundColor.color(for: colorScheme))
                    popoverContent
                }
            case .bottom:
                VStack(spacing: 0) {
                    popoverContent
                    PopoverTailRect(width: appearance.size.tailWidth, height: appearance.size.tailHeight, color: appearance.backgroundColor.color(for: colorScheme))
                }
            case .left:
                HStack(spacing: 0) {
                    PopoverTailRect(width: appearance.size.tailHeight, height: appearance.size.tailWidth, color: appearance.backgroundColor.color(for: colorScheme))
                    popoverContent
                }
            case .right:
                HStack(spacing: 0) {
                    popoverContent
                    PopoverTailRect(width: appearance.size.tailHeight, height: appearance.size.tailWidth, color: appearance.backgroundColor.color(for: colorScheme))
                }
            }
        }
    }
    
    private var popoverContent: some View {
        content
            .frame(width: appearance.size.width)
            .background(appearance.backgroundColor.color(for: colorScheme))
            .shadow(appearance.shadow)
            .shape(pathDrawer: appearance.size.pathDrawer)
    }
}

#Preview {
    SDDSPopover(appearance: .init(backgroundColor: Color.white.token)) {
        Text("Popover Content")
            .padding()
    }
}
