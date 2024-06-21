import Foundation

final class TemplateRendererError: NSError {
    let text: String
    
    init(_ text: String) {
        self.text = text
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var localizedDescription: String {
        text
    }
}

