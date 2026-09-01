import Foundation

public extension ColorToken {
    func tokenIdentifier(for subtheme: Subtheme) -> String {
        return id.tokenIdentifier(for: subtheme)
    }
}
