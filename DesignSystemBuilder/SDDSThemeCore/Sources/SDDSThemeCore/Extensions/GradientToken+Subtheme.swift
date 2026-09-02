import Foundation

public extension GradientToken {
    func tokenIdentifier(for subtheme: Subtheme) -> String {
        return id.tokenIdentifier(for: subtheme)
    }
}
