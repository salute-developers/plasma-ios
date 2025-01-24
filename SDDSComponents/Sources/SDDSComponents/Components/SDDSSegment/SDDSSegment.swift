import SwiftUI
@_exported import SDDSThemeCore

public struct SegmentDefaultSize: SegmentSizeConfiguration {
    public let height: CGFloat = 0
    public func cornerRadius(style: ComponentShapeStyle) -> CGFloat { 0 }
    public let paddings: CGFloat = 0
    
    public init() {}
}

public protocol SegmentSizeConfiguration: SizeConfiguration {
    var height: CGFloat { get }
    func cornerRadius(style: ComponentShapeStyle) -> CGFloat
    var paddings: CGFloat { get }
}

public enum SegmentLayoutOrientation: String, CaseIterable {
    case horizontal
    case vertical
}

public struct SDDSSegment: View {
    public let data: [SDDSSegmentItemData]
    public let appearance: SegmentAppearance
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    @State var isAnimating: Bool = false
    @State var isHighlighted: Bool = false
    @State var isHovered: Bool = false
    
    public init(
        data: [SDDSSegmentItemData],
        appearance: SegmentAppearance
    ) {
        self.data = data
        self.appearance = appearance
    }
    
    public var body: some View {
        switch appearance.layoutOrientation {
        case .horizontal:
            horizontalOrientation
        case .vertical:
            verticalOrientation
        }
    }
    
    public var horizontalOrientation: some View {
        HStack(spacing: 0) {
            ForEach(data, id: \.id) { segmentData in
                setSegmentItem(segmentData: segmentData)
            }
        }
        .padding(appearance.size.paddings)
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
    }
    
    public var verticalOrientation: some View {
        VStack(spacing: 0) {
            ForEach(data, id: \.id) { segmentData in
                setSegmentItem(segmentData: segmentData)
            }
        }
        .padding(appearance.size.paddings)
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
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
    
    var cornerRadius: CGFloat {
        appearance.size.cornerRadius(style: appearance.segmentItemAppearance.shapeStyle)
    }
    
    func setSegmentItem(segmentData: SDDSSegmentItemData) -> SDDSSegmentItem {
        //Подумать над оптимизацией и передачей состояния
        var appearance = segmentData.appearance.shapeStyle(appearance.segmentItemAppearance.shapeStyle)
        
        return SDDSSegmentItem(
            title: segmentData.title,
            subtitle: "",
            iconAttributes: nil,
            isDisabled: false,
            appearance: appearance,
            counterAppearance: segmentData.counterAppearance,
            counterText: segmentData.counterText,
            isSelected: segmentData.isSelected,
            action: {}
        )
    }
}

