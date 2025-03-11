import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSCard<Content: View>: View {
    @Environment(\.cardAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: CardAppearance?
    private let backgroundColor: Color?
    
    public let content: Content
    
    public init(appearance: CardAppearance? = nil, backgroundColor: Color? = nil, @ViewBuilder content: () -> Content) {
        self._appearance = appearance
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    public var body: some View {
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
            .background(backgroundColor ?? appearance.backgroundColor.color(for: colorScheme))
            .shape(pathDrawer: appearance.size.pathDrawer)
    }
    
    private var appearance: CardAppearance {
        _appearance ?? environmentAppearance
    }
}
