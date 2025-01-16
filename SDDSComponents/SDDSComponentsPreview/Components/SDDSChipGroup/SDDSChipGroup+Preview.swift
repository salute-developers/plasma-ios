import Foundation
import SDDSComponents
import SwiftUI

// Пример данных и конфигурации для предварительного просмотра
struct SDDSChipGroupPreview: PreviewProvider {
    static var previews: some View {
        let chipAccessibility = ChipAccessibility()
        
        let chipData = (1...32).map { index in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: Image.image("chipIcon"),
                buttonImage: Image.image("chipClose"),
                appearance: SDDSChip.medium.accent.pilled.appearance,
                accessibility: chipAccessibility,
                removeAction: {}
            )
        }
        
        return Group {
            SDDSChipGroup(
                data: chipData,
                gap: .dense,
                appearance: SDDSChipGroup.medium.appearance
            )
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
