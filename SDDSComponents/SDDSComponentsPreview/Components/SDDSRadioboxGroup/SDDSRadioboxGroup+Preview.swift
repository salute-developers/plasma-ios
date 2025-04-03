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
                appearance: Radiobox.m.appearance,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(radioboxData: radioboxData, size: SDDSRadioboxGroupSize.large, appearance: RadioboxGroup.m.appearance)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("SDDSRadioboxGroup Preview")
    }
}
