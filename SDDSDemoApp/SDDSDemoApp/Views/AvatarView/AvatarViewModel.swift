import SwiftUI
import Combine
import SDDSComponents

final class AvatarViewModel: ComponentViewModel<AvatarVariationProvider> {
    typealias Appearance = AvatarAppearance
    
    @Published var text: String = "AB"
    @Published var image: AvatarImageSource? = .image(Image.image("checker"))
    @Published var placeholderImage: AvatarImageSource? = nil
    @Published var status: AvatarStatus = .online
    @Published var extraPlacement: AvatarExtraPlacement = .topRight
    @Published var accessibility: AvatarAccessibility = AvatarAccessibility()
    @Published var isPlaceholder = false
    @Published var isBadgeEnabled = false {
        didSet {
            if isBadgeEnabled {
                isCounterEnabled = false
            }
        }
    }
    @Published var isCounterEnabled = false {
        didSet {
            if isCounterEnabled {
                isBadgeEnabled = false
            }
        }
    }
    @Published var badgeViewModel = BadgeViewModel(componentViewLayoutMode: .subScreen)
    @Published var counterViewModel = CounterViewModel(componentViewLayoutMode: .subScreen)

    init() {
        super.init(variationProvider: AvatarVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        
        badgeViewModel.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        
        counterViewModel.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}

extension AvatarStatus: @retroactive CaseIterable, @retroactive Identifiable {
    public var id: String { rawValue }

    public static var allCases: [AvatarStatus] {
        [.hidden, .online, .offline]
    }
}
