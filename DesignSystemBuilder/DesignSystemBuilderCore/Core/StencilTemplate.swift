import Foundation

enum StencilTemplate: String, CaseIterable {
    // MARK: - Tokens
    case spacingToken = "SpacingToken"
    case colorToken = "ColorToken"
    case shapeToken = "ShapeToken"
    case shadowToken = "ShadowToken"
    case typographyToken = "TypographyToken"
    case gradientToken = "GradientToken"
    case spacings = "Spacings"
    case colors = "Colors"
    case shapes = "Shapes"
    case shadows = "Shadows"
    case typographies = "Typographies"
    case gradients = "Gradients"
    
    // MARK: - Components
    case componentSize = "ComponentSize"
    case componentBaseVariations = "Component+BaseVariations"
    case componentVariations = "Component+Variations"
    case componentTypography = "ComponentTypography"
    
    var withStencilExt: String {
        rawValue + ".stencil"
    }

    /// Текст шаблона, вшитый в бинарь (`.embedInCode("Stencil")` в `Package.swift`).
    ///
    /// Шаблоны не читаются из `Bundle.module`: релизный `dsbuilder-ios` — один исполняемый
    /// файл, и ресурсный бандл SwiftPM рядом с ним не едет — ни в zip релиза, ни при установке
    /// бинаря симлинком в `PATH`. Имена свойств `PackageResources` SwiftPM выводит из имени
    /// файла, поэтому удалённый или переименованный шаблон ломает сборку, а не генерацию.
    var source: String {
        String(decoding: bytes, as: UTF8.self)
    }

    private var bytes: [UInt8] {
        switch self {
        case .spacingToken: return PackageResources.SpacingToken_stencil
        case .colorToken: return PackageResources.ColorToken_stencil
        case .shapeToken: return PackageResources.ShapeToken_stencil
        case .shadowToken: return PackageResources.ShadowToken_stencil
        case .typographyToken: return PackageResources.TypographyToken_stencil
        case .gradientToken: return PackageResources.GradientToken_stencil
        case .spacings: return PackageResources.Spacings_stencil
        case .colors: return PackageResources.Colors_stencil
        case .shapes: return PackageResources.Shapes_stencil
        case .shadows: return PackageResources.Shadows_stencil
        case .typographies: return PackageResources.Typographies_stencil
        case .gradients: return PackageResources.Gradients_stencil
        case .componentSize: return PackageResources.ComponentSize_stencil
        case .componentBaseVariations: return PackageResources.Component_BaseVariations_stencil
        case .componentVariations: return PackageResources.Component_Variations_stencil
        case .componentTypography: return PackageResources.ComponentTypography_stencil
        }
    }

    /// Все шаблоны по имени файла — для загрузчика Stencil (на случай `include`/`extends`).
    static let embeddedSources: [String: String] = Dictionary(
        uniqueKeysWithValues: allCases.map { ($0.withStencilExt, $0.source) }
    )
}

extension StencilTemplate {
    var filename: String {
        return "\(rawValue)+Generated.swift"
    }

    /// Имя файла для тенантного рендера, например `Colors+Gold+Generated.swift`.
    func filename(tenantSuffix: String) -> String {
        return "\(rawValue)+\(tenantSuffix)+Generated.swift"
    }

    func generatedFileName(component: CodeGenerationComponent) -> String {
        let templateName = self.rawValue.replacingOccurrences(of: "Component", with: "")
        return "\(component.rawValue)\(templateName).swift"
    }
}
