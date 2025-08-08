import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `SDDSSegmentItem` представляет собой элемент сегмента, который может содержать заголовок, подзаголовок, иконку и счетчик.

 - Parameters:
    - id: Уникальный идентификатор элемента
    - title: Заголовок элемента
    - subtitle: Подзаголовок элемента
    - iconAttributes: Атрибуты иконки (опционально)
    - isDisabled: Флаг отключения элемента
    - isSelected: Флаг выбранного состояния
    - strech: Флаг растягивания элемента
    - counterEnabled: Флаг отображения счетчика
    - appearance: Параметры внешнего вида элемента (опционально)
    - accessibility: Параметры доступности
    - counterViewProvider: Провайдер представления счетчика
    - action: Действие при нажатии

 ## Окружение
 - `segmentItemAppearance`: Стандартные настройки внешнего вида элемента сегмента

 ## Примеры использования

 ```swift
 // Базовый элемент сегмента
 SDDSSegmentItem(
     title: "Title",
     subtitle: "Subtitle",
     iconAttributes: nil,
     isSelected: true,
     appearance: SegmentItem.l.secondary.appearance
 )

 // Элемент с иконкой и счетчиком
 SDDSSegmentItem(
     title: "Title",
     subtitle: "",
     iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
     isSelected: true,
     counterEnabled: true,
     appearance: SegmentItem.l.accent.appearance,
     counterViewProvider: .default(text: "5")
 )
 ```
 */
public struct SDDSSegmentItem<Counter: View>: View {
    public let id: UUID
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isSelected: Bool
    public let strech: Bool
    public let counterEnabled: Bool
    private let _appearance: SegmentItemAppearance?
    public let accessibility: SegmentItemAccessibility
    public let counterText: String
    public let counter: Counter
    public let counterWidthCalculator: CounterWidthCalculator?
    public var action: () -> Void
    
    @Environment(\.segmentItemAppearance) private var environmentAppearance
    
    public init(item: SDDSSegmentItemData<Counter>) {
        self.id = item.id
        self.title = item.title
        self.subtitle = item.subtitle
        self.iconAttributes = item.iconAttributes
        self.isSelected = item.isSelected
        self.isDisabled = item.isDisabled
        self.strech = item.stretch
        self.counterEnabled = item.counterEnabled
        self._appearance = item.appearance
        self.accessibility = item.accessibility
        self.counterText = item.counterText
        self.counterWidthCalculator = item.counterWidthCalculator
        self.counter = item.counter
        self.action = item.action
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes?,
        isDisabled: Bool = false,
        isSelected: Bool,
        strech: Bool = false,
        counterEnabled: Bool = false,
        appearance: SegmentItemAppearance? = nil,
        accessibility: SegmentItemAccessibility = SegmentItemAccessibility(),
        counterText: String = "",
        @ViewBuilder counter: () -> Counter = { EmptyView() },
        counterWidthCalculator: CounterWidthCalculator? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isSelected = isSelected
        self.strech = strech
        self.counterEnabled = counterEnabled
        self._appearance = appearance
        self.accessibility = accessibility
        self.counterText = counterText
        self.counter = counter()
        self.counterWidthCalculator = counterWidthCalculator
        self.action = action
    }
    
    public var body: some View {
        SDDSButton(
            title: title,
            subtitle: hasSubtitle ? subtitle : "",
            iconAttributes: hasIconAttributes ? iconAttributes : nil,
            isDisabled: isDisabled,
            isLoading: false,
            spinnerImage: nil,
            buttonStyle: .basic,
            appearance: buttonAppearance,
            layoutMode: strech ? .fixedWidth(.packed) : .wrapContent,
            counter: { counterView },
            isSelected: isSelected,
            action: action
        )
    }
    
    private var buttonAppearance: ButtonAppearance {
        .init(
            size: buttonSize,
            shapeStyle: appearance.shapeStyle,
            titleTypography: OneSizeTypography<ButtonSizeConfiguration>(token: appearance.titleTypography.typography(with: appearance.size)).asContainer,
            titleColor: appearance.titleColor,
            subtitleTypography: OneSizeTypography<ButtonSizeConfiguration>(token: appearance.subtitleTypography.typography(with: appearance.size)).asContainer,
            subtitleColor: appearance.subtitleColor,
            iconColor: iconAttributes?.alignment == .leading ? appearance.startContentColor : appearance.endContentColor,
            backgroundColor: appearance.backgroundColor,
            disabledAlpha: appearance.disabledAlpha
        )
    }
    
    private var buttonSize: ButtonSizeConfiguration {
        var size = DefaultButtonSize()
        size.height = appearance.size.height
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: appearance.size.cornerRadius)
        size.iconSize = iconAttributes?.alignment == .leading ? appearance.size.startContentSize : appearance.size.endContentSize
        size.counterSize = appearance.counterAppearance.size
        size.iconHorizontalGap = appearance.size.iconHorizontalGap
        size.titleHorizontalGap = appearance.size.titleHorizontalGap
        size.paddings = appearance.size.paddings
        return size
    }
}

extension SDDSSegmentItem {
    private var hasIconAttributes: Bool {
        iconAttributes != nil
    }
    
    private var hasSubtitle: Bool {
        !subtitle.isEmpty
    }
    
    @ViewBuilder
    private var counterView: some View {
        if counterEnabled {
            if !counterText.isEmpty {
                SDDSCounter(
                    text: counterText,
                    appearance: appearance.counterAppearance,
                    isAnimating: false,
                    isHighlighted: false,
                    isHovered: false,
                    isSelected: isSelected
                )
                .padding(.leading, appearance.size.iconHorizontalGap)
            } else {
                counter
            }
        } else {
            EmptyView()
        }
    }
    
    var appearance: SegmentItemAppearance {
        _appearance ?? environmentAppearance
    }
}
