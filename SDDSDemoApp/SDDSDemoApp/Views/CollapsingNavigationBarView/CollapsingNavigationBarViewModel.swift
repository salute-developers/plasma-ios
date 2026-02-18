import Foundation
import Combine
import SwiftUI
import SDDSComponents
import PlasmaHomeDSTheme

final class CollapsingNavigationBarViewModel: ComponentViewModel<CollapsingNavigationBarMainPageVariationProvider> {
    @Published var collapsedTitle: String = "Title"
    @Published var expandedTitle: String = "Title"
    @Published var collapsedDescription: String = "Description"
    @Published var expandedDescription: String = "Description"
    @Published var contentText: String = "Content"
    @Published var hasActionStart: Bool = true
    @Published var hasActionEnd: Bool = true
    @Published var collapsedTextAlign: NavigationBarTextAlign = .center
    @Published var expandedTextAlign: NavigationBarTextAlign = .left
    @Published var centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy = .relative
    @Published var pageType: CollapsingNavigationBarPageType = .mainPage {
        didSet {
            if pageType != oldValue {
                updateVariationProvider()
            }
        }
    }

    let collapsingState = CollapsingNavigationBarState()

    var internalPageViewModel: ComponentViewModel<CollapsingNavigationBarInternalPageVariationProvider>?

    var collapsingNavigationBarAppearance: CollapsingNavigationBarAppearance {
        switch pageType {
        case .mainPage:
            return appearance
        case .internalPage:
            return internalPageViewModel?.appearance ?? CollapsingNavigationBarAppearance()
        }
    }

    init() {
        let provider = CollapsingNavigationBarMainPageVariationProvider(theme: .plasmaHomeDSTheme)
        super.init(variationProvider: provider)

        internalPageViewModel = ComponentViewModel(variationProvider: CollapsingNavigationBarInternalPageVariationProvider(theme: theme))

        if let internalPageViewModel = internalPageViewModel,
           let firstVariation = internalPageViewModel.variations.first {
            internalPageViewModel.selectVariation(firstVariation)
        }

        subscribeToInternalPageViewModel()
        
        theme = .plasmaHomeDSTheme
    }

    private func subscribeToInternalPageViewModel() {
        guard let internalPageViewModel = internalPageViewModel else { return }

        internalPageViewModel.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }

    override func selectTheme(_ theme: Theme) {
        super.selectTheme(theme)
        internalPageViewModel?.selectTheme(theme)
    }

    private func updateVariationProvider() {
        let currentTheme = theme

        cancellables.removeAll()

        internalPageViewModel = ComponentViewModel(variationProvider: CollapsingNavigationBarInternalPageVariationProvider(theme: currentTheme))

        if let internalPageViewModel = internalPageViewModel,
           let firstVariation = internalPageViewModel.variations.first {
            internalPageViewModel.selectVariation(firstVariation)
        }
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }

        subscribeToInternalPageViewModel()
    }

    func selectVariation(at index: Int) {
        switch pageType {
        case .mainPage:
            guard index < variations.count else { return }
            selectVariation(variations[index])
        case .internalPage:
            guard let internalPageViewModel = internalPageViewModel,
                  index < internalPageViewModel.variations.count else { return }
            internalPageViewModel.selectVariation(internalPageViewModel.variations[index])
        }
    }

    func resetToDefaults() {
        collapsedTitle = "Title"
        expandedTitle = "Title"
        collapsedDescription = "Description"
        expandedDescription = "Description"
        contentText = "Content"
        hasActionStart = true
        hasActionEnd = true
        collapsedTextAlign = .center
        expandedTextAlign = .left
        centerAlignmentStrategy = .relative
        pageType = .mainPage
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
