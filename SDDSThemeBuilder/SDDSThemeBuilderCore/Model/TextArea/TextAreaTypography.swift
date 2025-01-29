import Foundation

struct TextAreaTypography: Codable {
    struct SizeVariation: Codable {
        let title: String
        let text: String
        let innnerTitle: String
        let caption: String
        
        init(title: String, text: String, innnerTitle: String, caption: String) {
            self.title = title
            self.text = text
            self.innnerTitle = innnerTitle
            self.caption = caption
        }
    }
    
    let data: [String: SizeVariation]
    
    init(data: [String : SizeVariation] = [:]) {
        self.data = data
    }
}
