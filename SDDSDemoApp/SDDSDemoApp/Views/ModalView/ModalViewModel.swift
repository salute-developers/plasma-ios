import Foundation
import SDDSComponents
import SDDSThemeCore

final class ModalViewModel: ComponentViewModel<ModalVariationProvider> {
    @Published var hasClose: Bool = true
    @Published var useNativeBlackout: Bool = false
    
    init() {
        super.init(variationProvider: ModalVariationProvider())
    }
}
