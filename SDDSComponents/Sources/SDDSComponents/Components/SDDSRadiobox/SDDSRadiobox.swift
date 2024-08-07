import Foundation
import SwiftUI
import UIKit

public struct RadioboxImages {
    public let selectedImage: Image
    public let deselectedImage: Image
    
    init(selectedImage: Image, deselectedImage: Image) {
        self.selectedImage = selectedImage
        self.deselectedImage = deselectedImage
    }
}

public struct SDDSRadiobox: View {
    @Binding var isSelected: Bool
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let images: RadioboxImages
    let size: SelectionControlSizeConfiguration
    let appearance: RadioboxAppearance
    let accessibility: SelectionControlAccessibility
    
    public init(
        isSelected: Binding<Bool>,
        title: String,
        subtitle: String? = nil,
        isEnabled: Bool,
        images: RadioboxImages,
        size: SelectionControlSizeConfiguration = SDDSRadioboxSize(),
        appearance: RadioboxAppearance,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self._isSelected = isSelected
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
            state: Binding(
                get: {
                    return isSelected ? .selected : .deselected
                },
                set: { value in
                    self.isSelected = value.isSelected
                }
            ),
            type: .radiobox,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            size: size,
            appearance: appearance,
            images: .init(
                selectedImage: images.selectedImage,
                deselectedImage: images.deselectedImage,
                indeterminateImage: nil
            ),
            accessibility: accessibility
        )
    }
}

// MARK: - Preview
struct SDDSRadioboxPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSRadiobox.defaultExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default")
                .debug()
            
            SDDSRadiobox.withoutDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Description")
                .debug()
            
            SDDSRadiobox.withoutLabel
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label")
                .debug()
            
            SDDSRadiobox.withoutLabelAndDescription
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Without Label and Description")
                .debug()
        }
    }
}

public struct SDDSRadioboxSize: SelectionControlSizeConfiguration {
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

public extension SDDSRadiobox {
    static var defaultExample: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "Label",
            subtitle: "Description",
            isEnabled: true,
            images: .defaultImages,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutDescription: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "Label",
            subtitle: nil,
            isEnabled: true,
            images: .defaultImages,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabel: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "",
            subtitle: "Description",
            isEnabled: true,
            images: .defaultImages,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
    
    static var withoutLabelAndDescription: SDDSRadiobox {
        .init(
            isSelected: .constant(true),
            title: "",
            subtitle: nil,
            isEnabled: true,
            images: .defaultImages,
            appearance: .defaultExample,
            accessibility: SelectionControlAccessibility()
        )
    }
}

extension RadioboxAppearance {
    static var defaultExample: RadioboxAppearance {
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

public extension RadioboxImages {
    static var defaultImages: RadioboxImages {
        .init(
            selectedImage: Image.image("radioboxOn"),
            deselectedImage: Image.image("radioboxOff")
        )
    }
}
