import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSIndicator: View {
    @Environment(\.indicatorAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: IndicatorAppearance?
    
    public init(appearance: IndicatorAppearance? = nil) {
        self._appearance = appearance
    }
    
    public var body: some View {
        appearance.size
            .pathDrawer
            .path(in: CGRect(x: 0, y: 0, width: width, height: height))
            .fill(appearance.backgroundColor.color(for: colorScheme))
            .frame(width: width, height: height)
    }
    
    private var width: CGFloat {
        appearance.size.width
    }
    
    private var height: CGFloat {
        appearance.size.height
    }
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public var appearance: IndicatorAppearance {
        _appearance ?? environmentAppearance
    }
}
