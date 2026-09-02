import Foundation

/// Ошибка рендера/валидации схемы.
///
/// Наследует `NSError` (её ждут `CommandResult.error(.nsError:)` и Stencil),
/// поэтому обязана звать назначенный инициализатор `init(domain:code:userInfo:)`.
/// От `super.init()` объект получал нулевой `domain`, и любой, кто бриджил
/// брошенную ошибку в `NSError` — например перехватчик ошибок XCTest, — падал
/// при чтении `_domain`.
final class TemplateRendererError: NSError {
    let text: String

    init(_ text: String) {
        self.text = text
        super.init(
            domain: "DesignSystemBuilder.TemplateRenderer",
            code: 1,
            userInfo: [NSLocalizedDescriptionKey: text]
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var localizedDescription: String {
        text
    }
}
