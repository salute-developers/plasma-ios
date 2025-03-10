import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class IndicatorViewModel: ComponentViewModel<IndicatorVariationProvider> {    
    init() {
        super.init(variationProvider: IndicatorVariationProvider())
    }
}
