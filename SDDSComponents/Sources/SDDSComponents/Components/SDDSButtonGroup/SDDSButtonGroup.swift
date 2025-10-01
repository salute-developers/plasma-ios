import Foundation
import SwiftUI

/**
 `ButtonGroupLayout` определяет направление расположения кнопок в группе.
 */
public enum ButtonGroupLayout: String, CaseIterable {
    case horizontal
    case vertical
}

/**
 `SDDSButtonGroup` представляет собой общий компонент для отображения группы связанных кнопок.

 - Parameters:
    - data: Массив элементов кнопок
    - appearance: Параметры внешнего вида группы кнопок (опционально)
    - layout: Направление расположения кнопок (.horizontal или .vertical)
    - flat: Флаг плоского отображения группы

 ## Окружение
 - `buttonGroupAppearance`: Стандартные настройки внешнего вида группы кнопок

 ## Примеры использования

 ```swift
 // Горизонтальная группа кнопок
 let buttonData = (1...5).map { index in
     ButtonData(
         title: "Button \(index)",
         buttonStyle: .basic,
         appearance: ButtonAppearance(),
         action: {}
     )
 }
 
 SDDSButtonGroup(
     data: buttonData,
     appearance: ButtonGroupAppearance(),
     layout: .horizontal
 )
 
 // Вертикальная группа кнопок
 SDDSButtonGroup(
     data: buttonData,
     appearance: ButtonGroupAppearance(),
     layout: .vertical
 )
 ```
 */
public struct SDDSButtonGroup: View {
    let data: [ButtonData]
    private let _appearance: ButtonGroupAppearance?
    let layout: ButtonGroupLayout
    let flat: Bool
    @State private var buttonSizes: [UUID: CGSize] = [:]
    @State private var containerHeight: CGFloat = 0
    
    @Environment(\.buttonGroupAppearance) private var environmentAppearance
    
    public init(
        data: [ButtonData],
        appearance: ButtonGroupAppearance? = nil,
        layout: ButtonGroupLayout = .horizontal,
        flat: Bool = false
    ) {
        self.data = data
        self._appearance = appearance
        self.layout = layout
        self.flat = flat
    }
    
    private func createButtonView(for buttonData: ButtonData, pathDrawer: PathDrawer) -> some View {
        Group {
            switch buttonData.buttonStyle {
            case .basic:
                BasicButton(
                    title: buttonData.title,
                    subtitle: buttonData.subtitle,
                    iconAttributes: buttonData.iconAttributes,
                    isDisabled: buttonData.isDisabled,
                    isLoading: buttonData.isLoading,
                    spinnerImage: buttonData.spinnerImage,
                    appearance: buttonAppearance(buttonData: buttonData, pathDrawer: pathDrawer),
                    layoutMode: buttonData.layoutMode,
                    accessibility: buttonData.accessibility,
                    action: buttonData.action
                )
            case .icon:
                IconButton(
                    iconAttributes: buttonData.iconAttributes,
                    isDisabled: buttonData.isDisabled,
                    isLoading: buttonData.isLoading,
                    spinnerImage: buttonData.spinnerImage,
                    appearance: buttonAppearance(buttonData: buttonData, pathDrawer: pathDrawer),
                    layoutMode: buttonData.layoutMode,
                    accessibility: buttonData.accessibility,
                    action: buttonData.action
                )
            }
        }
    }
    
    private func buttonAppearance(buttonData: ButtonData, pathDrawer: PathDrawer) -> ButtonAppearance {
        var buttonAppearance = buttonData.appearance
        var size = DefaultButtonSize(size: buttonAppearance.size)
        if !(appearance.size.externalShape is DefaultPathDrawer && appearance.size.internalShape is DefaultPathDrawer) {
            size.pathDrawer = pathDrawer
        }
        buttonAppearance.size = size
        return buttonAppearance
    }
    
    var appearance: ButtonGroupAppearance {
        _appearance ?? environmentAppearance
    }

