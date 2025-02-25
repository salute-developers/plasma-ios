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
<<<<<<< HEAD
                appearance: Chip.m.default.appearance,
=======
                appearance: SDDSChip.medium.accent.pilled.appearance,
>>>>>>> 88aa9aeb (chore: revert naming in componetns-preview)
                accessibility: chipAccessibility,
                removeAction: {}
            )
        }
        
        return Group {
            SDDSChipGroup(
                data: chipData,
                appearance: SDDSChipGroup.dense.appearance
            )
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
