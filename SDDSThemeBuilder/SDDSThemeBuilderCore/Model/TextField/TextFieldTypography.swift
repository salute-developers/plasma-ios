import Foundation

struct TextFieldTypography {
    struct SizeClass {
        let title: String
        let text: String
        let innnerTitle: String
        let caption: String
        
        init(title: String = "", text: String = "", innnerTitle: String = "", caption: String = "") {
            self.title = title
            self.text = text
            self.innnerTitle = innnerTitle
            self.caption = caption
        }
    }
    
    let data: [String: SizeClass]
    
    init(data: [String : SizeClass] = [:]) {
        self.data = data
    }
}
