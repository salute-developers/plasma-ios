import Foundation

final class FillStyleContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    let alpha: Double?
    let hasDefault: Bool
    let type: String?
    
    init(_ color: ColorKeyValue?, hasDefault: Bool = false) {
        self.string = color?.default
        self.alpha = color?.alpha
        self.hasDefault = hasDefault
        self.type = color?.type
    }
    
    var context: String? {
        guard let string = string else {
            return hasDefault ? ".color(.clearColor)" : nil
        }

        guard type == "gradient" else {
            // The config may dim a color token (`alpha`); dropping it silently changes
            // how the component looks.
            guard let alpha else {
                return ".color(.\(string.camelCase))"
            }
            return ".color(ColorToken.\(string.camelCase).withOpacity(\(alpha)))"
        }

        let gradientString = ".gradient(GradientToken.\(string.camelCase))"

        return gradientString
    }
}
