import Foundation
import SwiftUI

/**
 Структура, представляющая данные для чипа.

 - Properties:
    - id: Уникальный идентификатор чипа.
    - title: Текст заголовка чипа.
    - isEnabled: Флаг, указывающий, включен ли чип.
    - iconImage: Изображение иконки для чипа.
    - buttonImage: Изображение кнопки для чипа.
    - appearance: Параметры внешнего вида чипа.
    - size: Конфигурация размеров для чипа.
    - accessibility: Параметры доступности для чипа.
    - removeAction: Действие при нажатии на кнопку удаления.
 */
public struct ChipData: Hashable {
    let id = UUID()
    public let title: String
    public let isEnabled: Bool
    public let iconImage: Image?
    public let buttonImage: Image?
    public let appearance: ChipAppearance
    public let size: ChipSizeConfiguration
    public let accessibility: ChipAccessibility
    public let removeAction: () -> Void
    
    public init(title: String, isEnabled: Bool, iconImage: Image?, buttonImage: Image?, appearance: ChipAppearance, size: ChipSizeConfiguration, accessibility: ChipAccessibility, removeAction: @escaping () -> Void) {
        self.title = title
        self.isEnabled = isEnabled
        self.iconImage = iconImage
        self.buttonImage = buttonImage
        self.appearance = appearance
        self.size = size
        self.accessibility = accessibility
        self.removeAction = removeAction 
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.uuidString)
    }
    
    public static func == (lhs: ChipData, rhs: ChipData) -> Bool {
        lhs.id == rhs.id
    }
}

/**
 Перечисление, определяющее варианты выравнивания группы чипов.

 - Cases:
    - left: Выравнивание по левому краю.
    - right: Выравнивание по правому краю.
    - center: Центрированное выравнивание.
    - decreasingLeft: Убывающее количество элементов, выравненных по левому краю.
    - decreasingRight: Убывающее количество элементов, выравненных по правому краю.
 */
public enum ChipGroupAlignment {
    case left
    case right
    case center
    case decreasingLeft
    case decreasingRight
}

/**
 Протокол конфигурации размеров группы чипов.

 - Properties:
    - insets: Внутренние отступы.
    - maxColumns: Максимальное количество столбцов в ряду.
    - alignment: Выравнивание группы чипов.
 */
public protocol ChipGroupSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var insets: EdgeInsets { get }
    var maxColumns: Int { get }
    var alignment: ChipGroupAlignment { get }
}

/**
 Вью для отображения группы чипов.

 - Properties:
    - data: Массив данных для чипов.
    - size: Конфигурация размеров для группы чипов.
 */
import SwiftUI

public struct SDDSChipGroup: View {
    let data: [ChipData]
    let size: ChipGroupSizeConfiguration
    @Binding var height: CGFloat

    public init(data: [ChipData], size: ChipGroupSizeConfiguration, height: Binding<CGFloat> = .constant(0)) {
        self.data = data
        self.size = size
        _height = height
    }

    public var body: some View {
        GeometryReader { geometry in
            let maxWidth = geometry.size.width - size.insets.leading - size.insets.trailing
            VStack(spacing: size.insets.top) {
                ForEach(layoutRows(maxWidth: maxWidth), id: \.self) { row in
                    HStack(spacing: 0) {
                        if size.alignment == .decreasingRight {
                            Spacer()
                        }
                        ForEach(row, id: \.self) { chipData in
                            SDDSChip(data: chipData)
                                .padding(.trailing, size.insets.trailing)
                        }
                        if size.alignment == .decreasingLeft {
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: alignment)
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    self.height = calculateTotalHeight(maxWidth: maxWidth)
                }
            }
            .onChange(of: data) { _ in
                DispatchQueue.main.async {
                    self.height = calculateTotalHeight(maxWidth: maxWidth)
                }
            }
        }
        .padding(.leading, size.insets.leading)
        .padding(.top, size.insets.top)
        .padding(.bottom, size.insets.bottom)
        .frame(height: height)
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

    private func layoutRows(maxWidth: CGFloat) -> [[ChipData]] {
        var rows: [[ChipData]] = []
        var currentRow: [ChipData] = []
        var currentRowWidth: CGFloat = 0

        for chipData in data {
            let chipWidth = calculateChipWidth(for: chipData)

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

        return rows
    }

    private func calculateChipWidth(for chipData: ChipData) -> CGFloat {
        let titleTypography = chipData.appearance.titleTypography.typography(with: chipData.size) ?? .undefined
        let textWidth = chipData.title.size(withAttributes: [.font: titleTypography.uiFont]).width
        let iconWidth: CGFloat = chipData.size.iconImageSize?.width ?? 0
        let buttonWidth: CGFloat = chipData.size.buttonImageSize?.width ?? 0
        var totalWidth = textWidth + iconWidth + buttonWidth + chipData.size.leadingInset + chipData.size.trailingInset + 2 * chipData.size.spacing
        if iconWidth > 0 {
            totalWidth += chipData.size.spacing
        }
        if buttonWidth > 0 {
            totalWidth += chipData.size.spacing
        }
        return totalWidth
    }

    private func calculateTotalHeight(maxWidth: CGFloat) -> CGFloat {
        let rows = layoutRows(maxWidth: maxWidth)
        let rowHeight = chipRowHeight()
        var result = CGFloat(rows.count) * rowHeight
        result += CGFloat(rows.count - 1) * size.insets.top
        result += (size.insets.bottom + size.insets.top)
        
        return result
    }

    private func chipRowHeight() -> CGFloat {
        guard let chipData = data.first else {
            return 0
        }
        return chipData.size.height
    }
}
