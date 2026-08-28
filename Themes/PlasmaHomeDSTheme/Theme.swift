import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public class Theme {
    static let name = "PlasmaHomeDS"
    
    /// Синхронная инициализация темы.
    ///
    /// HomeDS закреплён на системном SF Pro (`fontFamilyOverride: .systemSFPro`
    /// в `ThemeBuilderConfiguration`), поэтому `FontsManifest.fonts` пустой:
    /// скачивать и регистрировать нечего, вся инициализация сводится к установке
    /// дефолтных значений окружения. После возврата из метода тема готова —
    /// снапшот-тестам не нужны ни колбэк, ни `XCTestExpectation`.
    ///
    /// Остальные темы пока остаются асинхронными: они тянут шрифты по сети.
    public class func initialize() {
        assert(
            FontsManifest.fonts.isEmpty,
            "PlasmaHomeDS рассчитывает на пустой FontsManifest (системный SF Pro). "
            + "Если тема начала поставлять собственные шрифты, синхронный initialize() "
            + "их не зарегистрирует — нужен initialize(onComplete:)."
        )
        EnvironmentValueProvider.shared.setDefaultValues()
    }

    /// Синхронный вариант с тенантом. У HomeDS `availableTenants` пуст,
    /// поэтому тенант ни на что не влияет.
    public class func initialize(tenant: Tenant) {
        initialize()
    }

    /// Асинхронный вариант — оставлен для совместимости с существующими вызовами.
    ///
    /// `DispatchQueue.main.async` сохраняет асинхронный контракт `onComplete`.
    /// Ветка со скачиванием шрифтов недостижима, пока манифест пуст, но оставлена
    /// на случай, если тема когда-нибудь перестанет быть системно-шрифтовой.
    public class func initialize(onComplete: @escaping () -> Void = {}) {
        EnvironmentValueProvider.shared.setDefaultValues()
        guard !FontsManifest.fonts.isEmpty else {
            DispatchQueue.main.async { onComplete() }
            return
        }
        let fonts = FontsManifest.fonts.map { fontInfo in
            SDDSThemeCore.FontInfo(url: fontInfo.url, weight: fontInfo.weight, style: fontInfo.style, filename: fontInfo.filename)
        }
        FontsService.shared.initialize(fonts: fonts) { _ in
            onComplete()
        }
    }

    public class func initialize(
        tenant: Tenant,
        onComplete: @escaping () -> Void = {}
    ) {
        initialize(onComplete: onComplete)
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
