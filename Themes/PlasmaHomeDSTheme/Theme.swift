import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public class Theme {
    static let name = "PlasmaHomeDS"
    
    /// Синхронная инициализация темы.
    ///
    /// HomeDS закреплён на системном SF Pro (`fontFamilyOverride: .systemSFPro`
    /// в `DesignSystemBuilderConfiguration`), поэтому `FontsManifest.fonts` пустой:
    /// скачивать и регистрировать нечего, вся инициализация сводится к установке
    /// дефолтных значений окружения. После возврата из метода тема готова —
    /// снапшот-тестам не нужны ни колбэк, ни `XCTestExpectation`.
    ///
    /// Остальные темы пока остаются асинхронными: они тянут шрифты по сети.
    /// Синхронная инициализация темы.
    ///
    /// HomeDS закреплён на системном SF Pro (`fontFamilyOverride: .systemSFPro`
    /// в `DesignSystemBuilderConfiguration`), поэтому список вшитых шрифтов пуст —
    /// регистрировать нечего, вся инициализация сводится к установке дефолтных
    /// значений окружения.
    public class func initialize() {
        EnvironmentValueProvider.shared.setDefaultValues()
        FontsService.shared.register(embeddedFonts: FontsManifest.embedded)
    }

    /// У темы нет тенантов, поэтому параметр не влияет ни на что.
    public class func initialize(tenant: Tenant) {
        initialize()
    }

    /// Совместимость с асинхронным API: колбэк вызывается на следующем тике.
    @available(*, deprecated, message: "Use initialize() — theme initialization is synchronous")
    public class func initialize(onComplete: @escaping () -> Void) {
        initialize()
        DispatchQueue.main.async { onComplete() }
    }

    @available(*, deprecated, message: "Use initialize(tenant:) — theme initialization is synchronous")
    public class func initialize(
        tenant: Tenant,
        onComplete: @escaping () -> Void
    ) {
        initialize(tenant: tenant)
        DispatchQueue.main.async { onComplete() }
    }

    public class func subtheme(_ subtheme: Subtheme) -> SubthemeData {
        .init(
            subtheme: subtheme,
            colorMapper: { subtheme, colorToken in
                colorToken.token(for: subtheme)
            },
            gradientMapper: { subtheme, gradientToken in
                gradientToken.token(for: subtheme)
            }
        )
    }
    
    private static var bundleName: String {
        return "\(name)_\(name)"
    }
}

public extension View {
    func subtheme(_ subtheme: Subtheme) -> some View {
        self
            .environment(\.subtheme, Theme.subtheme(subtheme))
    }
}

public extension Theme {
    static var availableTenants: [Tenant] { [] }
}
