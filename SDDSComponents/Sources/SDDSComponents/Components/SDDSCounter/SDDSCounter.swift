import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSCounter: View {
    public let data: CounterData
    public let appearance: CounterAppearance
    
    @Environment(\.colorScheme) var colorScheme
    
    var isAnimating: Bool
    var isHighlighted: Bool
    var isHovered: Bool
    
    public init(
    data: CounterData,
    appearance: CounterAppearance,
    isAnimating: Bool,
    isHighlighted: Bool,
    isHovered: Bool
    ) {
        self.data = data
        self.appearance = appearance
        self.isAnimating = isAnimating
        self.isHighlighted = isHighlighted
        self.isHovered = isHovered
    }
    
    public var body: some View {
        ZStack {
            if isAuto {
                counterAutomationSize
                    .padding(appearance.size.paddings)
            } else {
                counterMinimumSize
            }
        }
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
        .frame(height: appearance.size.height)
    }
    
    public var counterAutomationSize: some View {
        Text(text)
            .typography(dataTypography)
            .foregroundColor(currentColor(for: appearance.dataColor))
            .fixedSize()
    }
    
    @ViewBuilder
    public var counterMinimumSize: some View {
        Circle()
            .fill(currentColor(for: appearance.backgroundColor))
        Text(text)
            .typography(dataTypography)
            .foregroundColor(currentColor(for: appearance.dataColor))
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
            fatalError(undefinedTypographyErrorText(sizeDescription: appearance.size.debugDescription))
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
    
    var isAuto: Bool {
        data.value.count > 1
    }
    
    var text: String {
        data.value
    }
}
