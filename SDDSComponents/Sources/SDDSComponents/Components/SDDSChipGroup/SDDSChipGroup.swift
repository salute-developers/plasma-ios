import Foundation
import SwiftUI

/**
 Компонент для отображения группы чипов.

 - Свойства:
    - data: Массив данных для отображения чипов.
    - appearance: Объект, определяющий внешний вид вариации ChipGroup.
    - flat: Если`true`, то нет переноса чипов на следующую строку.
    - height: Высота компонента, связанная через Binding.
 */
public struct SDDSChipGroup: View {
    let data: [ChipData]
    let appearance: ChipGroupAppearance
    let flat: Bool
    @Binding var height: CGFloat

    public init(
        data: [ChipData],
        appearance: ChipGroupAppearance,
        flat: Bool = false,
        height: Binding<CGFloat> = .constant(0)) {
        self.data = data
        self.appearance = appearance
        self.flat = flat
        _height = height
    }

    public var body: some View {
        GeometryReader { geometry in
            let maxWidth = geometry.size.width - insets.leading -  insets.trailing
            VStack(spacing: insets.top) {
                ForEach(layoutRows(maxWidth: flat ? .infinity : maxWidth, data: data).rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        if size.alignment == .decreasingRight {
                            Spacer()
                        }
                        ForEach(row, id: \.self) { chipData in
                            SDDSChip(data: chipData)
                                .padding(.trailing, insets.trailing)
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
    
    private var insets: EdgeInsets {
        return size.insets(for: gap)
    }
    
    private var size: ChipGroupSizeConfiguration {
        return appearance.size
    }
    
    private var gap: ChipGroupGap {
        return appearance.gap
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
        if let _ = chipData.iconImage, let size = chipData.appearance.size.iconImageSize {
            totalWidth += size.width
            totalWidth += chipData.appearance.size.contentStartPadding
        }
        
        let titleTypography = chipData.appearance.titleTypography.typography(with: chipData.appearance.size) ?? .undefined
        let textWidth = chipData.title.size(withAttributes: [.font: titleTypography.uiFont]).width
        totalWidth += textWidth
        
        if let _ = chipData.buttonImage, let size = chipData.appearance.size.buttonImageSize {
            totalWidth += size.width
            totalWidth += chipData.appearance.size.contentEndPadding
        }
        totalWidth += chipData.appearance.size.trailingInset
        
        return totalWidth
    }

    private func calculateTotalHeight(maxWidth: CGFloat, data: [ChipData]) -> CGFloat {
        let rows = layoutRows(maxWidth: maxWidth, data: data).rows
        let rowHeight = chipRowHeight(data: data)
        var result = CGFloat(rows.count) * rowHeight
        result += CGFloat(rows.count - 1) * insets.top
        result += (insets.bottom + insets.top)
        
        return result
    }

    private func chipRowHeight(data: [ChipData]) -> CGFloat {
        guard let chipData = data.first else {
            return 0
        }
        return chipData.appearance.size.height
    }
}
