import SwiftUI
@_exported import SDDSThemeCore

// MARK: - Custom Alignment

extension VerticalAlignment {
    private struct TitleAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    static let titleAlignment = VerticalAlignment(TitleAlignment.self)
}

/**
 `SDDSNoteCompact` - компактная версия компонента Note с горизонтальным layout'ом.
 
 Компонент представляет собой HStack со всеми элементами в одну линию:
 - ContentBefore (иконка)
 - Title и Text
 - LinkButton справа
 - Close Button справа от LinkButton
 
 # Example
 ```swift
 SDDSNoteCompact(
     title: "Заголовок",
     text: "Описание",
     linkButtonTitle: "Действие",
     onLinkButtonTap: { print("Link tapped") }
 ) {
     Image(systemName: "info.circle")
 }
 ```
 */
public struct SDDSNoteCompact<ContentBefore: View>: View {
    @Environment(\.noteCompactAppearance) private var appearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let title: String
    private let text: String?
    private let linkButtonTitle: String?
    private let linkButtonIcon: Image?
    private let contentBefore: ContentBefore
    private let onLinkButtonTap: (() -> Void)?
    private let onClose: (() -> Void)?
    
    private var size: NoteCompactSizeConfiguration {
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
        HStack(alignment: verticalAlignment, spacing: 0) {
            if shouldShowContentBefore {
                contentBeforeView
                
                Spacer()
                    .frame(width: size.contentBeforeEndMargin)
            }
            
            textContent
            
            Spacer()
            
            if linkButtonTitle != nil {
                Spacer()
                    .frame(width: size.actionStartMargin)
                
                linkButtonView
                
                if size.actionEndMargin > 0 {
                    Spacer()
                        .frame(width: size.actionEndMargin)
                }
            }
            
            if shouldShowCloseButton {
                if size.closeStartMargin > 0 {
                    Spacer()
                        .frame(width: size.closeStartMargin)
                }
                
                closeButton
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, size.paddingStart)
        .padding(.top, size.paddingTop)
        .padding(.trailing, size.paddingEnd)
        .padding(.bottom, size.paddingBottom)
        .background(
            appearance.backgroundColor.color(for: colorScheme)
                .shape(pathDrawer: size.shape)
        )
    }
    
    private var verticalAlignment: VerticalAlignment {
        size.contentBeforeArrangement == .top ? .titleAlignment : .center
    }
    
    @ViewBuilder
    private var contentBeforeView: some View {
        Group {
            if size.iconSize > 0 {
                contentBefore
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundColor(appearance.iconColor.color(for: colorScheme))
            } else {
                contentBefore
                    .foregroundColor(appearance.iconColor.color(for: colorScheme))
            }
        }
        .alignmentGuide(.titleAlignment) { d in d[VerticalAlignment.center] }
    }
    
    private var textContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .lineLimit(1)
                .truncationMode(.tail)
                .foregroundColor(appearance.titleColor.color(for: colorScheme))
                .typography(titleTypography)
                .alignmentGuide(.titleAlignment) { d in d[VerticalAlignment.center] }
            
            if let text = text {
                Text(text)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundColor(appearance.textColor.color(for: colorScheme))
                    .typography(textTypography)
                    .padding(.top, size.textTopMargin)
            }
        }
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
            .alignmentGuide(.titleAlignment) { d in d[VerticalAlignment.center] }
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
                        .resizable()
                        .frame(width: size.closeSize, height: size.closeSize)
                        .foregroundColor(appearance.closeColor.color(for: colorScheme))
                }
            )
            .alignmentGuide(.titleAlignment) { d in d[VerticalAlignment.center] }
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

extension SDDSNoteCompact where ContentBefore == EmptyView {
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
