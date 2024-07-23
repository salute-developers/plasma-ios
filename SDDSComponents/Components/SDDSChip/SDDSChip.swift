import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ChipBorderStyle` определяет стиль границы для чипа.
 
 - `default`: Стиль по умолчанию с заданным радиусом скругления.
 - `rounded`: Закругленный стиль с максимальным радиусом скругления.
 */
public enum ChipBorderStyle {
    case `default`(_ cornerRadius: CGFloat)
    case rounded
}

/**
 `ChipSizeConfiguration` определяет конфигурацию размеров для чипа.
 
 - Properties:
    - iconImageSize: Размер изображения иконки.
    - buttonImageSize: Размер изображения кнопки.
    - leadingInset: Внутренний отступ слева.
    - trailingInset: Внутренний отступ справа.
    - spacing: Расстояние между элементами.
    - borderStyle: Стиль границы чипа.
    - height: Высота чипа.
 */
public protocol ChipSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var iconImageSize: CGSize? { get }
    var buttonImageSize: CGSize? { get }
    var leadingInset: CGFloat { get }
    var trailingInset: CGFloat { get }
    var spacing: CGFloat { get }
    var borderStyle: ChipBorderStyle { get }
    var height: CGFloat { get }
}

/**
 `ChipAccessibility` определяет параметры доступности для чипа.
 
 - Properties:
    - titleLabel: Метка доступности для заголовка.
    - removeButtonLabel: Метка доступности для кнопки удаления.
    - removeButtonHint: Подсказка для кнопки удаления.
 */
public struct ChipAccessibility {
    public var titleLabel: String
    public var removeButtonLabel: String
    public var removeButtonHint: String
    
    public init(
        titleLabel: String = "Chip Label",
        removeButtonLabel: String = "Remove",
        removeButtonHint: String = "Double-tap to remove the chip."
    ) {
        self.titleLabel = titleLabel
        self.removeButtonLabel = removeButtonLabel
        self.removeButtonHint = removeButtonHint
    }
}

/**
 `SDDSChip` представляет собой настраиваемый чип, который может быть настроен с помощью различных параметров.
 
 - Parameters:
    - title: Текст заголовка для чипа.
    - isEnabled: Флаг, указывающий, включен ли чип.
    - iconImage: Изображение иконки для чипа.
    - buttonImage: Изображение кнопки для чипа.
    - appearance: Параметры внешнего вида чипа.
    - size: Конфигурация размеров для чипа.
    - accessibility: Параметры доступности для чипа.
    - removeAction: Действие при нажатии на кнопку удаления.
 */
public struct SDDSChip: View {
    let title: String
    let isEnabled: Bool
    let iconImage: Image?
    let buttonImage: Image?
    let appearance: ChipAppearance
    let size: ChipSizeConfiguration
    let accessibility: ChipAccessibility
    let removeAction: () -> Void
    
    @Environment(\.colorScheme) var colorScheme

    /**
     Инициализатор для создания чипа с заданными параметрами.
     
     - Parameters:
        - title: Текст заголовка для чипа.
        - isEnabled: Флаг, указывающий, включен ли чип.
        - iconImage: Изображение иконки для чипа (по умолчанию nil).
        - buttonImage: Изображение кнопки для чипа (по умолчанию nil).
        - appearance: Параметры внешнего вида чипа.
        - size: Конфигурация размеров для чипа.
        - accessibility: Параметры доступности для чипа (по умолчанию `ChipAccessibility`).
        - removeAction: Действие при нажатии на кнопку удаления.
     */
    public init(title: String, isEnabled: Bool, iconImage: Image? = nil, buttonImage: Image? = nil, appearance: ChipAppearance, size: ChipSizeConfiguration, accessibility: ChipAccessibility = ChipAccessibility(), removeAction: @escaping () -> Void) {
        self.title = title
        self.isEnabled = isEnabled
        self.iconImage = iconImage
        self.buttonImage = buttonImage
        self.appearance = appearance
        self.size = size
        self.accessibility = accessibility
        self.removeAction = removeAction
    }
    
    /**
     Инициализатор для создания чипа на основе данных структуры `ChipData`.
     
     - Parameters:
        - data: Структура `ChipData`, содержащая все параметры для создания чипа.
     */
    public init(data: ChipData) {
        self.title = data.title
        self.isEnabled = data.isEnabled
        self.iconImage = data.iconImage
        self.buttonImage = data.buttonImage
        self.appearance = data.appearance
        self.size = data.size
        self.accessibility = data.accessibility
        self.removeAction = data.removeAction
    }
    
    public var body: some View {
        HStack(spacing: size.spacing) {
            Spacer()
                .frame(width: size.leadingInset)
            if let iconImage = iconImage, let iconImageSize = size.iconImageSize {
                iconImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconImageSize.width, height: iconImageSize.height)
                    .foregroundColor(appearance.imageTintColor.color(for: colorScheme))
                    .accessibilityHidden(true)
            }
            
            Text(title)
                .typography(appearance.titleTypography)
                .foregroundColor(appearance.titleColor.color(for: colorScheme))
                .accessibilityLabel(Text(accessibility.titleLabel))
                .accessibilityValue(Text(title))
            
            if let buttonImageSize = size.buttonImageSize, let buttonImage = buttonImage {
                Button(action: removeAction) {
                    buttonImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: buttonImageSize.width, height: buttonImageSize.height)
                        .foregroundColor(appearance.buttonTintColor.color(for: colorScheme))
                        .accessibilityLabel(Text(accessibility.removeButtonLabel))
                        .accessibilityHint(Text(accessibility.removeButtonHint))
                        .accessibilityAddTraits(.isButton)
                }
            }
            Spacer()
                .frame(width: size.trailingInset)
        }
        .onTapGesture {
            removeAction()
        }
        .frame(height: size.height)
        .background(
            RoundedRectangle(cornerRadius: borderRadius)
                .fill(Color.black)
                .opacity(isEnabled ? 1.0 : appearance.disabledAlpha)
        )
        .disabled(!isEnabled)
        .accessibilityElement(children: .combine)
    }
    
    private var borderRadius: CGFloat {
        switch size.borderStyle {
        case .default(let cornerRadius):
            return cornerRadius
        case .rounded:
            return size.height / 2
        }
    }
}


// MARK: - Preview
struct SDDSChipPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSChip.defaultExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default")
                .padding()
                .debug()
            
            SDDSChip.defaultBorderExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Default Border")
                .padding()
                .debug()
            
            SDDSChip.noButtonImageExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("No Button Image")
                .padding()
                .debug()
            
            SDDSChip.noIconImageExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("No Icon Image")
                .padding()
                .debug()
            
            SDDSChip.onlyTitleExample
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Only Title")
                .padding()
                .debug()
        }
    }
}

public struct DefaultChipSize: ChipSizeConfiguration {
    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var iconImageSize: CGSize? {
        CGSize(width: 24, height: 24)
    }
    
    public var buttonImageSize: CGSize? {
        CGSize(width: 24, height: 24)
    }
    
    public var leadingInset: CGFloat {
        12
    }
    
    public var trailingInset: CGFloat {
        12
    }
    
    public var spacing: CGFloat {
        8
    }
    
    public var height: CGFloat {
        48
    }
    
    public var borderStyle: ChipBorderStyle
    
    public init(borderStyle: ChipBorderStyle = .rounded) {
        self.borderStyle = borderStyle
    }
}

extension SDDSChip {
    static var defaultExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: Image.image("chipClose"),
            appearance: .defaultAppearance,
            size: DefaultChipSize(),
            removeAction: {}
        )
    }
    
    static var defaultBorderExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: Image.image("chipClose"),
            appearance: .defaultAppearance,
            size: DefaultChipSize(borderStyle: .default(12)),
            removeAction: {}
        )
    }
    
    static var noButtonImageExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: Image.image("chipIcon"),
            buttonImage: nil,
            appearance: .defaultAppearance,
            size: DefaultChipSize(),
            removeAction: {}
        )
    }
    
    static var noIconImageExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: Image.image("chipClose"),
            appearance: .defaultAppearance,
            size: DefaultChipSize(),
            removeAction: {}
        )
    }
    
    static var onlyTitleExample: SDDSChip {
        SDDSChip(
            title: "Label",
            isEnabled: true,
            iconImage: nil,
            buttonImage: nil,
            appearance: .defaultAppearance,
            size: DefaultChipSize(),
            removeAction: {}
        )
    }
}

extension ChipAppearance {
    static var defaultAppearance: ChipAppearance {
        .init(
            titleColor: Color.white.equalToken,
            titleTypography: .semibold14,
            imageTintColor: Color.white.equalToken,
            buttonTintColor: Color.gray.equalToken,
            disabledAlpha: 0.5
        )
    }
}
