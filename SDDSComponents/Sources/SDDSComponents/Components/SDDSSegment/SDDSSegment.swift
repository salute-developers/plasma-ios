import SwiftUI
@_exported import SDDSThemeCore

public struct SegmentDefaultSize: SegmentSizeConfiguration {
    public let height: CGFloat = 0
    public func cornerRadius(style: ComponentShapeStyle) -> CGFloat { 0 }
    
    public init() {}
}

public protocol SegmentSizeConfiguration: SizeConfiguration {
    var height: CGFloat { get }
    func cornerRadius(style: ComponentShapeStyle) -> CGFloat
}

public enum ItemSize {
    case fixed
    case stretched
}

public enum SegmentLayoutMode: String, CaseIterable {
    case horizontal
    case vertical
}

public struct SDDSSegment: View {
    public let data: [SDDSSegmentItemData]
    public let appearance: SegmentAppearance
    //    public let size: SegmentSizeConfiguration
    //    public let shapeStyle: ComponentShapeStyle
    //    public let layoutMode: SegmentLayoutMode
    //    public let sizeItem: ItemSize
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    @State var isAnimating: Bool = false
    @State var isHighlighted: Bool = false
    @State var isHovered: Bool = false
    
    public init(
        data: [SDDSSegmentItemData],
        //        size: SegmentSizeConfiguration,
        //        shapeStyle: ComponentShapeStyle,
        //        layoutMode: SegmentLayoutMode,
        //        sizeItem: ItemSize
        appearance: SegmentAppearance
    ) {
        self.data = data
        //        self.size = size
        //        self.shapeStyle = shapeStyle
        //        self.layoutMode = layoutMode
        //        self.sizeItem = sizeItem
        self.appearance = appearance
    }
    
    public var body: some View {
        switch appearance.layoutMode {
        case .horizontal:
            horizontalOrientation
        case .vertical:
            verticalOrientation
        }
    }
    
    public var horizontalOrientation: some View {
        HStack(spacing: 0) {
            ForEach(data, id: \.self) { segment in
                SDDSSegmentItem(
                    title: segment.title,
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    appearance: segment.appearance,
                    counterAppearance: segment.counterAppearance,
                    counterText: segment.counterText,
                    action: {
                        
                    }
                )
            }
        }
        .background(currentColor(for: appearance.backgroundColor))
        .cornerRadius(cornerRadius)
    }
    
    public var verticalOrientation: some View {
        VStack(spacing: 0) {
            ForEach(data, id: \.id) { segment in
                SDDSSegmentItem(
                    title: segment.title,
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    appearance: segment.appearance,
                    counterAppearance: segment.counterAppearance,
                    counterText: segment.counterText,
                    action: {}
                )
            }
        }
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
        switch appearance.itemShapeStyle {
        case .cornered:
            return appearance.size.cornerRadius(style: .cornered)
        case .pilled:
            return appearance.size.cornerRadius(style: .pilled)
        }
    }
}

