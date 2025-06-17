import Foundation

final class RectSkeletonViewModel: ComponentViewModel<RectSkeletonVariationProvider> {
    init() {
        super.init(variationProvider: RectSkeletonVariationProvider())
    }
} 