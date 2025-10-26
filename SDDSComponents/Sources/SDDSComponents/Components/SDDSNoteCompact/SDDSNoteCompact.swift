import SwiftUI
@_exported import SDDSThemeCore

// MARK: - Custom Alignment

extension VerticalAlignment {
    struct NoteCompactTitleAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    static let compactTitleAlignment = VerticalAlignment(NoteCompactTitleAlignment.self)
    
    struct NoteCompactContentCenterAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }
    
    static let compactContentCenterGuide = VerticalAlignment(NoteCompactContentCenterAlignment.self)
}

/**
 `SDDSNoteCompact` - компактная версия компонента Note с горизонтальным layout'ом.
 
 Компонент представляет собой HStack со всеми элементами в одну линию:
 - ContentBefore (иконка)
 - Title и Text
 - Action (любая кастомная вьюшка, например LinkButton)
 - Close Button справа
 
 # Example
 ```swift
 SDDSNoteCompact(
     title: "Заголовок",
     text: "Описание",
     onClose: { print("Close tapped") }
 ) {
     Image(systemName: "info.circle")
 } action: {
     LinkButton(title: "Действие", appearance: appearance) {
         print("Action tapped")
     }
 }
 ```
 */
public struct SDDSNoteCompact<ContentBefore: View, Action: View>: View {
    @Environment(\.noteCompactAppearance) private var appearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let title: String
    private let text: String?
    private let contentBefore: ContentBefore
    private let action: Action
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
    
    private var isActionEmpty: Bool {
        Action.self == EmptyView.self
    }
    
    /**
     Инициализатор с ContentBefore и Action
     
     - Parameters:
       - title: Заголовок сообщения
       - text: Текст сообщения (опционально)
       - onClose: Действие при нажатии на кнопку закрытия
       - contentBefore: Контент перед основным содержимым (обычно иконка)
       - action: Кастомная вьюшка действия (например, LinkButton)
     */
    public init(
        title: String,
        text: String? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder contentBefore: () -> ContentBefore,
        @ViewBuilder action: () -> Action
    ) {
        self.title = title
        self.text = text
        self.contentBefore = contentBefore()
        self.action = action()
        self.onClose = onClose
    }
    
    public var body: some View {
        HStack(alignment: .compactTitleAlignment, spacing: 0) {
            if shouldShowContentBefore {
                contentBeforeView
                
                Spacer()
                    .frame(width: size.contentBeforeEndMargin)
            }
            
            textContent
            
            Spacer()
            
            if !isActionEmpty {
                Spacer()
                    .frame(width: size.actionStartMargin)
                
                actionView
                
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
        .alignmentGuide(.compactTitleAlignment) { d in d[VerticalAlignment.center] }
    }
    
    private var textContent: some View {
        titleAndText
            .alignmentGuide(.compactTitleAlignment) { d in
                d[VerticalAlignment.top] + titleLineHeight / 2
            }
    }
    
    private var titleAndText: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(appearance.titleColor.color(for: colorScheme))
                .typography(titleTypography)
            
            if let text = text {
                Text(text)
                    .foregroundColor(appearance.textColor.color(for: colorScheme))
                    .typography(textTypography)
                    .padding(.top, size.textTopMargin)
            }
        }
    }
    
    @ViewBuilder
    private var actionView: some View {
        action
            .applyIfLet(appearance.linkButtonAppearance) { view, linkButtonAppearance in
                view.environment(\.buttonAppearance, linkButtonAppearance)
            }
            .alignmentGuide(.compactTitleAlignment) { d in d[VerticalAlignment.center] }
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
            .alignmentGuide(.compactTitleAlignment) { d in d[VerticalAlignment.center] }
        }
    }
    
    // MARK: - Computed Properties
    
    private var titleTypography: TypographyToken {
        appearance.titleTypography.typography(with: size) ?? .undefined
    }
    
    private var textTypography: TypographyToken {
        appearance.textTypography.typography(with: size) ?? .undefined
    }

    private var titleLineHeight: CGFloat {
        titleTypography.lineHeight
    }
}

// MARK: - Convenience Init without ContentBefore

extension SDDSNoteCompact where ContentBefore == EmptyView {
    /**
     Инициализатор без ContentBefore
     
     - Parameters:
       - title: Заголовок сообщения
       - text: Текст сообщения (опционально)
       - onClose: Действие при нажатии на кнопку закрытия
       - action: Кастомная вьюшка действия (например, LinkButton)
     */
    public init(
        title: String,
        text: String? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder action: () -> Action
    ) {
        self.title = title
        self.text = text
        self.contentBefore = EmptyView()
        self.action = action()
        self.onClose = onClose
    }
}

// MARK: - Convenience Init without Action

extension SDDSNoteCompact where Action == EmptyView {
    /**
     Инициализатор без Action
     
     - Parameters:
       - title: Заголовок сообщения
       - text: Текст сообщения (опционально)
       - onClose: Действие при нажатии на кнопку закрытия
       - contentBefore: Контент перед основным содержимым (обычно иконка)
     */
    public init(
        title: String,
        text: String? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder contentBefore: () -> ContentBefore
    ) {
        self.title = title
        self.text = text
        self.contentBefore = contentBefore()
        self.action = EmptyView()
        self.onClose = onClose
    }
}

// MARK: - Convenience Init without ContentBefore and Action

extension SDDSNoteCompact where ContentBefore == EmptyView, Action == EmptyView {
    /**
     Инициализатор без ContentBefore и Action
     
     - Parameters:
       - title: Заголовок сообщения
       - text: Текст сообщения (опционально)
       - onClose: Действие при нажатии на кнопку закрытия
     */
    public init(
        title: String,
        text: String? = nil,
        onClose: (() -> Void)? = nil
    ) {
        self.title = title
        self.text = text
        self.contentBefore = EmptyView()
        self.action = EmptyView()
        self.onClose = onClose
    }
}
