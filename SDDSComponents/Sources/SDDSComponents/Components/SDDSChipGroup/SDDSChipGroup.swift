import Foundation
import SwiftUI

/**
 `SDDSChipGroup` представляет собой компонент для отображения группы связанных чипов.

 - Parameters:
    - data: Массив элементов чипов
    - appearance: Параметры внешнего вида группы чипов (опционально)
    - flat: Флаг плоского отображения группы
    - height: Привязка к высоте группы

 ## Окружение
 - `chipGroupAppearance`: Стандартные настройки внешнего вида группы чипов

 ## Примеры использования

 ```swift
 // Базовая группа чипов
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
 
SDDSChipGroup(
    data: chipData,
    appearance: ChipGroup.dense.appearance
    )
 ```
 */
public struct SDDSChipGroup: View {
    let data: [ChipData]
    private let _appearance: ChipGroupAppearance?
    let flat: Bool
    let gap: ChipGroupGap
    @Binding var height: CGFloat
    
    @Environment(\.chipGroupAppearance) private var environmentAppearance
    
    public init(
        data: [ChipData],
        appearance: ChipGroupAppearance? = nil,
        flat: Bool = false,
        height: Binding<CGFloat> = .constant(0),
        gap: ChipGroupGap = .dense
    ) {
        self.data = data
        self._appearance = appearance
        self.flat = flat
        self.gap = gap
        _height = height
    }

    public var body: some View {
        GeometryReader { geometry in
            let maxWidth = geometry.size.width - appearance.size.lineSpacing - appearance.size.lineSpacing
            VStack(spacing: appearance.size.lineSpacing) {
                ForEach(layoutRows(maxWidth: flat ? .infinity : maxWidth, data: data).rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        if size.alignment == .decreasingRight {
                            Spacer()
                        }
                        ForEach(row, id: \.self) { chipData in
                            SDDSChip(
                                data: chipData,
                                appearance: appearance.chipAppearance
                            )
                            .padding(.trailing, appearance.size.gap)
                        }
                        if size.alignment == .decreasingLeft {
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: alignment)
                }
            }
            .onAppear {
                self.height = calculateTotalHeight(maxWidth: maxWidth, data: data)
            }
            .onChange(of: data) { value in
                self.height = calculateTotalHeight(maxWidth: maxWidth, data: value)
            }
        }
        .frame(height: height)
        .applyIf(flat, transform: { $0.frame(width: maxCalculatedWidth) })
    }
                 
    private var maxCalculatedWidth: CGFloat {
        return layoutRows(maxWidth: .infinity, data: data).currentRowWidth
    }
    
    private var inset: CGFloat {
        appearance.size.lineSpacing
    }
    
    private var size: ChipGroupSizeConfiguration {
        return appearance.size
    }

    private var alignment: SwiftUI.Alignment {
        switch size.alignment {
        case .left, .decreasingLeft:
            return .leading
        case .right, .decreasingRight:
            return .trailing
        case .center:
            return .center
        }
    }

    private func layoutRows(maxWidth: CGFloat, data: [ChipData]) -> (rows: [[ChipData]], currentRowWidth: CGFloat) {
        var rows: [[ChipData]] = []
        var currentRow: [ChipData] = []
        var currentRowWidth: CGFloat = 0
        var chipWidth: CGFloat = 0

        for chipData in data {
            chipWidth = calculateChipWidth(for: chipData)

            if currentRowWidth + chipWidth > maxWidth {
                rows.append(currentRow)
                currentRow = [chipData]
                currentRowWidth = chipWidth
            } else {
                currentRow.append(chipData)
                currentRowWidth += chipWidth
            }
        }

        if !currentRow.isEmpty {
            rows.append(currentRow)
        }

        return (rows, currentRowWidth)
    }

    private func calculateChipWidth(for chipData: ChipData) -> CGFloat {
        var totalWidth = CGFloat(0)
        totalWidth += chipData.appearance.size.leadingInset
        if let _ = chipData.iconImage {
            totalWidth += chipData.appearance.size.iconImageSize.width
            totalWidth += chipData.appearance.size.contentStartPadding
        }
        let titleTypography = chipData.appearance.titleTypography.typography(with: chipData.appearance.size) ?? .undefined
        let textWidth = chipData.title.size(withAttributes: [.font: titleTypography.uiFont]).width
        totalWidth += textWidth
        
        if let _ = chipData.buttonImage {
            totalWidth += chipData.appearance.size.buttonImageSize.width
            totalWidth += chipData.appearance.size.contentEndPadding
        }
        totalWidth += chipData.appearance.size.trailingInset
        
        return totalWidth
    }

    private func calculateTotalHeight(maxWidth: CGFloat, data: [ChipData]) -> CGFloat {
        let rows = layoutRows(maxWidth: maxWidth, data: data).rows
        let rowHeight = chipRowHeight(data: data)
        var result = CGFloat(rows.count) * rowHeight
        result += CGFloat(rows.count - 1) * appearance.size.lineSpacing
        result += (appearance.size.lineSpacing + appearance.size.lineSpacing)
        
        return result
    }

    private func chipRowHeight(data: [ChipData]) -> CGFloat {
        guard let chipData = data.first else {
            return 0
        }
        return chipData.appearance.size.height
    }
    
    var appearance: ChipGroupAppearance {
        _appearance ?? environmentAppearance
    }
}
