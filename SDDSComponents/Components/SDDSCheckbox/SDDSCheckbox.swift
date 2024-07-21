import Foundation
import SwiftUI

public struct SDDSCheckbox: View {
    @Binding var state: SelectionControlState
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let images: SelectionControlStateImages
    let size: SelectionControlSizeConfiguration
    let appearance: CheckboxAppearance
    let accessibility: SelectionControlAccessibility
    
    public init(
        state: Binding<SelectionControlState>,
        title: String,
        subtitle: String? = nil,
        isEnabled: Bool,
        images: SelectionControlStateImages,
        size: SelectionControlSizeConfiguration = SDDSCheckboxSize(),
        appearance: CheckboxAppearance,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self._state = state
        self.title = title
        self.subtitle = subtitle
        self.isEnabled = isEnabled
        self.images = images
        self.size = size
        self.appearance = appearance
        self.accessibility = accessibility
    }
    
    public var body: some View {
        SelectionControl(
            state: $state,
            type: .checkbox,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            size: size,
            appearance: appearance,
            images: images,
            accessibility: accessibility
        )
    }
}

// MARK: - Preview
struct SDDSCheckboxPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSCheckbox.defaultExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default")
                .debug()
            
            SDDSCheckbox.withoutDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Description")
                .debug()
            
            SDDSCheckbox.withoutLabel
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label")
                .debug()
            
            SDDSCheckbox.withoutLabelAndDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label and Description")
                .debug()
        }
    }
}

public struct SDDSCheckboxSize: SelectionControlSizeConfiguration {
    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var imageSize: CGSize {
        .init(width: 20, height: 20)
    }
    
    public var verticalGap: CGFloat {
        0.0
    }
    
    public var horizontalGap: CGFloat {
        8.0
    }
    
    public init() {}
}

extension SDDSCheckbox {
    static var defaultExample: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "Label",
            subtitle: "Description",
            isEnabled: true, 
            images: .checkbox,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutDescription: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "Label",
            subtitle: nil,
            isEnabled: true,
            images: .checkbox,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabel: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "",
            subtitle: "Description",
            isEnabled: true,
            images: .checkbox,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabelAndDescription: SDDSCheckbox {
        .init(
            state: .constant(.selected),
            title: "",
            subtitle: nil,
            isEnabled: true,
            images: .checkbox,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
}

extension CheckboxAppearance {
    static var defaultExample: CheckboxAppearance {
        .init(
            titleTypography: .semibold16,
            subtitleTypography: .semibold14,
            enabledTitleColor: .blackTitleColor,
            enabledSubtitleColor: .subtitleColor,
            disabledTitleColor: .blackTitleColor.withOpacity(0.3),
            disabledSubtitleColor: .subtitleColor.withOpacity(0.3),
            disabledImageAlpha: 0.3,
            imageTintColor: .greenColor
        )
    }
}

public extension SelectionControlStateImages {
    static var checkbox: SelectionControlStateImages {
        .init(
            selectedImage: Image.image("checkboxOn"),
            deselectedImage: Image.image("checkboxOff"),
            indeterminateImage: Image.image("checkboxMulti")
        )
    }
}
