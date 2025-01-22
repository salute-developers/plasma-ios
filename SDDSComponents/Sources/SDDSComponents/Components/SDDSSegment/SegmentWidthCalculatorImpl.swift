import Foundation

public struct SegmentWidthCalculatorImpl {
    public let counterWidthCalculator: CounterWidthCalculator?
    
    public init(counterWidthCalculator: CounterWidthCalculator?) {
        self.counterWidthCalculator = counterWidthCalculator
    }
        
    private func segmentItemWidthCalculator(data: SDDSSegmentItemData) -> CGFloat {
        var totalWidth: CGFloat = 0
        
        let titleTypography = data.appearance.titleTypography.typography(with: data.appearance.size) ?? .undefined
        let titleWidth = data.title.size(withAttributes: [.font : titleTypography.uiFont]).width
        
        totalWidth += titleWidth
        
        if !data.subtitle.isEmpty {
            let subtitleTypography = data.appearance.subtitleTypography.typography(with: data.appearance.size) ?? .undefined
            let subtitleWidth = data.subtitle.size(withAttributes: [.font : subtitleTypography.uiFont]).width
            totalWidth += subtitleWidth
            totalWidth += data.appearance.size.titleHorizontalGap
        }
        
        if data.iconAttributes != nil {
            totalWidth += data.appearance.size.iconSize.width
            if !data.title.isEmpty {
                totalWidth += data.appearance.size.iconHorizontalGap
            }
        }
        
        switch data.appearance.shapeStyle {
        case .cornered:
            totalWidth += data.appearance.size.paddings(style: .cornered).leading
            totalWidth += data.appearance.size.paddings(style: .cornered).trailing
        case .pilled:
            totalWidth += data.appearance.size.paddings(style: .pilled).leading
            totalWidth += data.appearance.size.paddings(style: .pilled).trailing
        }
        return totalWidth
    }
}

extension SegmentWidthCalculatorImpl: SegmentWidthCalculator {    
    public func width(with data: SDDSSegmentItemData) -> CGFloat {
        let segmentItemWidth = segmentItemWidthCalculator(data: data)
        guard let counterWidth = counterWidthCalculator?.width else { return segmentItemWidth }
        
        return counterWidth + segmentItemWidth + data.appearance.size.iconHorizontalGap
    }
}
