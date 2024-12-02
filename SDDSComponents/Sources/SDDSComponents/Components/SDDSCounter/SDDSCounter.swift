import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSCounter: View {
    public let data: CounterData
    public let appearance: CounterAppearance
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isAnimating: Bool = false
    @State private var isHighlighted: Bool = false
    @State private var isHovered: Bool = false
    
    public init(
        data: CounterData,
        appearance: CounterAppearance
    ) {
        self.data = data
        self.appearance = appearance
    }
    
    public var body: some View {
        ZStack {
            if data.value.count > 1 {
                counterAutomationSize
            } else {
                counterMinimumSize
            }
        }
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
        .frame(maxWidth: data.value.count > 1 ? .infinity : appearance.size.width, minHeight: appearance.size.height)
    }
    
    public var counterAutomationSize: some View {
        Text("\(data.value)")
            .typography(dataTypography)
            .foregroundColor(currentColor(for: appearance.dataColor))
            .padding(appearance.size.paddings)
    }
    
    @ViewBuilder
    public var counterMinimumSize: some View {
        Circle()
            .fill(currentColor(for: appearance.backgroundColor))
        Text("\(data.value)")
            .typography(dataTypography)
            .foregroundColor(currentColor(for: appearance.dataColor))
            .padding(appearance.size.paddings)
    }
}

private extension SDDSCounter {
    var cornerRadius: CGFloat {
        return appearance.size.height / 2
    }
    
    var dataTypography: TypographyToken {
        if let typography = appearance.dataTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(appearance.size.debugDescription). Using a default value.")
        }
    }
    
    func currentColor(for counterColor: CounterColor) -> Color {
        if isHighlighted {
            return counterColor.highlightedColor.color(for: colorScheme)
        } else if isHovered {
            return counterColor.hoveredColor.color(for: colorScheme)
        } else {
            return counterColor.defaultColor.color(for: colorScheme)
        }
    }
}
