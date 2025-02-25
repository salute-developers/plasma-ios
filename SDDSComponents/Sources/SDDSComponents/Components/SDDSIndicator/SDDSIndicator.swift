import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSIndicator: View {
    @Environment(\.indicatorAppearance) private var indicatorAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: IndicatorAppearance?
    
    public init(appearance: IndicatorAppearance? = nil) {
        self._appearance = appearance
    }
    
    public var body: some View {
        Circle()
            .frame(width: min(width, height), height: min(width, height))
            .foregroundColor(appearance.backgroundColor.color(for: colorScheme))
    }
    
    private var width: CGFloat {
        appearance.size.width
    }
    
    private var height: CGFloat {
        appearance.size.height
    }
    
    private var appearance: IndicatorAppearance {
        _appearance ?? indicatorAppearance
    }
}
