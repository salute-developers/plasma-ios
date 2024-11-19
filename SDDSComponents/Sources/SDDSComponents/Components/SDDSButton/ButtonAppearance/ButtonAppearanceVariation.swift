import Foundation

public struct ButtonAppearanceVariation<T> {
    public let appearance: ButtonAppearance
    
    public init(appearance: ButtonAppearance = ButtonAppearance()) {
        self.appearance = appearance
    }
}
