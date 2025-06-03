import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSCell` представляет собой компонент для отображения строки с различными типами контента и возможностью настройки выравнивания.

 - Parameters:
    - appearance: Параметры внешнего вида ячейки
    - alignment: Выравнивание контента (top/center/bottom)
    - label: Текст метки
    - title: Основной текст
    - subtitle: Дополнительный текст
    - disclosureEnabled: Включить отображение disclosure
    - disclosureImage: Изображение для disclosure
    - disclosureText: Текст для disclosure
    - leftContent: Контент слева
    - rightContent: Контент справа

 ## Окружение
 - cellAppearance: Стандартные настройки внешнего вида ячейки

 ## Примеры использования

 ```swift
 // Базовая ячейка
 SDDSCell(
     appearance: Cell.l.appearance,
     alignment: .center,
     label: "label",
     title: "title",
     subtitle: "subtitle",
     disclosureEnabled: true,
     disclosureImage: nil,
     disclosureText: "disclosure",
     leftContent: {
         MyView()
     },
     rightContent: {
        MyView()
    }
 )
 ```
 */
public struct SDDSCell<LeftContent: View, RightContent: View>: View {
    private let _appearance: CellAppearance?
    public let alignment: CellContentAlignment
    
    public let label: String
    public let title: String
    public let subtitle: String
    
    public let disclosureEnabled: Bool
    public let disclosureImage: Image?
    public let disclosureText: String
    
    public let leftContent: LeftContent
    public let rightContent: RightContent
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.cellAppearance) private var environmentAppearance
    
    public init(
        appearance: CellAppearance? = nil,
        alignment: CellContentAlignment = .center,
        label: String = "",
        title: String = "",
        subtitle: String = "",
        disclosureEnabled: Bool = false,
        disclosureImage: Image? = nil,
        disclosureText: String = "",
        @ViewBuilder leftContent: @escaping () -> LeftContent,
        @ViewBuilder rightContent: @escaping () -> RightContent
    ) {
        self._appearance = appearance
        self.alignment = alignment
        self.label = label
        self.title = title
        self.subtitle = subtitle
        self.disclosureEnabled = disclosureEnabled
        self.disclosureImage = disclosureImage
        self.disclosureText = disclosureText
        self.leftContent = leftContent()
        self.rightContent = rightContent()
    }
    
    public var body: some View {
        HStack(alignment: contentAlignment, spacing: 0) {
            leftContent
                .environment(cellAppearance: appearance)
            centerView
                .padding(.leading, appearance.size.contentPaddingStart)
                .padding(.trailing, appearance.size.contentPaddingEnd)
            rightContent
                .environment(cellAppearance: appearance)
            disclosure
        }
    }
}

extension SDDSCell {
    @ViewBuilder
    private var centerView: some View {
            VStack(spacing: 0) {
                if !label.isEmpty {
                    HStack {
                        value(for: label, typography: typographyToken(for: appearance.labelTypography), textColor: appearance.labelColor)
                        Spacer()
                    }
                }
                if !title.isEmpty {
                    HStack {
                        value(for: title, typography: typographyToken(for: appearance.titleTypography), textColor: appearance.titleColor)
                        Spacer()
                    }
                }
                if !subtitle.isEmpty {
                    HStack {
                        value(for: subtitle, typography: typographyToken(for: appearance.subtitleTypography), textColor: appearance.subtitleColor)
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
    }
    
    // MARK: - Other additional view
    @ViewBuilder
    private func value(for value: String, typography: TypographyToken, textColor: ColorToken) -> some View {
        Text(value)
            .typography(typography)
            .foregroundColor(textColor.color(for: colorScheme))
    }
    
    // MARK: - Disclosure
    @ViewBuilder
    private var disclosure: some View {
        if disclosureEnabled {
            defaultDisclosure
        } else if let disclosureImage = disclosureImage {
            value(for: disclosureText, typography: typographyToken(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
                .fixedSize()
            disclosureImage
        }
    }
    
    @ViewBuilder
    private var defaultDisclosure: some View {
        HStack(spacing: 0) {
            value(for: disclosureText, typography: typographyToken(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
                .fixedSize()
            ZStack {
                if let image = appearance.disclosureImage {
                    image
                        .renderingMode(.template)
                        .foregroundColor(appearance.disclosureImageColor.color(for: colorScheme))
                }
            }
        }
    }
    
    // MARK: - Typography
    private func typographyToken(for text: TypographyConfiguration) -> TypographyToken {
        if let typography = text.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Cell Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    // MARK: - Alignment
    private var contentAlignment: VerticalAlignment {
        switch alignment {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        }
    }
    
    var appearance: CellAppearance {
        _appearance ?? environmentAppearance
    }
}
