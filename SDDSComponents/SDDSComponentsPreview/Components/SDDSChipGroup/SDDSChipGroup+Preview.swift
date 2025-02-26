import Foundation
import SDDSComponents
import SwiftUI
import SDDSServTheme

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
                appearance: Chip.m.default.appearance,
                accessibility: chipAccessibility,
                removeAction: {}
            )
        }
        
        return Group {
            SDDSChipGroup(
                data: chipData,
                appearance: ChipGroup.dense.appearance
            )
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
