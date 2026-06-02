import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public class Theme {
    static let name = "SDDSServTheme"

    public class func initialize(onComplete: @escaping () -> Void = {}) {
        initialize(tenant: .none, onComplete: onComplete)
    }

    /// Инициализация темы с выбором тенанта.
    ///
    /// При первом вызове регистрируются все известные перекрытия тенантов
    /// в ``ThemeTenantRegistry``; в дальнейшем активируется только выбранный.
    /// Если тенанту не зарегистрирован overlay для какого-то ключа — резолвится
    /// базовый токен (фолбэк).
    public class func initialize(
        tenant: Tenant,
        onComplete: @escaping () -> Void = {}
    ) {
        registerTenants()
        ThemeTenantRegistry.shared.setActive(tenant, for: "SDDSServ")
        EnvironmentValueProvider.shared.setDefaultValues()
        let fonts = FontsManifest.fonts.map { fontInfo in
            SDDSThemeCore.FontInfo(url: fontInfo.url, weight: fontInfo.weight, style: fontInfo.style, filename: fontInfo.filename)
        }
        FontsService.shared.initialize(fonts: fonts) { _ in
            onComplete()
        }
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

    /// Регистрация перекрытий для всех известных тенантов.
    ///
    /// Этот список должен совпадать со списком тенантов, объявленных в
    /// `ThemeBuilderConfiguration.Theme.sddsServTheme.tenants`. При добавлении
    /// нового тенанта в Config.swift здесь нужно вызвать соответствующий
    /// `register{Tenant}()` для всех шести типов токенов.
    private static var tenantsRegistered = false
    private class func registerTenants() {
        guard !tenantsRegistered else { return }
        tenantsRegistered = true

        // Gold
        Colors.registerGold()
        Gradients.registerGold()
        Shapes.registerGold()
        Shadows.registerGold()
        Spacings.registerGold()
        Typographies.registerGold()
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

public extension Tenant {
    /// Готовый идентификатор для тенанта Gold темы `SDDSservTheme`.
    static let gold = Tenant(name: "Gold")
}

public extension Theme {
    static var availableTenants: [Tenant] { [.gold] }
}
