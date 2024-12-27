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
    //    public let layoutMode: ButtonLayoutMode
    //    public let accessibility: ButtonAccessibility
    public var action: () -> Void
    
    public init(
        title: String,
        contentType: SegmentElementContent,
        isDisabled: Bool = false,
        appearance: SegmentElementAppearance,
        //        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.contentType = contentType
        self.isDisabled = isDisabled
        self.appearance = appearance
        //        self.layoutMode = layoutMode
        //        self.accessibility = accessibility
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
                    appearance: ButtonAppearance(
                        size: size,
                        titleTypography: appearance.titleTypography,
                        titleColor: titleColor,
                        subtitleTypography: appearance.subtitleTypography,
                        subtitleColor: subtitleColor,
                        iconColor: iconColor,
                        backgroundColor: backgroundColor,
                        disabledAlpha: appearance.disabledAlpha
                    ),
                    //                layoutMode: layoutMode,
                    counter: nil,
                    action: action
                )
        case .right(let segmentElementContentRight):
             EmptyView()
        case .none:
             SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: ButtonAppearance(
                    size: size,
                    titleTypography: appearance.titleTypography,
                    titleColor: titleColor,
                    subtitleTypography: appearance.subtitleTypography,
                    subtitleColor: subtitleColor,
                    iconColor: iconColor,
                    backgroundColor: backgroundColor,
                    disabledAlpha: appearance.disabledAlpha
                ),
                //                layoutMode: layoutMode,
                counter: nil,
                action: action
            )
        }
    }
}

extension SDDSSegmentElement {
    func caseRightView(_ content: SegmentElementContentRight) -> some View {
        switch content {
        case .icon(let image):
        return SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: .init(image: image, alignment: .trailing),
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: ButtonAppearance(
                    size: size,
                    titleTypography: appearance.titleTypography,
                    titleColor: titleColor,
                    subtitleTypography: appearance.subtitleTypography,
                    subtitleColor: subtitleColor,
                    iconColor: iconColor,
                    backgroundColor: backgroundColor,
                    disabledAlpha: appearance.disabledAlpha
                ),
                //                    layoutMode: layoutMode,
                accessibility: accessibility,
                counter: nil,
                action: action
            )
        case .counter(let counterData):
            return SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: ButtonAppearance(
                    size: size,
                    titleTypography: appearance.titleTypography,
                    titleColor: titleColor,
                    subtitleTypography: appearance.subtitleTypography,
                    subtitleColor: subtitleColor,
                    iconColor: iconColor,
                    backgroundColor: backgroundColor,
                    disabledAlpha: appearance.disabledAlpha
                ),
                //                    layoutMode: layoutMode,
                accessibility: accessibility,
                counter: ViewProvider(counterData),
                action: action
            )
        case .subtitle(let subtitle):
            return SDDSButton(
                title: title,
                subtitle: subtitle,
                iconAttributes: nil,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: ButtonAppearance(
                    size: size,
                    titleTypography: appearance.titleTypography,
                    titleColor: titleColor,
                    subtitleTypography: appearance.subtitleTypography,
                    subtitleColor: subtitleColor,
                    iconColor: iconColor,
                    backgroundColor: backgroundColor,
                    disabledAlpha: appearance.disabledAlpha
                ),
                //                    layoutMode: layoutMode,
                accessibility: accessibility,
                counter: nil,
                action: action
            )
        }
    }
}
