import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSTabItem` представляет собой элемент вкладки с поддержкой горизонтальной и вертикальной ориентации.
 
 Компонент поддерживает различные состояния (selected, disabled) и автоматически применяет соответствующие стили.
 
 - Parameters:
    - label: Текст метки
    - value: Текст значения (опционально)
    - counterValue: Значение счетчика (опционально)
    - isSelected: Состояние выбранности
    - isDisabled: Состояние disabled
    - orientation: Ориентация элемента (horizontal/vertical)
    - appearance: Параметры внешнего вида элемента (опционально)
    - startContent: ViewBuilder для контента слева (обычно иконка)
    - contentRight: ViewBuilder для контента справа (может быть counter или любая view)
    - actionContent: ViewBuilder для действия (если EmptyView - показываем actionIcon)
 
 ## Особенности
 - Поддерживает horizontal и vertical ориентации
 - В selected состоянии показывает индикатор (снизу для horizontal, слева для vertical)
 - ActionContent: если передан EmptyView, отображается actionIcon из appearance
 - ContentRight: может быть текст, counter или любая view
 - Если контент отсутствует (EmptyView), он не отображается в layout
 
 ## Примеры использования
 ```swift
 // Базовый элемент
 SDDSTabItem(
     label: "Tab 1",
     orientation: .horizontal
 )
 
 // С иконкой и значением
 SDDSTabItem(
     label: "Tab",
     value: "Value",
     orientation: .horizontal,
     startContent: {
         Image(systemName: "star")
     }
 )
 
 // С counter
 SDDSTabItem(
     label: "Messages",
     counterValue: 5,
     orientation: .horizontal
 )
 ```
 */
public struct SDDSTabItem<StartContent: View, ContentRight: View, ActionContent: View>: View {
    @Environment(\.tabItemAppearance) private var environmentAppearance
    @Environment(\.tabsAppearance) private var tabsEnvironmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    private let _appearance: TabItemAppearance?
    private let label: String
    private let value: String?
    private let counterValue: Int?
    private let isSelected: Bool
    private let isDisabled: Bool
    private let orientation: TabsOrientation
    private let hasStartContent: Bool
    private let hasContentRight: Bool
    private let hasActionContent: Bool
    private let startContent: StartContent
    private let contentRight: ContentRight
    private let actionContent: ActionContent
    
    public init(
        label: String,
        value: String? = nil,
        counterValue: Int? = nil,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        hasStartContent: Bool = false,
        hasContentRight: Bool = false,
        hasActionContent: Bool = false,
        orientation: TabsOrientation = .horizontal,
        appearance: TabItemAppearance? = nil,
        @ViewBuilder startContent: () -> StartContent = { EmptyView() },
        @ViewBuilder contentRight: () -> ContentRight = { EmptyView() },
        @ViewBuilder actionContent: () -> ActionContent = { EmptyView() }
    ) {
        self.label = label
        self.value = value
        self.counterValue = counterValue
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.orientation = orientation
        self._appearance = appearance
        self.hasStartContent = hasStartContent
        self.hasContentRight = hasContentRight
        self.hasActionContent = hasActionContent
        self.startContent = startContent()
        self.contentRight = contentRight()
        self.actionContent = actionContent()
    }
    
    public var body: some View {
        switch orientation {
        case .horizontal:
            horizontalLayout
        case .vertical:
            verticalLayout
        }
    }
    
    @ViewBuilder private var horizontalLayout: some View {
        VStack(spacing: 0) {
            if isIconTabItem {
                iconTabItemContent
                    .frame(minHeight: appearance.size.minHeight)
                    .padding(.leading, appearance.size.paddingStart)
                    .padding(.trailing, appearance.size.paddingEnd)
                    .opacity(isDisabled ? appearance.size.disableAlpha : 1.0)
            } else {
                HStack(alignment: .center, spacing: 0) {
                    if hasStartContent {
                        if !(startContent is EmptyView) {
                            startContent
                                .frame(width: appearance.size.startContentSize, height: appearance.size.startContentSize)
                                .foregroundStyle(contentColor(for: appearance.startContentColor))
                                .padding(.trailing, appearance.size.valuePadding)
                        }
                    }
                    
                    Text(label)
                        .foregroundStyle(contentColor(for: appearance.labelColor))
                        .typography(labelTypography)
                    
                    if let value = value {
                        Text(value)
                            .foregroundStyle(contentColor(for: appearance.valueColor))
                            .typography(valueTypography)
                            .padding(.leading, appearance.size.valuePadding)
                    }
                    
                    if hasContentRight {
                         if let counterValue = counterValue, let counterAppearance = appearance.counterAppearance {
                            SDDSCounter(
                                text: "\(counterValue)",
                                appearance: counterAppearance,
                                isAnimating: false,
                                isHighlighted: false,
                                isHovered: false,
                                isSelected: isSelected
                            )
                            .padding(.leading, appearance.size.counterPadding)
                        } else {
                            if !(contentRight is EmptyView) {
                                contentRight
                                    .frame(width: appearance.size.endContentSize, height: appearance.size.endContentSize)
                                    .padding(.leading, appearance.size.counterPadding)
                            }
                        }
                    } else {
                        EmptyView()
                    }
                    
                    if hasActionContent {
                        if !(actionContent is EmptyView) {
                            actionContent
                                .padding(.leading, appearance.size.actionPadding)
                        } else if let actionIcon = appearance.actionIcon {
                            actionIcon
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: appearance.size.actionIconSize, height: appearance.size.actionIconSize)
                                .foregroundStyle(actionContentColor(for: appearance.actionColor))
                                .padding(.leading, appearance.size.actionPadding)
                        }
                    } else {
                        EmptyView()
                    }
                }
                .frame(minHeight: appearance.size.minHeight)
                .padding(.leading, appearance.size.paddingStart)
                .padding(.trailing, appearance.size.paddingEnd)
                .opacity(isDisabled ? appearance.size.disableAlpha : 1.0)
            }
            
            if isSelected {
                Rectangle()
                    .fill(indicatorColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(height: indicatorThickness)
            }
        }
    }
    
    @ViewBuilder private var verticalLayout: some View {
        HStack(spacing: 0) {
            // Selection Indicator (Left)
            if isSelected {
                Rectangle()
                    .fill(indicatorColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(width: indicatorThickness)
            }
            
            if isIconTabItem {
                iconTabItemContent
                    .frame(minHeight: appearance.size.minHeight)
                    .padding(.leading, appearance.size.paddingStart)
                    .padding(.trailing, appearance.size.paddingEnd)
                    .opacity(isDisabled ? appearance.size.disableAlpha : 1.0)
            } else {
                // Standard TabItem Layout
                HStack(alignment: .center, spacing: 0) {
                    // Start Content (Icon)
                    if hasStartContent {
                        if !(startContent is EmptyView) {
                            startContent
                                .frame(width: appearance.size.startContentSize, height: appearance.size.startContentSize)
                                .foregroundStyle(contentColor(for: appearance.startContentColor))
                                .padding(.trailing, appearance.size.valuePadding)
                        }
                    }
                    
                    // Label
                    Text(label)
                        .foregroundStyle(contentColor(for: appearance.labelColor))
                        .typography(labelTypography)
                    
                    // Value
                    if let value = value {
                        Text(value)
                            .foregroundStyle(contentColor(for: appearance.valueColor))
                            .typography(valueTypography)
                            .padding(.leading, appearance.size.valuePadding)
                    }
                    
                    // Content Right (Counter або Custom View)
                    if hasContentRight {
                        if let counterValue = counterValue, let counterAppearance = appearance.counterAppearance {
                            SDDSCounter(
                                text: "\(counterValue)",
                                appearance: counterAppearance,
                                isAnimating: false,
                                isHighlighted: false,
                                isHovered: false,
                                isSelected: isSelected
                            )
                            .padding(.leading, appearance.size.counterPadding)
                        } else {
                            if !(contentRight is EmptyView) {
                                contentRight
                                    .frame(width: appearance.size.endContentSize, height: appearance.size.endContentSize)
                                    .padding(.leading, appearance.size.counterPadding)
                            }
                        }
                    } else {
                        EmptyView()
                    }
                    
                    // Action Content
                    if hasActionContent {
                        if !(actionContent is EmptyView) {
                            actionContent
                                .padding(.leading, appearance.size.actionPadding)
                        } else if let actionIcon = appearance.actionIcon {
                            actionIcon
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: appearance.size.actionIconSize, height: appearance.size.actionIconSize)
                                .foregroundStyle(actionContentColor(for: appearance.actionColor))
                                .padding(.leading, appearance.size.actionPadding)
                        }
                    } else {
                        EmptyView()
                    }
                }
                .frame(minHeight: appearance.size.minHeight)
                .padding(.leading, appearance.size.paddingStart)
                .padding(.trailing, appearance.size.paddingEnd)
                .opacity(isDisabled ? appearance.size.disableAlpha : 1.0)
            }
        }
    }
    
    private var appearance: TabItemAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var indicatorThickness: CGFloat {
        tabsEnvironmentAppearance.size.indicatorThickness
    }
    
    private var indicatorColor: ColorToken {
        appearance.indicatorColor ?? tabsEnvironmentAppearance.indicatorColor
    }
    
    private func contentColor(for buttonColor: ButtonColor) -> Color {
        if isDisabled {
            return buttonColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
        } else if isSelected {
            return buttonColor.selectedColor.color(for: colorScheme, subtheme: subtheme)
        } else {
            return buttonColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
        }
    }
    
    private func actionContentColor(for buttonColor: ButtonColor) -> Color {
        // actionColor не меняется в selected состоянии
        if isDisabled {
            return buttonColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
        } else {
            return buttonColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
        }
    }
    
    private var labelTypography: TypographyToken {
        appearance.labelTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var valueTypography: TypographyToken {
        appearance.valueTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var isIconTabItem: Bool {
        return label.isEmpty && value == nil
    }
    
    @ViewBuilder private var iconTabItemContent: some View {
        HStack(spacing: 0) {
            if hasStartContent {
                startContent
                    .frame(width: appearance.size.startContentSize, height: appearance.size.startContentSize)
                    .foregroundStyle(contentColor(for: appearance.startContentColor))
                    .overlay(alignment: .topTrailing) {
                        if let counterValue = counterValue, let counterAppearance = appearance.counterAppearance {
                            SDDSCounter(
                                text: "\(counterValue)",
                                appearance: counterAppearance,
                                isAnimating: false,
                                isHighlighted: false,
                                isHovered: false,
                                isSelected: isSelected
                            )
                            .offset(x: appearance.size.counterOffsetX, y: -appearance.size.counterOffsetY)
                        }
                    }
            }
            
            if hasActionContent {
                if let actionIcon = appearance.actionIcon {
                    actionIcon
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: appearance.size.actionIconSize, height: appearance.size.actionIconSize)
                        .foregroundStyle(actionContentColor(for: appearance.actionColor))
                        .padding(.leading, appearance.size.actionPadding)
                } else {
                    actionContent
                        .padding(.leading, appearance.size.actionPadding)
                }
            }
        }
    }
}

// MARK: - Convenience Initializers

extension SDDSTabItem where StartContent == EmptyView, ContentRight == EmptyView, ActionContent == EmptyView {
    public init(
        label: String,
        value: String? = nil,
        counterValue: Int? = nil,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        orientation: TabsOrientation = .horizontal,
        appearance: TabItemAppearance? = nil
    ) {
        self.init(
            label: label,
            value: value,
            counterValue: counterValue,
            isSelected: isSelected,
            isDisabled: isDisabled,
            orientation: orientation,
            appearance: appearance,
            startContent: { EmptyView() },
            contentRight: { EmptyView() },
            actionContent: { EmptyView() }
        )
    }
}

extension SDDSTabItem where ContentRight == EmptyView, ActionContent == EmptyView {
    public init(
        label: String,
        value: String? = nil,
        counterValue: Int? = nil,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        orientation: TabsOrientation = .horizontal,
        appearance: TabItemAppearance? = nil,
        @ViewBuilder startContent: () -> StartContent
    ) {
        self.init(
            label: label,
            value: value,
            counterValue: counterValue,
            isSelected: isSelected,
            isDisabled: isDisabled,
            orientation: orientation,
            appearance: appearance,
            startContent: startContent,
            contentRight: { EmptyView() },
            actionContent: { EmptyView() }
        )
    }
}

extension SDDSTabItem where ActionContent == EmptyView {
    public init(
        label: String,
        value: String? = nil,
        counterValue: Int? = nil,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        orientation: TabsOrientation = .horizontal,
        appearance: TabItemAppearance? = nil,
        @ViewBuilder startContent: () -> StartContent,
        @ViewBuilder contentRight: () -> ContentRight
    ) {
        self.init(
            label: label,
            value: value,
            counterValue: counterValue,
            isSelected: isSelected,
            isDisabled: isDisabled,
            orientation: orientation,
            appearance: appearance,
            startContent: startContent,
            contentRight: contentRight,
            actionContent: { EmptyView() }
        )
    }
}

// MARK: - IconTabItem Initializer

extension SDDSTabItem where StartContent == AnyView, ContentRight == EmptyView, ActionContent == EmptyView {
    /// Конструктор для IconTabItem - только иконка по центру с опциональным counter
    public init(
        icon: Image,
        counterValue: Int? = nil,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        orientation: TabsOrientation = .horizontal,
        appearance: TabItemAppearance? = nil
    ) {
        self.init(
            label: "",
            value: nil,
            counterValue: counterValue,
            isSelected: isSelected,
            isDisabled: isDisabled,
            orientation: orientation,
            appearance: appearance,
            startContent: {
                AnyView(
                    icon
                        .resizable()
                        .renderingMode(.template)
                )
            },
            contentRight: { EmptyView() },
            actionContent: { EmptyView() }
        )
    }
}
