import Foundation

struct PaletteAlias {
    let palette: String
    let color: String
    let tone: String
    
    init?(alias: String) {
        let begin = String(alias.first ?? Character(""))
        let end = String(alias.last ?? Character(""))
        guard begin == AliasFormat.begin.rawValue && end == AliasFormat.end.rawValue else {
            return nil
        }
        
        var alias = alias
        for format in AliasFormat.allCases {
            alias = alias.replacingOccurrences(of: format.rawValue, with: "")
        }
        
        let components = alias.components(separatedBy: ".")
        guard components.count == 3 else {
            return nil
        }
        
        palette = components[0]
        color = components[1]
        tone = components[2]
    }
}
