import Foundation
import Combine
import SDDSComponents

class ComponentViewModel<Provider: VariationProvider>: ObservableObject {
    
    @Published var variation: Variation<Provider.Appearance>? {
        didSet {
            if let style = variation?.styles.first {
                self.style = style
            } else if let appearance = variation?.appearance {
                self.appearance = appearance
            }
        }
    }
    @Published var style: AppearanceVariation<Provider.Appearance>? {
        didSet {
            if let appearance = style?.appearance {
                self.appearance = appearance
            }
        }
    }
    @Published var appearance: Provider.Appearance {
        didSet {
            onUpdateAppearance()
        }
    }
    @Published var theme: Theme = .sdddsServTheme {
        didSet {
            self.variationProvider.theme = theme
            self.variation = variationProvider.variations.first
        }
    }
    
    weak var delegate: ViewModelDelegate?
    let variationProvider: Provider
    let componentViewLayoutMode: ComponentViewLayoutMode
    var cancellables: Set<AnyCancellable> = []

    init(variationProvider: Provider, componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        let variations = variationProvider.variations
        let variation = variations.first
        
        self.componentViewLayoutMode = componentViewLayoutMode
        self.variation = variation
        self.style = variation?.styles.first
        self.appearance = variationProvider.defaultValue
        self.variationProvider = variationProvider
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
    
    func selectTheme(_ theme: Theme) {
        self.theme = theme
    }
    
    func selectVariation(_ variation: Variation<Provider.Appearance>?) {
        self.variation = variation
    }
    
    func selectStyle(_ style: AppearanceVariation<Provider.Appearance>) {
        self.style = style
    }
    
    var variations: [Variation<Provider.Appearance>] {
        variationProvider.variations
    }
    
    var styles: [AppearanceVariation<Provider.Appearance>] {
        return variation?.styles ?? []
    }
    
    func onUpdateAppearance() {
        delegate?.updateAppearance()
    }
}

protocol ViewModelDelegate: AnyObject {
    func updateAppearance()
}
