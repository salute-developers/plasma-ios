import Foundation
import SwiftUI

public struct SegmentElementSizeToButtonSizeConfigurationMapper: ButtonSizeConfiguration, SegmentElementSizeConfiguration {
    public var height: CGFloat
    
    public var cornerRadius: CGFloat
    
    public var paddings: EdgeInsets
    
    public var iconSize: CGSize
    
    public var spinnerSize: CGSize = .zero
    
    public var iconHorizontalGap: CGFloat
    
    public var titleHorizontalGap: CGFloat
    
    public var debugDescription: String {
        "SizeExample"
    }
}

public enum SegmentElementContentRight {
    case icon(Image)
    case subtitle(String)
    case counter(SDDSCounter)
}

public enum SegmentElementContent {
    case left(Image)
    case right(SegmentElementContentRight)
    case none
}

public struct SDDSSegmentElement: View {
    public let title: String
    public let contentType: SegmentElementContent
    public let isDisabled: Bool
    public let appearance: SegmentElementAppearance
    public let content: SegmentElementContentRight = .subtitle("")
    public let accessibility: ButtonAccessibility // сделать SegmentElementAccessibility
    public var action: () -> Void
    
    public init(
        title: String,
        contentType: SegmentElementContent,
        isDisabled: Bool = false,
        appearance: SegmentElementAppearance,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.contentType = contentType
        self.isDisabled = isDisabled
        self.appearance = appearance
        self.accessibility = accessibility
        self.action = action
    }

    @ViewBuilder
    public var body: some View {
        switch contentType {
        case .left(let image):
             SDDSButton(
                    title: title,
                    subtitle: "",
                    iconAttributes: .init(image: image, alignment: .leading),
                    isDisabled: isDisabled,
                    isLoading: false,
                    spinnerImage: nil,
                    buttonStyle: .basic,
                    appearance: appearance.buttonAppearance,
                    counter: nil,
                    action: action
                )
        case .right(let segmentElementContentRight):
            caseRightView(content: segmentElementContentRight)
        case .none:
             SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                counter: nil,
                action: action
            )
        }
    }
    
    func caseRightView(content: SegmentElementContentRight) -> some View {
        switch content {
        case .icon(let image):
            SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: .init(image: image, alignment: .trailing),
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                accessibility: accessibility,
                counter: nil,
                action: action
            )
        case .counter(let counterData):
            SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                accessibility: accessibility,
                counter: ViewProvider(counterData),
                action: action
            )
        case .subtitle(let subtitle):
            SDDSButton(
                title: title,
                subtitle: subtitle,
                iconAttributes: nil,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                accessibility: accessibility,
                counter: nil,
                action: action
            )
        }
    }
}
