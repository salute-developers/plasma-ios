import Foundation
import Combine
import SDDSComponents

class ComponentViewModel<Provider: VariationProvider>: ObservableObject {
    @Published var variation: Variation<Provider.Appearance>? {
        didSet {
            self.style = variation?.styles.first
        }
    }
    @Published var style: AppearanceVariation<Provider.Appearance>? {
        didSet {
            if let appearance = style?.appearance {
                self.appearance = appearance
            }
        }
    }
    @Published var appearance: Provider.Appearance

    let variationProvider: Provider
    var cancellables: Set<AnyCancellable> = []

    init(variationProvider: Provider) {
        let variations = variationProvider.variations
        let variation = variations.first
        
        self.variation = variation
        self.style = variation?.styles.first
        self.appearance = variationProvider.defaultValue
        self.variationProvider = variationProvider
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
}
