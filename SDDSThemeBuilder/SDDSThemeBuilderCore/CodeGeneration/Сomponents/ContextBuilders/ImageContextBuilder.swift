import Foundation

final class ImageContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    let id: String?
    let component: CodeGenerationComponent
    
    init(_ string: String?, id: String?, component: CodeGenerationComponent) {
        self.string = string
        self.id = id
        self.component = component
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
