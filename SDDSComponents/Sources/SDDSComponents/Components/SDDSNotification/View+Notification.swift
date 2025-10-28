import SwiftUI

/**
 Модификатор для отображения уведомлений с возможностью настройки внешнего вида и позиционирования.

 - Parameters:
    - isPresented: Состояние отображения уведомления.
    - appearance: Параметры внешнего вида уведомления.
    - position: Позиция уведомления на экране (по умолчанию `.topCenter`).
    - duration: Время отображения уведомления в секундах (по умолчанию 3.0).
    - hasClose: Показывать ли кнопку закрытия (по умолчанию true).
    - onShow: Обработчик показа уведомления.
    - onClose: Обработчик закрытия уведомления.
    - content: View-контент уведомления.

 ```swift
 Text("Показать уведомление")
     .notification(
         isPresented: $isNotificationPresented,
         appearance: Notification.default.appearance,
         position: .topCenter,
         duration: 3.0,
         hasClose: true
     ) {
         Text("Текст уведомления")
     }
 ```
 */
public extension View {
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    func notification<Content: View>(
        isPresented: Binding<Bool>,
        appearance: NotificationAppearance,
        position: ToastPosition = .topCenter,
        duration: TimeInterval = 3.0,
        hasClose: Bool = true,
        closeImage: Image? = nil,
        onShow: ((ToastID) -> Void)? = nil,
        onClose: ((ToastID) -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.toast(
            isPresented: isPresented,
            appearance: toastAppearance(from: appearance),
            position: position,
            duration: duration,
            contentEndPosition: .topRight,
            onShow: onShow,
            onClose: onClose,
            contentStart: { EmptyView() },
            content: content,
            contentEnd: {
                if let closeImage = closeImage, hasClose {
                    closeImage
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    EmptyView()
                }
            }
        )
    }
    
    func notification<Content: View>(
        isPresented: Binding<Bool>,
        appearance: NotificationAppearance,
        position: ToastPosition = .topCenter,
        duration: TimeInterval = 3.0,
        closeImage: Image? = nil,
        onShow: ((ToastID) -> Void)? = nil,
        onClose: ((ToastID) -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.toast(
            isPresented: isPresented,
            appearance: toastAppearance(from: appearance),
            position: position,
            duration: duration,
            contentEndPosition: .topRight,
            onShow: onShow,
            onClose: onClose,
            contentStart: { EmptyView() },
            content: content,
            contentEnd: {
                if let closeImage = closeImage {
                    closeImage
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    EmptyView()
                }
            }
        )
    }
    
    private func toastAppearance(from notificationAppearance: NotificationAppearance) -> ToastAppearance {
        var appearance = ToastAppearance()
        appearance.backgroundColor = notificationAppearance.backgroundColor
        appearance.textColor = nil
        appearance.contentEndColor = notificationAppearance.closeColor
        
        var size = ZeroToastSize()
        size.contentEndSize = notificationAppearance.size.closeSize
        size.paddingEnd = notificationAppearance.size.paddingEnd
        size.paddingStart = notificationAppearance.size.paddingStart
        size.paddingTop = notificationAppearance.size.paddingTop
        size.paddingBottom = notificationAppearance.size.paddingBottom
        size.shape = notificationAppearance.size.shape
        appearance.size = size
        
        return appearance
    }
}
