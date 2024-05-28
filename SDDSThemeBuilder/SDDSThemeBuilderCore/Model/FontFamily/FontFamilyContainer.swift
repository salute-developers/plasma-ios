import Foundation

struct FontFamiliesContainer: Codable {
    let items: [FontFamily.Key: FontFamily]
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: FontFamily.Key.self)
            var items = [FontFamily.Key: FontFamily]()
            
            for key in container.allKeys {
                let category = try container.decode(FontFamily.self, forKey: key)
                items[key] = category
            }
            
            self.items = items
        } catch {
            print(error)
            fatalError()
        }
    }
}
