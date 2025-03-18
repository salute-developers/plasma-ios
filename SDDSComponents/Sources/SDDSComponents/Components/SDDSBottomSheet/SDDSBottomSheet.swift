import SwiftUI
import Foundation
import SDDSThemeCore

private struct ScrollProgressKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

extension EnvironmentValues {
    var scrollProgress: CGFloat {
        get { self[ScrollProgressKey.self] }
        set { self[ScrollProgressKey.self] = newValue }
    }
}

public struct SDDSBottomSheet<Header: View, Content: View, Footer: View>: View {
    @Environment(\.bottomSheetAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.scrollProgress) private var scrollProgress
    private let _appearance: BottomSheetAppearance?
    
    public let header: Header
    public let content: Content
    public let footer: Footer
    
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
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            if shouldShowHandle {
                handleView
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(y: handleOffset)
            }
            
            VStack(spacing: 0) {
                header
                content
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
                footer
            }
            .offset(y: contentOffset)
        }
        .background(appearance.backgroundColor.color(for: colorScheme))
        .shape(pathDrawer: appearance.size.pathDrawer)
    }
    
    private var appearance: BottomSheetAppearance {
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
    
    private var contentOffset: CGFloat {
        shouldShowHandle && handlePlacement == .outer ? appearance.size.handleOffset + appearance.size.handleHeight : 0
    }
    
    private var handleOffset: CGFloat {
        let baseOffset = handlePlacement == .outer ? -appearance.size.handleOffset : appearance.size.handleOffset
        let scrollOffset = scrollProgress * appearance.size.handleHeight
        return baseOffset + scrollOffset
    }
    
    private var handleView: some View {
        Rectangle()
            .fill(appearance.handleColor.color(for: colorScheme))
            .frame(width: appearance.size.handleWidth, height: appearance.size.handleHeight)
            .shape(pathDrawer: appearance.size.handlePathDrawer)
    }
}
