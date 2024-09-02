import Foundation
import SDDSComponents
import SwiftUI

// Пример данных и конфигурации для предварительного просмотра
struct SDDSChipGroupPreview: PreviewProvider {
    static var previews: some View {
        let chipAppearance = ChipAppearance(
            titleColor: Color.white.equalToken,
            titleTypography: .semibold14,
            imageTintColor: Color.white.equalToken,
            buttonTintColor: Color.gray.equalToken,
            disabledAlpha: 0.5
        )
        
        let chipSize = SDDSChipSize.medium(.rounded)
        let chipAccessibility = ChipAccessibility()
        
        let chipData = (1...12).map { index in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: Image.image("chipIcon"),
                buttonImage: Image.image("chipClose"),
                appearance: chipAppearance,
                size: chipSize,
                accessibility: chipAccessibility,
                removeAction: {}
            )
        }
        
        return Group {
            SDDSChipGroup(data: chipData, size: DefaultChipGroupSize(alignment: .center))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Standard Layout - Center")
                .padding()
                .debug()
            
            SDDSChipGroup(data: chipData, size: DefaultChipGroupSize(alignment: .left))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Standard Layout - Left")
                .padding()
                .debug()
            
            SDDSChipGroup(data: chipData, size: DefaultChipGroupSize(alignment: .right))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Standard Layout - Right")
                .padding()
                .debug()
            
            SDDSChipGroup(data: chipData, size: DefaultChipGroupSize(alignment: .decreasingLeft))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Decreasing Layout - Left")
                .padding()
                .debug()
            
            SDDSChipGroup(data: chipData, size: DefaultChipGroupSize(alignment: .decreasingRight))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Decreasing Layout - Right")
                .padding()
                .debug()
        }
    }
}