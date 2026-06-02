import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public class Theme {
    static let name = "PlasmaHomeDS"
    
    public class func initialize(onComplete: @escaping () -> Void = {}) {
        EnvironmentValueProvider.shared.setDefaultValues()
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
