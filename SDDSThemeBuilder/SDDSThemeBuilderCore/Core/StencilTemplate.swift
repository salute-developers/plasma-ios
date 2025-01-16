import Foundation

enum StencilTemplate: String {
    case colorToken = "ColorToken"
    case shapeToken = "ShapeToken"
    case shadowToken = "ShadowToken"
    case typographyToken = "TypographyToken"
    case gradientToken = "GradientToken"
    case colors = "Colors"
    case shapes = "Shapes"
    case shadows = "Shadows"
    case typographies = "Typographies"
    case gradients = "Gradients"
    case componentSize = "ComponentSize"
    case componentBaseVariations = "Component+BaseVariations"
    case componentVariations = "Component+Variations"
    case componentTypography = "ComponentTypography"
    
    var withStencilExt: String {
        rawValue + ".stencil"
    }
}

extension StencilTemplate {
    var filename: String {
        return "\(rawValue)+Generated.swift"
    }
    
    func generatedFileName(component: GeneratedComponent) -> String {
        let templateName = self.rawValue.replacingOccurrences(of: "Component", with: "")
        return "\(component.rawValue)\(templateName).swift"
    }
}
