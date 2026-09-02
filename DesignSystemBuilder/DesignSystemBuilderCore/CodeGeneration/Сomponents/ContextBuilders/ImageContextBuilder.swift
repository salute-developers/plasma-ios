import Foundation

final class ImageContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    
    init(_ string: String?) {
        self.string = string
    }

    var context: String? {
        let items = string?.components(separatedBy: ".")
        let imageName = items.map { $0.camelCase }
        guard let imageName = imageName else {
            return nil
        }
        return "Asset." + imageName + ".image"
    }
}
