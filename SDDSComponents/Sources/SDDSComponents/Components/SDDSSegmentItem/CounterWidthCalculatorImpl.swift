import Foundation

public protocol CounterWidthCalculator {
    var width: CGFloat { get }
}

public struct CounterWidthCalculatorImpl: CounterWidthCalculator {
    public let counterAppearance: CounterAppearance?
    public let counterText: String?
    
    public init(
        counterAppearance: CounterAppearance? = nil,
        counterText: String? = nil
    ) {
        self.counterAppearance = counterAppearance
        self.counterText = counterText
    }
    
    public var width: CGFloat {
        guard let counterAppearance = counterAppearance,
              let counterText = counterText
        else {
            return 0
        }
        
        var totalWidth: CGFloat = 0
        
        let textTypography = counterAppearance.textTypography.typography(with: counterAppearance.size) ?? .undefined
        let counterTextWidth = counterText.size(withAttributes: [.font: textTypography.uiFont]).width
        
        if counterText.count < 2 {
            totalWidth += counterAppearance.size.width
        } else {
            totalWidth += counterTextWidth
            totalWidth += counterAppearance.size.paddings.leading
            totalWidth += counterAppearance.size.paddings.trailing
        }
        
        return totalWidth
    }
}
