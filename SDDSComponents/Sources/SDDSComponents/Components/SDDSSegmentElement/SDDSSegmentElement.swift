import Foundation
import SwiftUI

public struct SDDSSegmentElement: View {
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let appearance: SegmentElementAppearance
    public let accessibility: SegmentElementAccessibility
    public let counter: SDDSCounter?
    public var action: () -> Void
    
    public init(
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes?,
        isDisabled: Bool = false,
        appearance: SegmentElementAppearance,
        accessibility: SegmentElementAccessibility = SegmentElementAccessibility(),
        counter: SDDSCounter? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.appearance = appearance
        self.accessibility = accessibility
        self.counter = counter
        self.action = action
    }
    
    @ViewBuilder
    public var body: some View {
        if hasTitle && !hasCounter && !hasSubtitle {
            SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: iconAttributes,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                counterView: nil,
                action: action
            )
        } else if hasTitle && !hasCounter && hasSubtitle {
            SDDSButton(
                title: title,
                subtitle: subtitle,
                iconAttributes: iconAttributes,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                counterView: nil,
                action: action
            )
        } else if hasTitle && hasCounter && !hasSubtitle && isIconLeading {
            SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: iconAttributes,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                counterView: counter,
                action: action
            )
        } else {
            SDDSButton(
                title: title,
                subtitle: "",
                iconAttributes: iconAttributes,
                isDisabled: isDisabled,
                isLoading: false,
                spinnerImage: nil,
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance,
                counterView: nil,
                action: action
            )
        }
    }
}


extension SDDSSegmentElement {
    var hasIconAttributes: Bool {
        iconAttributes != nil
    }
    
    var isIconLeading: Bool {
        if let iconAttributes = iconAttributes, iconAttributes.alignment == .leading {
            return true
        }
        return false
    }

    var hasTitle: Bool {
        !title.isEmpty
    }
    
    var hasSubtitle: Bool {
        !subtitle.isEmpty
    }
    
    var hasCounter: Bool {
        counter != nil
    }
}
