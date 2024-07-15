import Foundation
import SwiftUI

extension Image {
    static func image(_ name: String) -> Image {
        Image(name, bundle: Bundle(for: Components.self))
    }
}
