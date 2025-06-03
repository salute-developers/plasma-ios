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
public struct SDDSToast<ContentStart: View, ContentEnd: View>: View {
    let text: String
    let contentStart: ContentStart
    let contentEnd: ContentEnd
    let duration: TimeInterval?
    let onClose: (() -> ())?
    private let _appearance: ToastAppearance?
    let accessibility: ToastAccessibility
    @State private var isVisible: Bool = false

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.toastAppearance) private var environmentAppearance
    
    public init(
        text: String,
        @ViewBuilder contentStart: () -> ContentStart,
        @ViewBuilder contentEnd: () -> ContentEnd,
        duration: TimeInterval = 3.0,
        appearance: ToastAppearance? = nil,
        onClose: (() -> ())?,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.text = text
        self.contentStart = contentStart()
        self.contentEnd = contentEnd()
        self.duration = duration
        self.onClose = onClose
        self._appearance = appearance
        self.accessibility = accessibility
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: appearance.size.paddingStart)
            
            HStack(spacing: appearance.size.contentStartPadding) {
                contentStart
                    .foregroundColor(appearance.contentStartColor.color(for: colorScheme))
                    .frame(width: appearance.size.contentStartSize, height: appearance.size.contentStartSize)
                    .accessibilityHidden(true)
                
                HStack(spacing: appearance.size.contentEndPadding) {
                    if !text.isEmpty {
                        Text(text)
                            .lineLimit(1)
                            .typography(appearance.textTypography?.typography(with: appearance.size) ?? .undefined)
                            .foregroundColor(appearance.textColor.color(for: colorScheme))
                            .accessibilityLabel(Text(accessibility.textLabel))
                            .accessibilityValue(Text(text))
                    }
                    
                    contentEnd
                        .foregroundColor(appearance.contentEndColor.color(for: colorScheme))
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

            Spacer()
                .frame(width: appearance.size.paddingEnd)
        }
        .padding(.vertical, appearance.size.paddingTop)
        .background(appearance.backgroundColor.color(for: colorScheme))
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
    
    var appearance: ToastAppearance {
        _appearance ?? environmentAppearance
    }
}

extension SDDSToast where ContentStart == EmptyView, ContentEnd == EmptyView {
    public init(
        text: String,
        onClose: (() -> ())?,
        appearance: ToastAppearance? = nil,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.init(
            text: text,
            contentStart: { EmptyView() },
            contentEnd: { EmptyView() },
            appearance: appearance,
            onClose: onClose,
            accessibility: accessibility
        )
    }
}

extension SDDSToast where ContentEnd == EmptyView {
    public init(
        text: String,
        @ViewBuilder contentStart: () -> ContentStart,
        onClose: (() -> ())?,
        appearance: ToastAppearance? = nil,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.init(
            text: text,
            contentStart: contentStart,
            contentEnd: { EmptyView() },
            appearance: appearance,
            onClose: onClose,
            accessibility: accessibility
        )
    }
}

extension SDDSToast where ContentStart == EmptyView {
    public init(
        text: String,
        @ViewBuilder contentEnd: () -> ContentEnd,
        onClose: (() -> ())?,
        appearance: ToastAppearance? = nil,
        accessibility: ToastAccessibility = ToastAccessibility()
    ) {
        self.init(
            text: text,
            contentStart: { EmptyView() },
            contentEnd: contentEnd,
            appearance: appearance,
            onClose: onClose,
            accessibility: accessibility
        )
    }
} 
