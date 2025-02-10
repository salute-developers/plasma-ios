import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSSegment: View {
    public let items: [SDDSSegmentItemData]
    public let appearance: SegmentAppearance
    public let layoutMode: SegmentLayoutMode
    public let layoutOrientation: SegmentLayoutOrientation
    public let isDisabled: Bool
    
    private var maxWidth: CGFloat = 0
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    @Binding public var selectedItemId: UUID?

    @State var isAnimating: Bool = false
    @State var isHighlighted: Bool = false
    @State var isHovered: Bool = false
    
    public init(
        items: [SDDSSegmentItemData],
        appearance: SegmentAppearance,
        layoutMode: SegmentLayoutMode = .flexible,
        layoutOrientation: SegmentLayoutOrientation,
        selectedItemId: Binding<UUID?>,
        isDisabled: Bool = false
    ) {
        self.items = items
        self.appearance = appearance
        self.layoutMode = layoutMode
        self.layoutOrientation = layoutOrientation
        self._selectedItemId = selectedItemId
        self.isDisabled = isDisabled
        
        self.maxWidth = items.map { segmentData in
            let calculator = SegmentWidthCalculatorImpl(
                counterWidthCalculator: segmentData.counterWidthCalculator
            )
            return calculator.width(with: segmentData)
        }.max() ?? 0
    }
    
    public var body: some View {
        Group {
            switch layoutOrientation {
            case .horizontal:
                horizontalOrientation
            case .vertical:
                verticalOrientation
            }
        }
        .padding(appearance.size.paddings)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .opacity(isDisabled ? appearance.disabledAlpha : 1)
    }
    
    public var horizontalOrientation: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.self) { segmentData in
                SDDSSegmentItem(
                    title: segmentData.title,
                    subtitle: segmentData.subtitle,
                    iconAttributes: segmentData.iconAttributes,
                    isDisabled: segmentData.isDisabled,
                    isSelected: selectedItemId == segmentData.id,
                    strech: appearance.stretch,
                    appearance: segmentData.appearance,
                    counterViewProvider: segmentData.counterViewProvider,
                    counterAppearance: segmentData.counterAppearance,
                    action: {
                        selectedItemId = segmentData.id
                    }
                )
            }
        }
        .applyIf(layoutMode == .fixed) {
            $0.frame(height: appearance.size.horizontalHeight)
        }
    }
    
    public var verticalOrientation: some View {
        VStack(spacing: 0) {
            ForEach(items, id: \.self) { segmentData in
                SDDSSegmentItem(
                    title: segmentData.title,
                    subtitle: segmentData.subtitle,
                    iconAttributes: segmentData.iconAttributes,
                    isDisabled: segmentData.isDisabled,
                    isSelected: selectedItemId == segmentData.id,
                    strech: true,
                    appearance: segmentData.appearance,
                    counterViewProvider: segmentData.counterViewProvider,
                    counterAppearance: segmentData.counterAppearance
                )
                .highPriorityGesture(
                    TapGesture()
                        .onEnded { _ in
                            self.selectedItemId = segmentData.id
                        }
                )
            }
        }
        .frame(width: verticalWidth)
    }

    private var verticalWidth: CGFloat {
        switch layoutMode {
        case .fixed:
            appearance.size.verticalWidth
        case .flexible:
            maxWidth
        }
    }
    
    private func currentColor(for counterColor: ButtonColor) -> Color {
        if isHighlighted {
            return counterColor.highlightedColor.color(for: colorScheme)
        } else if isHovered {
            return counterColor.hoveredColor.color(for: colorScheme)
        } else {
            return counterColor.defaultColor.color(for: colorScheme)
        }
    }
    
    private var cornerRadius: CGFloat {
        appearance.size.cornerRadius(style: appearance.segmentItemAppearance.shapeStyle)
    }
    
    private var backgroundColor: Color {
        if let backgroundColor = appearance.backgroundColor, appearance.hasBackground {
            return currentColor(for: backgroundColor)
        }
        return .clear
    }
}
