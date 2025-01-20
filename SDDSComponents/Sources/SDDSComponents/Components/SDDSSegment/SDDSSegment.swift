import SwiftUI
@_exported import SDDSThemeCore

public struct SegmentDefaultSize: SegmentSizeConfiguration {
    public let maxElements: Int = 0
    
    public init() {}
}

public protocol SegmentSizeConfiguration: SizeConfiguration {
    var maxElements: Int { get }
}

public enum SegmentSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
}

public enum SegmentLayoutMode: String, CaseIterable {
    case horizontal
    case vertical
}

public struct SDDSSegment: View {
    public let data: [SDDSSegmentItemData]
    public let size: SegmentSizeConfiguration
    public let layoutMode: SegmentLayoutMode
    
    public init(
        data: [SDDSSegmentItemData],
        size: SegmentSizeConfiguration,
        layoutMode: SegmentLayoutMode
    ) {
        self.data = data
        self.size = size
        self.layoutMode = layoutMode
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
