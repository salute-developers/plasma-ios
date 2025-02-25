import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

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
                appearance: SDDSRadiobox.medium.default.appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(radioboxData: radioboxData, size: SDDSRadioboxGroupSize.medium)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("SDDSRadioboxGroup Preview")
    }
}
