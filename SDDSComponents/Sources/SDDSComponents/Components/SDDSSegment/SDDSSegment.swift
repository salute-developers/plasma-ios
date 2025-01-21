import SwiftUI
@_exported import SDDSThemeCore

public struct SegmentDefaultSize: SegmentSizeConfiguration {
    public let maxItems: Int = 0
    
    public init() {}
}

public protocol SegmentSizeConfiguration: SizeConfiguration {
    var maxItems: Int { get }
}

public enum SegmentLayoutMode: String, CaseIterable {
    case horizontal
    case vertical
}

public struct SDDSSegment: View {
    public let data: [SDDSSegmentItemData]
    public let size: SegmentSizeConfiguration
    public let layoutMode: SegmentLayoutMode
    public let shapeStyle: ComponentShapeStyle
    
    public init(
        data: [SDDSSegmentItemData],
        size: SegmentSizeConfiguration,
        layoutMode: SegmentLayoutMode,
        shapeStyle: ComponentShapeStyle
    ) {
        self.data = data
        self.size = size
        self.layoutMode = layoutMode
        self.shapeStyle = shapeStyle
    }
    
    public var body: some View {
        switch layoutMode {
        case .horizontal:
            horizontalOrientation
        case .vertical:
            verticalOrientation
        }
    }
    
    public var horizontalOrientation: some View {
        HStack {
            ForEach(data, id: \.self) { segment in
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
    }
    
    public var verticalOrientation: some View {
        VStack {}
    }
}
