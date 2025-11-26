import SwiftUI

private struct ToastParams<ContentStart: View, Content: View, ContentEnd: View> {
    let isPresented: Binding<Bool>
    let appearance: ToastAppearance
    let position: ToastPosition
    let duration: TimeInterval
    let contentEndPosition: ToasContentEndPosition
    let subtheme: SubthemeData
    let onShow: ((ToastID) -> Void)?
    let onClose: ((ToastID) -> Void)?
    let contentStart: () -> ContentStart
    let content: () -> Content
    let contentEnd: () -> ContentEnd
}

/**
 Модификатор для отображения тостов с текстом и кастомными иконками.

 - Parameters:
    - isPresented: Состояние отображения тоста.
    - text: Текст тоста.
    - appearance: Параметры внешнего вида тоста.
    - position: Позиция тоста на экране (по умолчанию `.topCenter`).
    - duration: Время отображения тоста в секундах (по умолчанию 3.0).
    - onShow: Обработчик показа тоста.
    - onClose: Обработчик закрытия тоста.
    - contentStart: Начальный контент (иконка, кнопка и т.д.).
    - contentEnd: Конечный контент (иконка, кнопка и т.д.).

 ```swift
 Text("Показать тост")
     .toast(
         isPresented: $isToastPresented,
         text: "Текст тоста",
         appearance: Toast.m.default.appearance,
         position: .topCenter,
         duration: 3.0,
         contentStart: { Image(systemName: "info.circle") },
         contentEnd: { Image(systemName: "xmark") }
     )
 ```
 */
public extension View {
    func toast<ContentStart: View, ContentEnd: View>(
        isPresented: Binding<Bool>,
        text: String,
        appearance: ToastAppearance,
        position: ToastPosition = .topCenter,
        duration: TimeInterval = 3.0,
        subtheme: SubthemeData = SubthemeData(),
        onShow: ((ToastID) -> Void)? = nil,
        onClose: ((ToastID) -> Void)? = nil,
        @ViewBuilder contentStart: @escaping () -> ContentStart,
        @ViewBuilder contentEnd: @escaping () -> ContentEnd
    ) -> some View {
        return self.toast(
            isPresented: isPresented,
            appearance: appearance,
            position: position,
            duration: duration,
            contentEndPosition: .centerRight,
            subtheme: subtheme,
            onShow: onShow,
            onClose: onClose,
            contentStart: contentStart,
            content: { Text(text) },
            contentEnd: contentEnd
        )
    }
} 

/**
 Модификатор для отображения тостов с произвольным содержимым.

 - Parameters:
    - isPresented: Состояние отображения тоста.
    - appearance: Параметры внешнего вида тоста.
    - position: Позиция тоста на экране (по умолчанию `.topCenter`).
    - duration: Время отображения тоста в секундах (по умолчанию 3.0).
    - contentEndPosition: Позиция конечного контента (по умолчанию `.centerRight`).
    - onShow: Обработчик показа тоста.
    - onClose: Обработчик закрытия тоста.
    - contentStart: Начальный контент (иконка, кнопка и т.д.).
    - content: Произвольный контент тоста.
    - contentEnd: Конечный контент (иконка, кнопка и т.д.).

 ```swift
 Text("Показать тост")
     .toast(
         isPresented: $isToastPresented,
         appearance: ToastAppearance(
             backgroundColor: .surfaceDefaultSolidCard,
             textColor: .textDefaultPrimary
         ),
         position: .topLeft,
         duration: 4.0,
         contentStart: { Image(systemName: "star.fill") },
         content: { Text("Кастомный текст") },
         contentEnd: { Image(systemName: "xmark") }
     )
 ```
 */
extension View {
    func toast<ContentStart: View, Content: View, ContentEnd: View>(
        isPresented: Binding<Bool>,
        appearance: ToastAppearance,
        position: ToastPosition = .topCenter,
        duration: TimeInterval = 3.0,
        contentEndPosition: ToasContentEndPosition,
        subtheme: SubthemeData = SubthemeData(),
        onShow: ((ToastID) -> Void)? = nil,
        onClose: ((ToastID) -> Void)? = nil,
        @ViewBuilder contentStart: @escaping () -> ContentStart,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder contentEnd: @escaping () -> ContentEnd
    ) -> some View {
        let params = ToastParams(
            isPresented: isPresented,
            appearance: appearance,
            position: position,
            duration: duration,
            contentEndPosition: contentEndPosition,
            subtheme: subtheme,
            onShow: onShow,
            onClose: onClose,
            contentStart: contentStart,
            content: content,
            contentEnd: contentEnd
        )
        
        return self
            .task(id: isPresented.wrappedValue) {
                if isPresented.wrappedValue {
                    showToast(params: params)
                }
            }
    }
    
    private func showToast<ContentStart: View, Content: View, ContentEnd: View>(
        params: ToastParams<ContentStart, Content, ContentEnd>
    ) {
        let toastID = UUID()
        WindowOverlayService.shared.showInStack(
            content: {
                SDDSToast(
                    contentStart: params.contentStart,
                    content: params.content,
                    contentEnd: params.contentEnd,
                    appearance: params.appearance,
                    contentEndPosition: params.contentEndPosition,
                    onClose: {
                        WindowOverlayService.shared.hideInStack(id: toastID)
                        params.onClose?(toastID)
                    }
                )
                .environment(\.subtheme, params.subtheme)
            },
            id: toastID,
            position: params.position,
            duration: params.duration,
            onClose: nil
        )
        params.onShow?(toastID)
        params.isPresented.wrappedValue = false
    }
}
