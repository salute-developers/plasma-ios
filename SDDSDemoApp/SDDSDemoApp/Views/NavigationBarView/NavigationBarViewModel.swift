import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSServTheme

final class NavigationBarViewModel: ComponentViewModel<NavigationBarMainPageVariationProvider> {
    @Published var textPlacement: NavigationBarTextPlacement = .bottom
    @Published var textAlign: NavigationBarTextAlign = .center
    @Published var contentPlacement: NavigationBarContentPlacement = .bottom
    @Published var showIcon: Bool = false
    @Published var hasActionLeft: Bool = true
    @Published var hasActionRight: Bool = true
    @Published var titleText: String = "Text"
    @Published var contentText: String = "Content"
    @Published var pageType: NavigationBarPageType = .mainPage {
        didSet {
            if pageType != oldValue {
                updateVariationProvider()
            }
        }
    }
    
    var internalPageViewModel: ComponentViewModel<NavigationBarInternalPageVariationProvider>?
    
    var navigationBarType: NavigationBarType {
        switch pageType {
        case .mainPage:
            return .mainPage(appearance: appearance)
        case .internalPage:
            return .internalPage(appearance: internalPageViewModel?.appearance ?? NavigationBarInternalPageAppearance())
        }
    }
    
    init() {
        let provider = NavigationBarMainPageVariationProvider(theme: .sdddsServTheme)
        super.init(variationProvider: provider)
        
        internalPageViewModel = ComponentViewModel(variationProvider: NavigationBarInternalPageVariationProvider(theme: theme))
        
        if let internalPageViewModel = internalPageViewModel,
           let firstVariation = internalPageViewModel.variations.first {
            internalPageViewModel.selectVariation(firstVariation)
        }
        
        subscribeToInternalPageViewModel()
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
        
        // Очищаем старые подписки
        cancellables.removeAll()
        
        internalPageViewModel = ComponentViewModel(variationProvider: NavigationBarInternalPageVariationProvider(theme: currentTheme))
        
        if let internalPageViewModel = internalPageViewModel,
           let firstVariation = internalPageViewModel.variations.first {
            internalPageViewModel.selectVariation(firstVariation)
        }
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        
        // Подписываемся на новый internalPageViewModel
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
    
    func updateTextPlacement(_ placement: NavigationBarTextPlacement) {
        textPlacement = placement
        
        // Если выбран bottom, то align может быть только center
        if placement == .bottom && textAlign != .center {
            textAlign = .center
        }
        
        // Если выбран inline content, принудительно ставим inline placement и center align
        if contentPlacement == .inline {
            textPlacement = .inline
            textAlign = .center
        }
    }
    
    func updateTextAlign(_ align: NavigationBarTextAlign) {
        textAlign = align
        
        // Left и Right работают только с inline placement
        if (align == .left || align == .right) && textPlacement != .inline {
            textPlacement = .inline
        }
        
        // С inline content только center
        if contentPlacement == .inline {
            textAlign = .center
        }
    }
    
    func updateContentPlacement(_ placement: NavigationBarContentPlacement) {
        contentPlacement = placement
        
        // Inline content только с inline placement и center align
        if placement == .inline {
            textPlacement = .inline
            textAlign = .center
        }
    }
}
