import Foundation
import SwiftUI

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

public struct SegmentElement: View {
    public let title: String
    public let contentType: SegmentElementContent
    public let isDisabled: Bool
    public let appearance: ButtonAppearance
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    public var action: () -> Void
    
    public init(
        title: String,
        contentType: SegmentElementContent,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        appearance: ButtonAppearance,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.contentType = contentType
        self.isDisabled = isDisabled
        self.appearance = appearance
        self.layoutMode = layoutMode
        self.accessibility = accessibility
        self.action = action
    }
    
    public var body: some View {
        switch contentType {
        case .none:
            SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance,
                layoutMode: layoutMode,
                counter: nil,
                action: action
            )
        case .left(let image):
            SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: .init(image: image, alignment: .leading),
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance,
                layoutMode: layoutMode,
                counter: nil,
                action: action
            )
        case .right(let contentRight):
            switch contentRight {
            case .icon(let image):
                SDDSButton(
                    title: title,
                    subtitle: "",
                    iconAttributes: .init(image: image, alignment: .trailing),
                    isDisabled: isDisabled,
                    isLoading: false,
                    spinnerImage: nil,
                    buttonStyle: .basic,
                    appearance: appearance,
                    layoutMode: layoutMode,
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
                    appearance: appearance,
                    layoutMode: layoutMode,
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
                    appearance: appearance,
                    layoutMode: layoutMode,
                    accessibility: accessibility,
                    counter: nil,
                    action: action
                )
            }
        }
    }
}
