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
 - Action (любая кастомная вьюшка, например LinkButton)
 - Опциональная кнопка закрытия
 
 # Example
 ```swift
 SDDSNote(
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
public struct SDDSNote<ContentBefore: View, Action: View>: View {
    @Environment(\.noteAppearance) private var appearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    private let title: String
    private let text: String?
    private let contentBefore: ContentBefore
    private let action: Action
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
            appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme)
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
        .tint(appearance.iconColor.color(for: colorScheme, subtheme: subtheme))
    }
    
    private var textContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleAndText
            
            if !isActionEmpty {
                actionView
                    .padding(.top, size.actionTopMargin)
            }
        }
    }
    
    private var titleAndText: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleView
            
            if let text = text {
                Text(text)
                    .foregroundColor(appearance.textColor.color(for: colorScheme, subtheme: subtheme))
                    .typography(textTypography)
                    .padding(.top, size.textTopMargin)
            }
        }
        .padding(.bottom, isActionEmpty ? size.actionTopMargin : 0)
        .alignmentGuide(.contentCenterGuide) { d in d[VerticalAlignment.center] }
    }
    
    private var titleView: some View {
        Text(title)
            .foregroundColor(appearance.titleColor.color(for: colorScheme, subtheme: subtheme))
            .typography(titleTypography)
            .padding(.trailing, shouldShowCloseButton ? size.titlePaddingEnd : 0)
            .alignmentGuide(.titleCenter) { d in d[VerticalAlignment.center] }
    }
    
    @ViewBuilder
    private var actionView: some View {
        action
            .applyIfLet(appearance.linkButtonAppearance) { view, linkButtonAppearance in
                view.environment(\.buttonAppearance, linkButtonAppearance)
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
                        .foregroundColor(appearance.closeColor.color(for: colorScheme, subtheme: subtheme))
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
}

// MARK: - Convenience Init without ContentBefore

extension SDDSNote where ContentBefore == EmptyView {
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

extension SDDSNote where Action == EmptyView {
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

extension SDDSNote where ContentBefore == EmptyView, Action == EmptyView {
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
