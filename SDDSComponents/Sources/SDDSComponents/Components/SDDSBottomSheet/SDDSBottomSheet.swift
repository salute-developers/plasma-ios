import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSBottomSheet<Header: View, Content: View, Footer: View>: View {
    @Environment(\.bottomSheetAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: BottomSheetAppearance?
    
    public let header: Header
    public let content: Content
    public let footer: Footer
    
    @Binding var bottomSheetScrollProgress: CGFloat
    
    public init(
        appearance: BottomSheetAppearance? = nil,
        @ViewBuilder header: () -> Header = { EmptyView() },
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer = { EmptyView() }
    ) {
        self._appearance = appearance
        self.header = header()
        self.content = content()
        self.footer = footer()
        _bottomSheetScrollProgress = .constant(0)
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .bottom) {
                if let cornerRadiusDrawer = appearance.size.pathDrawer as? CornerRadiusDrawer {
                    Rectangle()
                        .fill(appearance.backgroundColor.color(for: colorScheme))
                        .frame(height: cornerRadiusDrawer.cornerRadius)
                        .frame(maxWidth: .infinity)
                }
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: 2 * appearance.size.handleHeight + appearance.size.handleOffset)
                    VStack(spacing: 0) {
                        header
                        content
                        footer
                    }
                    .applyIf(appearance.size.paddingTop > 0) {
                        $0.padding(.top, appearance.size.paddingTop)
                    }
                    .applyIf(appearance.size.paddingBottom > 0) {
                        $0.padding(.bottom, appearance.size.paddingBottom)
                    }
                    .applyIf(appearance.size.paddingStart > 0) {
                        $0.padding(.leading, appearance.size.paddingStart)
                    }
                    .applyIf(appearance.size.paddingEnd > 0) {
                        $0.padding(.trailing, appearance.size.paddingEnd)
                    }
                    .frame(maxWidth: .infinity)
                    .background(appearance.backgroundColor.color(for: colorScheme))
                    .shape(pathDrawer: appearance.size.pathDrawer)
                    .debug(color: .green, condition: true)
                }
                .debug(color: .red, condition: true)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            if appearance.handlePlacement != .none {
                handleView
                    .offset(x: 0, y: handleOffset)
            }
        }
    }
    
    private var handleOffset: CGFloat {
        switch handlePlacement {
        case .auto:
            return -appearance.size.handleOffset - appearance.size.handleHeight + (appearance.size.handleOffset * 2 + appearance.size.handleHeight) * bottomSheetScrollProgress
        case .outer:
            return appearance.size.handleHeight
        case .inner:
            return appearance.size.handleOffset
        case .none:
            return 0
        }
    }
    
    var appearance: BottomSheetAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var shouldShowHandle: Bool {
        appearance.handlePlacement != .none
    }
    
    private var handlePlacement: BottomSheetHandlePlacement {
        switch appearance.handlePlacement {
        case .auto:
            return .outer
        case .inner, .outer, .none:
            return appearance.handlePlacement
        }
    }
    
    private var showHandleOutside: Bool {
        handlePlacement == .outer || handlePlacement == .auto
    }
    
    private var contentOffset: CGFloat {
        shouldShowHandle && handlePlacement == .outer ? appearance.size.handleOffset + appearance.size.handleHeight : 0
    }
    
    private var handleView: some View {
        Rectangle()
            .fill(appearance.handleColor.color(for: colorScheme))
            .frame(width: appearance.size.handleWidth, height: appearance.size.handleHeight)
            .shape(pathDrawer: appearance.size.handlePathDrawer)
    }
}

#Preview {
    SDDSBottomSheet(
        appearance: .init(
            size: DefaultBottomSheetSize(),
            backgroundColor: Color.white.token,
            handleColor: Color.accentColor.token,
            handlePlacement: .auto
        ),
        header: {
            Text("Header")
        },
        content: {
            Text("Content")
        },
        footer: {
            Text("Footer")
        }
    )
}
