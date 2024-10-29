import Foundation
import SwiftUI


/**
 Пример для предварительного просмотра `SDDSRadioboxGroup`.
 */
struct SDDSRadioboxGroupPreview: PreviewProvider {
    static var previews: some View {
        let radioboxData = (0..<5).map { index in
            RadioboxData(
                title: "Option \(index + 1)",
                subtitle: "Description \(index + 1)",
                isSelected: .constant(index == 0),
                images: RadioboxImages.defaultImages,
                size: SDDSRadioboxSize.medium,
                appearance: RadioboxAppearance.default,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(radioboxData: radioboxData, size: SDDSRadioboxGroupSize.medium)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("SDDSRadioboxGroup Preview")
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
