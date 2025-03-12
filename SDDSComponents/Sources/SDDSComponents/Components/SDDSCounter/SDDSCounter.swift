import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSCounter: View {
    public let text: String
    private let _appearance: CounterAppearance?
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.counterAppearance) private var environmentAppearance
    
    var isAnimating: Bool
    var isHighlighted: Bool
    var isHovered: Bool
    
    public init(
        text: String,
        appearance: CounterAppearance? = nil,
        isAnimating: Bool,
        isHighlighted: Bool,
        isHovered: Bool
    ) {
        self.text = text
        self._appearance = appearance
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
        .frame(height: appearance.size.height)
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
    }
    
    public var counterAutomationSize: some View {
        textView(
            text: text,
            typographyToken: textTypography,
            counterColor: appearance.textColor
        )
        .fixedSize()
    }
    
    @ViewBuilder
    public var counterMinimumSize: some View {
        Circle()
            .fill(currentColor(for: appearance.backgroundColor))
        textView(
            text: text,
            typographyToken: textTypography,
            counterColor: appearance.textColor
        )
    }
    
    public func textView(text: String, typographyToken: TypographyToken, counterColor: ButtonColor) -> some View {
        Text(text)
            .typography(typographyToken)
            .foregroundColor(currentColor(for: counterColor))
    }
}

private extension SDDSCounter {
    var cornerRadius: CGFloat {
        return appearance.size.height / 2
    }
    
    var textTypography: TypographyToken {
        if let typography = appearance.textTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError(undefinedTypographyErrorText(sizeDescription: appearance.size.debugDescription))
        }
    }
    
    func currentColor(for counterColor: ButtonColor) -> Color {
        if isHighlighted {
            return counterColor.highlightedColor.color(for: colorScheme)
        } else if isHovered {
            return counterColor.hoveredColor.color(for: colorScheme)
        } else {
            return counterColor.defaultColor.color(for: colorScheme)
        }
    }
    
    var isAuto: Bool {
        text.count > 1
    }
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public var appearance: CounterAppearance {
        _appearance ?? environmentAppearance
    }
}
