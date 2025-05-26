import Foundation

final class DividerViewModel: ComponentViewModel<DividerVariationProvider> {
   init() {
       super.init(variationProvider: DividerVariationProvider())
   }
}
