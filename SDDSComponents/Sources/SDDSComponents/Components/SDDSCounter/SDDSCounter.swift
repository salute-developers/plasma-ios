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
            if isAuto {
                counterAutomationSize
            } else {
                counterMinimumSize
            }
        }
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
        .frame(maxWidth: dynamicWidth, minHeight: appearance.size.height)
    }
    
    public var counterAutomationSize: some View {
        Text(text)
            .typography(dataTypography)
            .foregroundColor(currentColor(for: appearance.dataColor))
            .padding(appearance.size.paddings)
    }
    
    @ViewBuilder
    public var counterMinimumSize: some View {
        Circle()
            .fill(currentColor(for: appearance.backgroundColor))
        Text(text)
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
    
    var dynamicWidth: CGFloat {
        data.value.count > 1 ? .infinity : appearance.size.width
    }
    
    var isAuto: Bool {
        data.value.count > 1
    }
    
    var text: String {
        data.value
    }
}
