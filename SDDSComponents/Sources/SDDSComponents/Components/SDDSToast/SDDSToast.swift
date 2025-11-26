import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSToast` представляет собой настраиваемый тост, который может быть настроен с помощью различных параметров.
 
 - Parameters:
    - text: Текст для тоста.
    - contentStart: Начальный контент (иконка, кнопка и т.д.).
    - contentEnd: Конечный контент (иконка, кнопка и т.д.).
    - appearance: Параметры внешнего вида тоста.
    - accessibility: Параметры доступности для тоста.

 ## Окружение
 
 - `toastAppearance`: Стандартные настройки внешнего вида тостов

 ## Пример использования

 ```swift
 SDDSToast(
     text: "Toast message",
     contentStart: {
         Image(systemName: "info.circle")
     },
     contentEnd: {
         Image(systemName: "xmark")
     },
     appearance: Toast.m.default.appearance
 )
 ```
 */
public struct SDDSToast<ContentStart: View, Content: View, ContentEnd: View>: View {
    let contentStart: ContentStart
    let content: Content
    let contentEnd: ContentEnd
    let duration: TimeInterval?
    let contentEndPosition: ToastContentEndPosition
    let onClose: (() -> ())?
    private let _appearance: ToastAppearance?
    let accessibility: ToastAccessibility
    @State private var isVisible: Bool = false
    @State private var contentHeight: CGFloat = 0

    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.toastAppearance) private var environmentAppearance
    
    public init(
        @ViewBuilder contentStart: () -> ContentStart,
        @ViewBuilder content: () -> Content,
        @ViewBuilder contentEnd: () -> ContentEnd,
        duration: TimeInterval = 3.0,
        appearance: ToastAppearance? = nil,
        contentEndPosition: ToastContentEndPosition,
        onClose: (() -> ())?,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.contentStart = contentStart()
        self.content = content()
        self.contentEnd = contentEnd()
        self.duration = duration
        self.onClose = onClose
        self._appearance = appearance
        self.contentEndPosition = contentEndPosition
        self.accessibility = accessibility
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: appearance.size.paddingStart)
            
            HStack(spacing: appearance.size.contentStartPadding) {
                contentStart
                    .foregroundColor(appearance.contentStartColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(width: appearance.size.contentStartSize, height: appearance.size.contentStartSize)
                    .accessibilityHidden(true)
                
                HStack(spacing: appearance.size.contentEndPadding) {
                    content
                        .typography(appearance.textTypography?.typography(with: appearance.size) ?? .undefined)
                        .applyIf(appearance.textColor != nil) {
                            $0.foregroundColor(appearance.textColor?.color(for: colorScheme, subtheme: subtheme) ?? .clear)
                        }
                        .applyIf(textTypography != nil) {
                            $0
                                .typography(textTypography ?? .undefined)
                                .lineLimit(1)
                        }
                        .accessibilityLabel(Text(accessibility.textLabel))
                        .measureSize { size in
                            contentHeight = size.height
                        }
                    
                    switch contentEndPosition {
                    case .centerRight:
                        contentEndView
                    case .topRight:
                        VStack {
                            contentEndView
                            Spacer()
                        }
                        .frame(height: contentHeight)
                    }
                }
            }

            Spacer()
                .frame(width: appearance.size.paddingEnd)
        }
        .padding(.vertical, appearance.size.paddingTop)
        .background(appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
        .shape(pathDrawer: appearance.size.shape)
        .opacity(isVisible ? 1 : 0)
        .scaleEffect(isVisible ? 1 : 0.8)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isVisible)
        .onAppear {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isVisible = true
            }
        }
        .autoClose(duration: duration) {
            withAnimation(.easeOut(duration: 0.2)) {
                isVisible = false
            }
            onClose?()
        }
    }
    
    private var textTypography: TypographyToken? {
        appearance.textTypography?.typography(with: appearance.size)
    }
    
    var appearance: ToastAppearance {
        _appearance ?? environmentAppearance
    }
    
    @ViewBuilder
    private var contentEndView: some View {
        contentEnd
            .foregroundColor(appearance.contentEndColor.color(for: colorScheme, subtheme: subtheme))
            .frame(width: appearance.size.contentEndSize, height: appearance.size.contentEndSize)
            .accessibilityHidden(true)
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.2)) {
                    isVisible = false
                }
                onClose?()
            }
    }
}

extension SDDSToast where ContentStart == EmptyView, ContentEnd == EmptyView, Content == Text {
    public init(
        text: String,
        contentEndPosition: ToastContentEndPosition,
        onClose: (() -> ())?,
        appearance: ToastAppearance? = nil,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.init(
            contentStart: { EmptyView() },
            content: { Text(text) },
            contentEnd: { EmptyView() },
            appearance: appearance,
            contentEndPosition: contentEndPosition,
            onClose: onClose,
            accessibility: accessibility
        )
    }
}

extension SDDSToast where ContentEnd == EmptyView, Content == Text {
    public init(
        text: String,
        @ViewBuilder contentStart: () -> ContentStart,
        contentEndPosition: ToastContentEndPosition,
        onClose: (() -> ())?,
        appearance: ToastAppearance? = nil,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.init(
            contentStart: contentStart,
            content: { Text(text) },
            contentEnd: { EmptyView() },
            appearance: appearance,
            contentEndPosition: contentEndPosition,
            onClose: onClose,
            accessibility: accessibility
        )
    }
}

extension SDDSToast where ContentStart == EmptyView, Content == Text {
    public init(
        text: String,
        @ViewBuilder contentEnd: () -> ContentEnd,
        contentEndPosition: ToastContentEndPosition,
        onClose: (() -> ())?,
        appearance: ToastAppearance? = nil,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.init(
            contentStart: { EmptyView() },
            content: { Text(text) },
            contentEnd: contentEnd,
            appearance: appearance,
            contentEndPosition: contentEndPosition,
            onClose: onClose,
            accessibility: accessibility
        )
    }
}

extension View {
    func measureSize(perform action: @escaping (CGSize) -> Void) -> some View {
        self.background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        action(geometry.size)
                    }
                    .onChange(of: geometry.size) { newSize in
                        action(newSize)
                    }
            }
        )
    }
} 
