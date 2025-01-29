import Foundation

struct TextAreaClearTypography: Codable {
    struct SizeVariation: Codable {
        let title: String
        let text: String
        let innnerTitle: String
        let caption: String
        let counter: String
        
        init(title: String, text: String, innnerTitle: String, caption: String, counter: String) {
            self.title = title
            self.text = text
            self.innnerTitle = innnerTitle
            self.caption = caption
            self.counter = counter
        }
    }
    
    let data: [String: SizeVariation]
    
    init(data: [String : SizeVariation] = [:]) {
        self.data = data
    }
}
