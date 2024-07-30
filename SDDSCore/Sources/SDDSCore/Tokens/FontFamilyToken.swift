import Foundation

public struct FontFamilyToken {
    public enum Heading: String {
        case display
        case header
        case text
    }
    
    public let heading: Heading
    public let name: String
}
