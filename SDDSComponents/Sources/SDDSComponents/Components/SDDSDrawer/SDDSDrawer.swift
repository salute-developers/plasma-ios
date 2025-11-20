import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSDrawer` представляет собой компонент для отображения выдвижной панели с настраиваемым внешним видом.

 Компонент состоит из трех частей:
 - Header: Верхняя часть Drawer (опционально)
 - Content: Основное содержимое Drawer
 - Footer: Нижняя часть Drawer (опционально)

 - Parameters:
   - appearance: Кастомизация внешнего вида Drawer (опционально)
   - backgroundColor: Цвет фона Drawer (опционально)
   - onClose: Действие при нажатии на кнопку закрытия (опционально)
   - header: Верхняя часть Drawer (опционально)
   - content: Основное содержимое Drawer
   - footer: Нижняя часть Drawer (опционально)

 ## Окружение
 
 - `drawerAppearance`: Стандартные настройки внешнего вида Drawer

 ## Пример использования

 ```swift
 SDDSDrawer(
     appearance: DrawerCloseInner.m.default.appearance,
     header: {
         Text("Header")
     },
     content: {
         Text("Content")
     },
     footer: {
         Text("Footer")
     }
 )
 ```
 */
public struct SDDSDrawer<Header: View, Content: View, Footer: View>: View {
    @Environment(\.drawerAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: DrawerAppearance?
    private let backgroundColor: Color?
    private let onClose: (() -> Void)?
    private let closePlacement: DrawerClosePlacement
    private let hasHeader: Bool
    private let hasFooter: Bool
    
    public let header: Header
    public let content: Content
    public let footer: Footer
    
    @State private var contentWidth: CGFloat = 0
    
    public init(
        appearance: DrawerAppearance? = nil,
        backgroundColor: Color? = nil,
        onClose: (() -> Void)? = nil,
        closePlacement: DrawerClosePlacement = .right,
        hasHeader: Bool,
        hasFooter: Bool,
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer
    ) {
        self._appearance = appearance
        self.backgroundColor = backgroundColor
        self.onClose = onClose
        self.closePlacement = closePlacement
        self.hasHeader = hasHeader
        self.hasFooter = hasFooter
        self.header = header()
        self.content = content()
        self.footer = footer()
    }
    
    public var bodyContent: some View {
        VStack(spacing: 0) {
            if !isHeaderEmpty || (shouldShowCloseButton && size.closeIconPlacement != .outer) {
                HStack(alignment: .top, spacing: 0) {
                    if closePlacement == .left && shouldShowCloseButton && size.closeIconPlacement != .outer {
                        closeButton
                            .padding(.trailing, size.closeIconOffsetX)
                        if isHeaderEmpty {
                            Spacer()
                        } else {
                            Spacer().frame(width: size.closeIconHeaderPadding)
                        }
                    }
                    
                    if !isHeaderEmpty {
                        headerView
                            .frame(maxWidth: .infinity)
                    }
                    
                    if closePlacement == .right && shouldShowCloseButton && size.closeIconPlacement != .outer {
                        if isHeaderEmpty {
                            Spacer()
                        } else {
                            Spacer().frame(width: size.closeIconHeaderPadding)
                        }
                        closeButton
                            .padding(.leading, size.closeIconOffsetX)
                    }
                }
                .frame(width: contentWidth > 0 ? contentWidth : nil)
                .fixedSize(horizontal: true, vertical: false)
            }
            
            contentView
                .readSize { size in
                    if contentWidth != size.width {
                        contentWidth = size.width
                    }
                }
            
            if !isFooterEmpty {
                footerView
            }
        }
    }
    
    public var body: some View {
        Group {
            if size.closeIconPlacement == .outer && shouldShowCloseButton {
                HStack(alignment: .top, spacing: 0) {
                    if closePlacement == .left {
                        closeButton
                            .padding(.trailing, size.closeIconOffsetX)
                        drawerContent
                    } else {
                        drawerContent
                        closeButton
                            .padding(.leading, size.closeIconOffsetX)
                    }
                }
            } else {
                drawerContent
            }
        }
        .applyIf(appearance.shadow != nil) {
            $0.shadow(appearance.shadow!)
        }
    }
    
    @ViewBuilder
    private var drawerContent: some View {
        bodyContent
            .padding(.leading, size.paddingStart)
            .padding(.top, size.paddingTop)
            .padding(.trailing, size.paddingEnd)
            .padding(.bottom, size.paddingBottom)
            .background(
                (backgroundColor ?? appearance.backgroundColor.color(for: colorScheme))
            )
    }
    
    private var appearance: DrawerAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var size: DrawerSizeConfiguration {
        appearance.size
    }
    
    private var shouldShowCloseButton: Bool {
        size.closeIconPlacement != .none && onClose != nil && appearance.closeIcon != nil
    }
    
    private var isHeaderEmpty: Bool {
        !hasHeader
    }
    
    private var isFooterEmpty: Bool {
        !hasFooter
    }
    
    @ViewBuilder
    private var headerView: some View {
        header
    }
    
    @ViewBuilder
    private var contentView: some View {
        content
    }
    
    @ViewBuilder
    private var footerView: some View {
        footer
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
                        .frame(width: size.closeIconSize, height: size.closeIconSize)
                        .foregroundColor(appearance.closeColor.color(for: colorScheme))
                }
            )
            .padding(.top, size.closeIconOffsetY)
        }
    }
}

