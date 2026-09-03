import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public class Theme {
    static let name = "PlasmaB2CTheme"
    
    /// Инициализация темы. Шрифты вшиты в исходники, поэтому синхронная.
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
