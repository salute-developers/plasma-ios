import Foundation

final class ImageSizeContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    let nullify: Bool
    
    init(_ string: String?, nullify: Bool = false) {
        self.string = string
        self.nullify = nullify
    }

    var context: String? {
        guard let string = string else {
            return nullify ? nil : "CGFloat(0)"
        }
        let items = string.components(separatedBy: ".")
        guard let lastComponent = items.last,
              let size = Int(lastComponent) else {
            return nullify ? nil : "CGFloat(0)"
        }
        return "CGFloat(\(size))"
    }
}
