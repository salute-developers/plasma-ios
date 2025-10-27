import SwiftUI
@_exported import SDDSThemeCore

// MARK: - Custom Alignment

extension VerticalAlignment {
    struct NoteTitleCenterAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    static let titleCenter = VerticalAlignment(NoteTitleCenterAlignment.self)
    
    struct NoteContentCenterAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    static let contentCenterGuide = VerticalAlignment(NoteContentCenterAlignment.self)
}

/**
 `SDDSNote` - компонент для отображения информационных сообщений с возможностью кастомизации контента.
 
 Компонент представляет собой VStack с:
 - Опциональным ContentBefore (иконка или другой контент слева или сверху)
 - Title и Text
 - LinkButton для действий
 - Опциональная кнопка закрытия
 
 # Example
 ```swift
 SDDSNote(
     title: "Заголовок",
     text: "Описание",
     linkButtonTitle: "Действие",
     onLinkButtonTap: { print("Link tapped") }
 ) {
     Image(systemName: "info.circle")
 }
 ```
 */
public struct SDDSNote<ContentBefore: View>: View {
    @Environment(\.noteAppearance) private var appearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let title: String
    private let text: String?
    private let linkButtonTitle: String?
    private let linkButtonIcon: Image?
    private let contentBefore: ContentBefore
    private let onLinkButtonTap: (() -> Void)?
    private let onClose: (() -> Void)?
    
    private var size: NoteSizeConfiguration {
        appearance.size
    }
    
    private var isContentBeforeEmpty: Bool {
        ContentBefore.self == EmptyView.self
    }
    
    private var shouldShowContentBefore: Bool {
        !isContentBeforeEmpty
    }
    
    private var shouldShowCloseButton: Bool {
        size.closeSize > 0 && onClose != nil
    }
    
    /**
     Инициализатор с ContentBefore
     
     - Parameters:
       - title: Заголовок сообщения
       - text: Текст сообщения (опционально)
       - linkButtonTitle: Текст для кнопки-ссылки (опционально)
       - linkButtonIcon: Иконка для кнопки-ссылки (опционально)
       - onLinkButtonTap: Действие при нажатии на кнопку-ссылку
       - onClose: Действие при нажатии на кнопку закрытия
       - contentBefore: Контент перед основным содержимым (обычно иконка)
     */
    public init(
        title: String,
        text: String? = nil,
        linkButtonTitle: String? = nil,
        linkButtonIcon: Image? = nil,
        onLinkButtonTap: (() -> Void)? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder contentBefore: () -> ContentBefore
    ) {
        self.title = title
        self.text = text
        self.linkButtonTitle = linkButtonTitle
        self.linkButtonIcon = linkButtonIcon
        self.contentBefore = contentBefore()
        self.onLinkButtonTap = onLinkButtonTap
        self.onClose = onClose
    }
    
    public var body: some View {
        ZStack(alignment: .topTrailing) {
            mainContent
                .padding(.leading, size.paddingStart)
                .padding(.top, size.paddingTop)
                .padding(.trailing, size.paddingEnd)
                .padding(.bottom, size.paddingBottom)
            
            if shouldShowCloseButton {
                closeButton
            }
        }
        .background(
            appearance.backgroundColor.color(for: colorScheme)
                .shape(pathDrawer: size.shape)
        )
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if shouldShowContentBefore {
            switch size.contentBeforeArrangement {
            case .center:
                HStack(alignment: .contentCenterGuide, spacing: size.contentBeforeEndMargin) {
                    contentBeforeView
                        .alignmentGuide(.contentCenterGuide) { d in d[VerticalAlignment.center] }
                    textContent
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            case .top:
                HStack(alignment: .titleCenter, spacing: size.contentBeforeEndMargin) {
                    contentBeforeView
                        .alignmentGuide(.titleCenter) { d in d[VerticalAlignment.center] }
                    textContent
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        } else {
            textContent
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private var contentBeforeView: some View {
        Group {
            if size.iconSize > 0 {
                contentBefore
                    .frame(width: size.iconSize, height: size.iconSize)
            } else {
                contentBefore
            }
        }
        .tint(appearance.iconColor.color(for: colorScheme))
    }
    
    private var textContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleAndText
            
            if linkButtonTitle != nil {
                linkButtonView
                    .padding(.top, size.actionTopMargin)
            }
        }
    }
    
    private var titleAndText: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleView
            
            if let text = text {
                Text(text)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundColor(appearance.textColor.color(for: colorScheme))
                    .typography(textTypography)
                    .padding(.top, size.textTopMargin)
            }
        }
        .alignmentGuide(.contentCenterGuide) { d in d[VerticalAlignment.center] }
    }
    
    private var titleView: some View {
        Text(title)
            .lineLimit(1)
            .truncationMode(.tail)
            .foregroundColor(appearance.titleColor.color(for: colorScheme))
            .typography(titleTypography)
            .padding(.trailing, shouldShowCloseButton ? size.titlePaddingEnd : 0)
            .alignmentGuide(.titleCenter) { d in d[VerticalAlignment.center] }
    }
    
    @ViewBuilder
    private var linkButtonView: some View {
        if let linkButtonTitle = linkButtonTitle, let linkButtonAppearance = appearance.linkButtonAppearance {
            LinkButton(
                title: linkButtonTitle,
                iconAttributes: linkButtonIconAttributes,
                appearance: linkButtonAppearance,
                action: {
                    onLinkButtonTap?()
                }
            )
        }
    }
    
    @ViewBuilder
    private var closeButton: some View {
        if let closeIcon = appearance.closeIcon {
            Button(
                action: {
                    onClose?()
                },
                label: {
                    closeIcon
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: size.closeSize, height: size.closeSize)
                        .foregroundColor(appearance.closeColor.color(for: colorScheme))
                }
            )
            .padding(.top, size.closeTopMargin)
            .padding(.trailing, size.closeEndMargin)
        }
    }
    
    // MARK: - Computed Properties
    
    private var titleTypography: TypographyToken {
        appearance.titleTypography.typography(with: size) ?? .undefined
    }
    
    private var textTypography: TypographyToken {
        appearance.textTypography.typography(with: size) ?? .undefined
    }
    
    private var linkButtonIconAttributes: ButtonIconAttributes? {
        linkButtonIcon.map { icon in
            ButtonIconAttributes(image: icon, alignment: .trailing)
        }
    }
}

// MARK: - Convenience Init without ContentBefore

extension SDDSNote where ContentBefore == EmptyView {
    /**
     Инициализатор без ContentBefore
     
     - Parameters:
       - title: Заголовок сообщения
       - text: Текст сообщения (опционально)
       - linkButtonTitle: Текст для кнопки-ссылки (опционально)
       - linkButtonIcon: Иконка для кнопки-ссылки (опционально)
       - onLinkButtonTap: Действие при нажатии на кнопку-ссылку
       - onClose: Действие при нажатии на кнопку закрытия
     */
    public init(
        title: String,
        text: String? = nil,
        linkButtonTitle: String? = nil,
        linkButtonIcon: Image? = nil,
        onLinkButtonTap: (() -> Void)? = nil,
        onClose: (() -> Void)? = nil
    ) {
        self.title = title
        self.text = text
        self.linkButtonTitle = linkButtonTitle
        self.linkButtonIcon = linkButtonIcon
        self.contentBefore = EmptyView()
        self.onLinkButtonTap = onLinkButtonTap
        self.onClose = onClose
    }
}
