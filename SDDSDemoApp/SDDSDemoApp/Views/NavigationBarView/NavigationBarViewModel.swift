import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class NavigationBarViewModel: ObservableObject {
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
            updateVariationProvider()
        }
    }
    @Published var theme: Theme = .sdddsServTheme {
        didSet {
            updateVariationProvider()
        }
    }
    
    private var mainPageViewModel: ComponentViewModel<NavigationBarMainPageVariationProvider>!
    private var internalPageViewModel: ComponentViewModel<NavigationBarInternalPageVariationProvider>!
    
    var navigationBarType: NavigationBarType {
        switch pageType {
        case .mainPage:
            if let appearance = mainPageViewModel.appearance as? NavigationBarMainPageAppearance {
                return .mainPage(appearance: appearance)
            }
            return .mainPage(appearance: NavigationBarMainPageAppearance())
        case .internalPage:
            if let appearance = internalPageViewModel.appearance as? NavigationBarInternalPageAppearance {
                return .internalPage(appearance: appearance)
            }
            return .internalPage(appearance: NavigationBarInternalPageAppearance())
        }
    }
    
    var variations: [String] {
        switch pageType {
        case .mainPage:
            return mainPageViewModel.variations.map { $0.name }
        case .internalPage:
            return internalPageViewModel.variations.map { $0.name }
        }
    }
    
    var currentVariationName: String {
        switch pageType {
        case .mainPage:
            return mainPageViewModel.variation?.name ?? "Default"
        case .internalPage:
            return internalPageViewModel.variation?.name ?? "Default"
        }
    }
    
    init() {
        mainPageViewModel = ComponentViewModel(variationProvider: NavigationBarMainPageVariationProvider(theme: theme))
        internalPageViewModel = ComponentViewModel(variationProvider: NavigationBarInternalPageVariationProvider(theme: theme))
        
        if let firstVariation = mainPageViewModel.variations.first {
            mainPageViewModel.selectVariation(firstVariation)
        }
        if let firstVariation = internalPageViewModel.variations.first {
            internalPageViewModel.selectVariation(firstVariation)
        }
    }
    
    private func updateVariationProvider() {
        mainPageViewModel = ComponentViewModel(variationProvider: NavigationBarMainPageVariationProvider(theme: theme))
        internalPageViewModel = ComponentViewModel(variationProvider: NavigationBarInternalPageVariationProvider(theme: theme))
        
        if let firstVariation = mainPageViewModel.variations.first {
            mainPageViewModel.selectVariation(firstVariation)
        }
        if let firstVariation = internalPageViewModel.variations.first {
            internalPageViewModel.selectVariation(firstVariation)
        }
    }
    
    func selectVariation(at index: Int) {
        switch pageType {
        case .mainPage:
            guard index < mainPageViewModel.variations.count else { return }
            mainPageViewModel.selectVariation(mainPageViewModel.variations[index])
        case .internalPage:
            guard index < internalPageViewModel.variations.count else { return }
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
