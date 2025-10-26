import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSNavigationBar` - компонент навигационной панели с поддержкой двух типов страниц.
 
 Поддерживает два типа:
 - **MainPage**: главная страница приложения
 - **InternalPage**: внутренняя страница с кнопкой "назад"
 
 - Parameters:
    - type: Тип навигационной панели (`.mainPage` или `.internalPage`) с соответствующим appearance
    - title: Заголовок навигационной панели
    - icon: Опциональная иконка рядом с заголовком
    - textPlacement: Размещение текста (`.bottom` или `.inline`)
    - textAlign: Выравнивание текста (`.center`, `.left` или `.right`)
    - contentPlacement: Размещение контента (`.bottom` или `.inline`)
    - backAction: Опциональное действие при нажатии на кнопку "назад" (только для InternalPage)
    - actionStart: Левый action (closure, возвращающий View)
    - actionEnd: Правый action (closure, возвращающий View)
    - content: Дополнительный контент (closure, возвращающий View)
 
 ## Окружение
 
 - `navigationBarMainPageAppearance`: Настройки внешнего вида для главной страницы
 - `navigationBarInternalPageAppearance`: Настройки внешнего вида для внутренней страницы
 
 ## Пример использования
 
 ### Main Page
 ```swift
 SDDSNavigationBar(
     type: .mainPage(appearance: mainPageAppearance),
     title: "Главная",
     textPlacement: .bottom,
     textAlign: .center,
     contentPlacement: .bottom,
     actionStart: {
         Button(action: {}) {
             Image(systemName: "line.horizontal.3")
         }
     },
     actionEnd: {
         Button(action: {}) {
             Image(systemName: "person.circle")
         }
     }
 ) {
     Text("Контент")
 }
 ```
 
 ### Internal Page с кнопкой "назад"
 ```swift
 SDDSNavigationBar(
     type: .internalPage(appearance: internalPageAppearance),
     title: "Детали",
     textPlacement: .inline,
     textAlign: .left,
     contentPlacement: .inline,
     backAction: {
         // Действие при нажатии на "назад"
         navigationController.popViewController()
     },
     actionEnd: {
         Button(action: {}) {
             Image(systemName: "ellipsis")
         }
     }
 ) {
     Text("Дополнительный контент")
 }
 ```
 */
public struct SDDSNavigationBar<ActionStart: View, ActionEnd: View, Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    private let type: NavigationBarType
    private let title: String
    private let icon: Image?
    private let textPlacement: NavigationBarTextPlacement
    private let textAlign: NavigationBarTextAlign
    private let contentPlacement: NavigationBarContentPlacement
    private let actionStart: () -> ActionStart
    private let actionEnd: () -> ActionEnd
    private let content: () -> Content
    private let backAction: (() -> Void)?
    
    public init(
        type: NavigationBarType,
        title: String,
        icon: Image? = nil,
        textPlacement: NavigationBarTextPlacement = .bottom,
        textAlign: NavigationBarTextAlign = .center,
        contentPlacement: NavigationBarContentPlacement = .bottom,
        backAction: (() -> Void)? = nil,
        @ViewBuilder actionStart: @escaping () -> ActionStart,
        @ViewBuilder actionEnd: @escaping () -> ActionEnd,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.type = type
        self.title = title
        self.icon = icon
        self.textPlacement = textPlacement
        self.textAlign = textAlign
        self.contentPlacement = contentPlacement
        self.backAction = backAction
        self.actionStart = actionStart
        self.actionEnd = actionEnd
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            switch type {
            case .mainPage(let appearance):
                mainPageNavigation(appearance: appearance)
            case .internalPage(let appearance):
                internalPageNavigation(appearance: appearance)
            }
            
            if contentPlacement == .bottom {
                content()
            }
        }
        .background(backgroundColor)
        .shape(pathDrawer: bottomShape)
        .overlay(alignment: .top) {
            // Перекрываем верхние скругления
            topCornerMask(
                cornerRadius: cornerRadius(from: bottomShape),
                backgroundColor: backgroundColor
            )
        }
        .shadow(navigationBarShadow)
    }
    
    // MARK: - Main Page
    
    @ViewBuilder
    private func mainPageNavigation(appearance: NavigationBarMainPageAppearance) -> some View {
        VStack(spacing: appearance.size.textBlockTopMargin) {
            if textPlacement == .bottom {
                // Actions сверху
                actionsRow()
                
                // Текст снизу по центру
                titleContent(
                    textColor: appearance.textColor,
                    textTypography: appearance.textTypography,
                    size: appearance.size,
                    actionStartColor: appearance.actionStartColor,
                    actionEndColor: appearance.actionEndColor
                )
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                // Inline placement
                inlineLayout(
                    textColor: appearance.textColor,
                    textTypography: appearance.textTypography,
                    size: appearance.size,
                    actionStartColor: appearance.actionStartColor,
                    actionEndColor: appearance.actionEndColor
                )
            }
        }
        .padding(.leading, appearance.size.paddingStart)
        .padding(.trailing, appearance.size.paddingEnd)
        .padding(.top, appearance.size.paddingTop)
        .padding(.bottom, appearance.size.paddingBottom)
    }
    
    // MARK: - Internal Page
    
    @ViewBuilder
    private func internalPageNavigation(appearance: NavigationBarInternalPageAppearance) -> some View {
        VStack(spacing: appearance.size.textBlockTopMargin) {
            if textPlacement == .bottom {
                // Actions сверху (с back button)
                actionsRowWithBackButton(
                    backIcon: appearance.backIcon,
                    backIconColor: appearance.backIconColor,
                    backIconMargin: appearance.size.backIconMargin
                )
                
                // Текст снизу по центру
                titleContent(
                    textColor: appearance.textColor,
                    textTypography: appearance.textTypography,
                    size: appearance.size,
                    actionStartColor: appearance.actionStartColor,
                    actionEndColor: appearance.actionEndColor
                )
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                // Inline placement
                inlineLayoutWithBackButton(
                    textColor: appearance.textColor,
                    textTypography: appearance.textTypography,
                    size: appearance.size,
                    actionStartColor: appearance.actionStartColor,
                    actionEndColor: appearance.actionEndColor,
                    backIcon: appearance.backIcon,
                    backIconColor: appearance.backIconColor,
                    backIconMargin: appearance.size.backIconMargin
                )
            }
        }
        .padding(.leading, appearance.size.paddingStart)
        .padding(.trailing, appearance.size.paddingEnd)
        .padding(.top, appearance.size.paddingTop)
        .padding(.bottom, appearance.size.paddingBottom)
    }
    
    // MARK: - Actions
    
    @ViewBuilder
    private func actionsRow() -> some View {
        HStack(spacing: 0) {
            actionStart()
            Spacer()
            actionEnd()
        }
    }
    
    @ViewBuilder
    private func actionsRowWithBackButton(
        backIcon: Image?,
        backIconColor: ColorToken,
        backIconMargin: CGFloat
    ) -> some View {
        HStack(spacing: 0) {
            HStack(spacing: backIconMargin) {
                if let backIcon = backIcon {
                    Button {
                        backAction?()
                    } label: {
                        backIcon
                            .renderingMode(.template)
                            .foregroundColor(currentColor(for: backIconColor))
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(.plain)
                }
                actionStart()
            }
            Spacer()
            actionEnd()
        }
    }
    
    // MARK: - Title Content
    
    @ViewBuilder
    private func titleContent(
        textColor: ColorToken,
        textTypography: TypographyConfiguration,
        size: NavigationBarMainPageSizeConfiguration,
        actionStartColor: ColorToken,
        actionEndColor: ColorToken
    ) -> some View {
        HStack(spacing: 8) {
            if let icon = icon {
                icon
                    .renderingMode(.template)
                    .foregroundColor(currentColor(for: textColor))
            }
            
            Text(title)
                .typography(textTypography.typography(with: size) ?? .undefined)
                .foregroundColor(currentColor(for: textColor))
        }
    }
    
    @ViewBuilder
    private func titleContentWithInlineContent(
        textColor: ColorToken,
        textTypography: TypographyConfiguration,
        size: NavigationBarMainPageSizeConfiguration,
        actionStartColor: ColorToken,
        actionEndColor: ColorToken
    ) -> some View {
        HStack(spacing: 8) {
            if let icon = icon {
                icon
                    .renderingMode(.template)
                    .foregroundColor(currentColor(for: textColor))
            }
            
            Text(title)
                .typography(textTypography.typography(with: size) ?? .undefined)
                .foregroundColor(currentColor(for: textColor))
            
            content()
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
        }
    }
    
    @ViewBuilder
    private func titleContent(
        textColor: ColorToken,
        textTypography: TypographyConfiguration,
        size: NavigationBarInternalPageSizeConfiguration,
        actionStartColor: ColorToken,
        actionEndColor: ColorToken
    ) -> some View {
        HStack(spacing: 8) {
            if let icon = icon {
                icon
                    .renderingMode(.template)
                    .foregroundColor(currentColor(for: textColor))
            }
            
            Text(title)
                .typography(textTypography.typography(with: size) ?? .undefined)
                .foregroundColor(currentColor(for: textColor))
        }
    }
    
    @ViewBuilder
    private func titleContentWithInlineContent(
        textColor: ColorToken,
        textTypography: TypographyConfiguration,
        size: NavigationBarInternalPageSizeConfiguration,
        actionStartColor: ColorToken,
        actionEndColor: ColorToken
    ) -> some View {
        HStack(spacing: 8) {
            if let icon = icon {
                icon
                    .renderingMode(.template)
                    .foregroundColor(currentColor(for: textColor))
            }
            
            Text(title)
                .typography(textTypography.typography(with: size) ?? .undefined)
                .foregroundColor(currentColor(for: textColor))
            
            content()
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
        }
    }
    
    // MARK: - Inline Layouts
    
    @ViewBuilder
    private func inlineLayout(
        textColor: ColorToken,
        textTypography: TypographyConfiguration,
        size: NavigationBarMainPageSizeConfiguration,
        actionStartColor: ColorToken,
        actionEndColor: ColorToken
    ) -> some View {
        HStack(spacing: 0) {
            switch textAlign {
            case .center:
                if contentPlacement == .inline {
                    // Action слева, затем текст и контент по центру, затем action справа
                    actionStart()
                    Spacer()
                    titleContentWithInlineContent(
                        textColor: textColor,
                        textTypography: textTypography,
                        size: size,
                        actionStartColor: actionStartColor,
                        actionEndColor: actionEndColor
                    )
                    Spacer()
                    actionEnd()
                } else {
                    // Actions слева и справа, текст по центру
                    HStack {
                        actionStart()
                        Spacer()
                        titleContent(
                            textColor: textColor,
                            textTypography: textTypography,
                            size: size,
                            actionStartColor: actionStartColor,
                            actionEndColor: actionEndColor
                        )
                        Spacer()
                        actionEnd()
                    }
                }
                
            case .left:
                // Текст слева, actions справа
                titleContent(
                    textColor: textColor,
                    textTypography: textTypography,
                    size: size,
                    actionStartColor: actionStartColor,
                    actionEndColor: actionEndColor
                )
                Spacer()
                HStack(spacing: size.horizontalSpacing) {
                    actionStart()
                    actionEnd()
                }
                
            case .right:
                // Actions слева, текст справа
                HStack(spacing: size.horizontalSpacing) {
                    actionStart()
                    actionEnd()
                }
                Spacer()
                titleContent(
                    textColor: textColor,
                    textTypography: textTypography,
                    size: size,
                    actionStartColor: actionStartColor,
                    actionEndColor: actionEndColor
                )
            }
        }
    }
    
    @ViewBuilder
    private func inlineLayoutWithBackButton(
        textColor: ColorToken,
        textTypography: TypographyConfiguration,
        size: NavigationBarInternalPageSizeConfiguration,
        actionStartColor: ColorToken,
        actionEndColor: ColorToken,
        backIcon: Image?,
        backIconColor: ColorToken,
        backIconMargin: CGFloat
    ) -> some View {
        HStack(spacing: 0) {
            switch textAlign {
            case .center:
                if contentPlacement == .inline {
                    // Back button + action слева, затем текст и контент по центру, затем action справа
                    HStack(spacing: backIconMargin) {
                        if let backIcon = backIcon {
                            Button {
                                backAction?()
                            } label: {
                                backIcon
                                    .renderingMode(.template)
                                    .foregroundColor(currentColor(for: backIconColor))
                                    .frame(width: 24, height: 24)
                            }
                            .buttonStyle(.plain)
                        }
                        actionStart()
                    }
                    Spacer()
                    titleContentWithInlineContent(
                        textColor: textColor,
                        textTypography: textTypography,
                        size: size,
                        actionStartColor: actionStartColor,
                        actionEndColor: actionEndColor
                    )
                    Spacer()
                    actionEnd()
                } else {
                    // Back button + action слева, текст по центру, action справа
                    HStack(spacing: 0) {
                        HStack(spacing: backIconMargin) {
                            if let backIcon = backIcon {
                                Button {
                                    backAction?()
                                } label: {
                                    backIcon
                                        .renderingMode(.template)
                                        .foregroundColor(currentColor(for: backIconColor))
                                        .frame(width: 24, height: 24)
                                }
                                .buttonStyle(.plain)
                            }
                            actionStart()
                        }
                        Spacer()
                        titleContent(
                            textColor: textColor,
                            textTypography: textTypography,
                            size: size,
                            actionStartColor: actionStartColor,
                            actionEndColor: actionEndColor
                        )
                        Spacer()
                        actionEnd()
                    }
                }
                
            case .left:
                // Back button + текст слева, actions справа
                HStack(spacing: backIconMargin) {
                    if let backIcon = backIcon {
                        Button {
                            backAction?()
                        } label: {
                            backIcon
                                .renderingMode(.template)
                                .foregroundColor(currentColor(for: backIconColor))
                                .frame(width: 24, height: 24)
                        }
                        .buttonStyle(.plain)
                    }
                    titleContent(
                        textColor: textColor,
                        textTypography: textTypography,
                        size: size,
                        actionStartColor: actionStartColor,
                        actionEndColor: actionEndColor
                    )
                }
                Spacer()
                HStack(spacing: size.horizontalSpacing) {
                    actionStart()
                    actionEnd()
                }
                
            case .right:
                // Back button + actions слева, текст справа
                HStack(spacing: backIconMargin) {
                    if let backIcon = backIcon {
                        Button {
                            backAction?()
                        } label: {
                            backIcon
                                .renderingMode(.template)
                                .foregroundColor(currentColor(for: backIconColor))
                                .frame(width: 24, height: 24)
                        }
                        .buttonStyle(.plain)
                    }
                    HStack(spacing: size.horizontalSpacing) {
                        actionStart()
                        actionEnd()
                    }
                }
                Spacer()
                titleContent(
                    textColor: textColor,
                    textTypography: textTypography,
                    size: size,
                    actionStartColor: actionStartColor,
                    actionEndColor: actionEndColor
                )
            }
        }
    }
    
    // MARK: - Helpers
    
    private func currentColor(for colorToken: ColorToken) -> Color {
        return colorToken.color(for: colorScheme)
    }
    
    private var backgroundColor: Color {
        switch type {
        case .mainPage(let appearance):
            return currentColor(for: appearance.backgroundColor)
        case .internalPage(let appearance):
            return currentColor(for: appearance.backgroundColor)
        }
    }
    
    private var bottomShape: PathDrawer {
        switch type {
        case .mainPage(let appearance):
            return appearance.size.bottomShape
        case .internalPage(let appearance):
            return appearance.size.bottomShape
        }
    }
    
    private var navigationBarShadow: ShadowToken {
        switch type {
        case .mainPage(let appearance):
            return appearance.shadow
        case .internalPage(let appearance):
            return appearance.shadow
        }
    }
    
    private func cornerRadius(from pathDrawer: PathDrawer) -> CGFloat {
        if let drawer = pathDrawer as? CornerRadiusDrawer {
            return drawer.cornerRadius
        }
        return 0
    }
    
    @ViewBuilder
    private func topCornerMask(cornerRadius: CGFloat, backgroundColor: Color = .clear) -> some View {
        if cornerRadius > 0 {
            Rectangle()
                .fill(backgroundColor)
                .frame(height: cornerRadius)
        }
    }
}

// MARK: - Convenience Initializers

extension SDDSNavigationBar where ActionStart == EmptyView {
    public init(
        type: NavigationBarType,
        title: String,
        icon: Image? = nil,
        textPlacement: NavigationBarTextPlacement = .bottom,
        textAlign: NavigationBarTextAlign = .center,
        contentPlacement: NavigationBarContentPlacement = .bottom,
        backAction: (() -> Void)? = nil,
        @ViewBuilder actionEnd: @escaping () -> ActionEnd,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.type = type
        self.title = title
        self.icon = icon
        self.textPlacement = textPlacement
        self.textAlign = textAlign
        self.contentPlacement = contentPlacement
        self.backAction = backAction
        self.actionStart = { EmptyView() }
        self.actionEnd = actionEnd
        self.content = content
    }
}

extension SDDSNavigationBar where ActionEnd == EmptyView {
    public init(
        type: NavigationBarType,
        title: String,
        icon: Image? = nil,
        textPlacement: NavigationBarTextPlacement = .bottom,
        textAlign: NavigationBarTextAlign = .center,
        contentPlacement: NavigationBarContentPlacement = .bottom,
        backAction: (() -> Void)? = nil,
        @ViewBuilder actionStart: @escaping () -> ActionStart,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.type = type
        self.title = title
        self.icon = icon
        self.textPlacement = textPlacement
        self.textAlign = textAlign
        self.contentPlacement = contentPlacement
        self.backAction = backAction
        self.actionStart = actionStart
        self.actionEnd = { EmptyView() }
        self.content = content
    }
}

extension SDDSNavigationBar where ActionStart == EmptyView, ActionEnd == EmptyView {
    public init(
        type: NavigationBarType,
        title: String,
        icon: Image? = nil,
        textPlacement: NavigationBarTextPlacement = .bottom,
        textAlign: NavigationBarTextAlign = .center,
        contentPlacement: NavigationBarContentPlacement = .bottom,
        backAction: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.type = type
        self.title = title
        self.icon = icon
        self.textPlacement = textPlacement
        self.textAlign = textAlign
        self.contentPlacement = contentPlacement
        self.backAction = backAction
        self.actionStart = { EmptyView() }
        self.actionEnd = { EmptyView() }
        self.content = content
    }
}
