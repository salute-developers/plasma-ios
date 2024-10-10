import Foundation
import SwiftUI

public extension Image {
    static func image(_ name: String, bundle: Bundle = Bundle(for: Components.self)) -> Image {
        Image(name, bundle: bundle)
    }
}
