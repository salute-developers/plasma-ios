import Foundation
import SwiftUI
import SDDSComponents

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
        
        return SDDSRadioboxGroup(radioboxData: radioboxData, verticalSpacing: 8)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("SDDSRadioboxGroup Preview")
    }
}
