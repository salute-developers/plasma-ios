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
    case basicButtonColorVariations = "BasicButton+ColorVariations"
    case basicButtonSizeVariations = "BasicButton+SizeVariations"
    case basicButtonTypography = "BasicButtonTypography"
    case basicButtonTypographyVariations = "BasicButton+Typography"
    case basicButtonSizeConfiguration = "BasicButtonSize+ButtonSizeConfiguration"
    case linkButtonColorVariations = "LinkButton+ColorVariations"
    case linkButtonSizeVariations = "LinkButton+SizeVariations"
    case linkButtonTypography = "LinkButtonTypography"
    case linkButtonTypographyVariations = "LinkButton+Typography"
    case linkButtonSizeConfiguration = "LinkButtonSize+ButtonSizeConfiguration"
    case iconButtonColorVariations = "IconButton+ColorVariations"
    case iconButtonSizeVariations = "IconButton+SizeVariations"
    case iconButtonSizeConfiguration = "IconButtonSize+ButtonSizeConfiguration"
    case textFieldSize = "TextFieldSize"
    case textFieldColorVariations = "TextField+ColorVariations"
    case textFieldSizeVariations = "TextField+SizeVariations"
    case textFieldTypography = "TextFieldTypography"
    case textFieldClearSize = "TextFieldClearSize"
    case textFieldClearColorVariations = "TextFieldClear+ColorVariations"
    case textFieldClearSizeVariations = "TextFieldClear+SizeVariations"
    case textFieldClearTypography = "TextFieldClearTypography"
    case textAreaSize = "TextAreaSize"
    case textAreaColorVariations = "TextArea+ColorVariations"
    case textAreaSizeVariations = "TextArea+SizeVariations"
    case textAreaTypography = "TextAreaTypography"
    case textAreaClearSize = "TextAreaClearSize"
    case textAreaClearColorVariations = "TextAreaClear+ColorVariations"
    case textAreaClearSizeVariations = "TextAreaClear+SizeVariations"
    case textAreaClearTypography = "TextAreaClearTypography"
    
    var withStencilExt: String {
        rawValue + ".stencil"
    }
}

extension StencilTemplate {
    var filename: String {
        return "\(rawValue)+Generated.swift"
    }
}
