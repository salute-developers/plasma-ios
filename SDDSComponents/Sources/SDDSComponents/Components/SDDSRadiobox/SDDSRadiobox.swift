import Foundation
import SwiftUI
import UIKit

public struct RadioboxImages {
    public let selectedImage: Image
    public let deselectedImage: Image
    
    public init(selectedImage: Image, deselectedImage: Image) {
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
    let appearance: RadioboxAppearance
    let accessibility: SelectionControlAccessibility
    
    public init(
        isSelected: Binding<Bool>,
        title: String,
        subtitle: String? = nil,
        isEnabled: Bool,
        images: RadioboxImages,
        appearance: RadioboxAppearance,
        accessibility: SelectionControlAccessibility = SelectionControlAccessibility()
    ) {
        self._isSelected = isSelected
        self.title = title
        self.subtitle = subtitle
        self.isEnabled = isEnabled
        self.images = images
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

public extension RadioboxImages {
    static var defaultImages: RadioboxImages {
        .init(
            selectedImage: Image.image("radioboxOn"),
            deselectedImage: Image.image("radioboxOff")
        )
    }
}

public enum SDDSRadioboxGroupSize: String, RadioboxGroupSizeConfiguration, CaseIterable {
    case medium
    case small
    
    public var verticalSpacing: CGFloat {
        switch self {
        case .medium:
            8
        case .small:
            4
        }
    }
    
    public var debugDescription: String {
        return rawValue
    }
}
