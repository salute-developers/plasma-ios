import Foundation

struct TextFieldTypography: Codable {
    struct SizeVariation: Codable {
        let title: String
        let text: String
        let innerTitle: String
        let caption: String
        
        init(title: String, text: String, innerTitle: String, caption: String) {
            self.title = title
            self.text = text
            self.innerTitle = innerTitle
            self.caption = caption
        }
    }
    
    let data: [String: SizeVariation]
    
    init(data: [String : SizeVariation] = [:]) {
        self.data = data
    }
}
