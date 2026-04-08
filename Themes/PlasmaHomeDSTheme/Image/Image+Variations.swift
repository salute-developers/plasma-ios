import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<Image, ImageAppearance> {
    var variation: Variation<ImageAppearance> {
        .init(originalVariation: self, styles: [], name: name, appearance: appearance)
    }
}