    public var body: some View {
        GeometryReader { geometry in
            let maxWidth = geometry.size.width - appearance.size.spacing * 2
            let maxHeight = geometry.size.height - appearance.size.spacing * 2
            
            Group {
                switch layout {
                case .horizontal:
                    VStack(spacing: appearance.size.spacing) {
                        ForEach(layoutRows(maxWidth: flat ? .infinity : maxWidth, data: data).rows, id: \.self) { row in
                            HStack(spacing: appearance.size.spacing) {
                                ForEach(row, id: \.self) { buttonData in
                                    createButtonView(for: buttonData, pathDrawer: appearance.size.internalShape)
                                        .readSize { size in
                                            buttonSizes[buttonData.id] = size
                                        }
                                }
                            }
                            .shape(pathDrawer: appearance.size.externalShape)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                case .vertical:
                    VStack(spacing: appearance.size.spacing) {
                        ForEach(data, id: \.id) { buttonData in
                            createButtonView(for: buttonData, pathDrawer: appearance.size.internalShape)
                                .readSize { size in
                                    buttonSizes[buttonData.id] = size
                                }
                        }
                    }
                    .shape(pathDrawer: appearance.size.externalShape)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .readSize { size in
                containerHeight = size.height
            }
        }
        .frame(height: containerHeight > 0 ? containerHeight : nil)
        .applyIf(flat, transform: { $0.frame(width: maxCalculatedWidth) })
        .applyIf(flat && layout == .vertical, transform: { $0.frame(height: maxCalculatedHeight) })
    }
                 
    private var maxCalculatedWidth: CGFloat {
        switch layout {
        case .horizontal:
            return layoutRows(maxWidth: .infinity, data: data).currentRowWidth
        case .vertical:
            return calculateVerticalLayoutWidth()
        }
    }
    
    private func calculateVerticalLayoutWidth() -> CGFloat {
        var maxWidth: CGFloat = 0
        for buttonData in data {
            maxWidth = max(maxWidth, calculateButtonWidth(for: buttonData))
        }
        return maxWidth
    }
    
    private var maxCalculatedHeight: CGFloat {
        switch layout {
        case .horizontal:
            return calculateHorizontalLayoutHeight()
        case .vertical:
            return calculateVerticalLayoutHeight()
        }
    }
    
    private func calculateVerticalLayoutHeight() -> CGFloat {
        var totalHeight: CGFloat = 0
        for (index, buttonData) in data.enumerated() {
            totalHeight += calculateButtonHeight(for: buttonData)
            if index < data.count - 1 {
                totalHeight += appearance.size.spacing
            }
        }
        return totalHeight
    }
    
    private func calculateHorizontalLayoutHeight() -> CGFloat {
        let rows = layoutRows(maxWidth: .infinity, data: data).rows
        var totalHeight: CGFloat = 0
        
        for (index, row) in rows.enumerated() {
            var rowHeight: CGFloat = 0
            for buttonData in row {
                rowHeight = max(rowHeight, calculateButtonHeight(for: buttonData))
            }
            totalHeight += rowHeight
            if index < rows.count - 1 {
                totalHeight += appearance.size.spacing
            }
        }
        
        return totalHeight
    }
    
    private func layoutRows(maxWidth: CGFloat, data: [ButtonData]) -> (rows: [[ButtonData]], currentRowWidth: CGFloat) {
        var rows: [[ButtonData]] = []
        var currentRow: [ButtonData] = []
        var currentRowWidth: CGFloat = 0
        var buttonWidth: CGFloat = 0

        for buttonData in data {
            buttonWidth = calculateButtonWidth(for: buttonData)

            if currentRowWidth + buttonWidth + (currentRow.isEmpty ? 0 : appearance.size.spacing) > maxWidth {
                rows.append(currentRow)
                currentRow = [buttonData]
                currentRowWidth = buttonWidth
            } else {
                if !currentRow.isEmpty {
                    currentRowWidth += appearance.size.spacing
                }
                currentRow.append(buttonData)
                currentRowWidth += buttonWidth
            }
        }

        if !currentRow.isEmpty {
            rows.append(currentRow)
        }

        return (rows, currentRowWidth)
    }

    private func calculateButtonWidth(for buttonData: ButtonData) -> CGFloat {
        guard let size = buttonSizes[buttonData.id] else {
            return 0
        }
        return size.width
    }
    
    private func calculateButtonHeight(for buttonData: ButtonData) -> CGFloat {
        guard let size = buttonSizes[buttonData.id] else {
            return 0
        }
        return size.height
    }

}
