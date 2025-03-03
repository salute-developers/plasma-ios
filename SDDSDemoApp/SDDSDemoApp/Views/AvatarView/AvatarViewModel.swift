import SwiftUI
import Combine
import SDDSComponents

final class AvatarViewModel: ComponentViewModel<AvatarVariationProvider> {
    typealias Appearance = AvatarAppearance
    
    @Published var text: String = "AB"
    @Published var image: AvatarImageSource? = nil
    @Published var placeholderImage: AvatarImageSource? = nil
    @Published var status: AvatarStatus = .online
    @Published var accessibility: AvatarAccessibility = AvatarAccessibility()
    @Published var isPlaceholder = false

    init() {
        super.init(variationProvider: AvatarVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}



extension AvatarStatus: @retroactive CaseIterable, @retroactive Identifiable {
    public var id: String { rawValue }

    public static var allCases: [AvatarStatus] {
        [.hidden, .online, .offline]
    }
}
