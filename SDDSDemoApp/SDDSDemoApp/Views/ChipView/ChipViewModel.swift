import SwiftUI
import Combine
import SDDSComponents
import SDDSservTheme

final class ChipViewModel: ComponentViewModel<ChipVariationProvider> {
    @Published var value: String = "Value"
    @Published var isEnabled: Bool = true
    @Published var iconImageEnabled: Bool = true
    @Published var buttomImageEnabled: Bool = true
    @Published var iconImage: Image? = nil
    @Published var buttonImage: Image? = nil
    
    init() {
        super.init(variationProvider: ChipVariationProvider())
        
        self.setIconImage()
        self.setButtonImage()
    }

    var removeAction: () -> Void {
        { print("Chip removed") }
    }
    
    func setIconImage() {
        iconImage = Image.image("chipIcon")
    }
    
    func setButtonImage() {
        buttonImage = Image.image("chipClose")
    }
}
