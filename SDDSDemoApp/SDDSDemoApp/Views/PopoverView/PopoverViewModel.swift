import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class PopoverViewModel: ComponentViewModel<PopoverVariationProvider> {
    init() {
        super.init(variationProvider: PopoverVariationProvider())
    }
} 