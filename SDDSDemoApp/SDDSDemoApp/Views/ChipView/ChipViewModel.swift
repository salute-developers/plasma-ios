import SwiftUI
import SDDSComponentsPreview
import Combine
import SDDSComponents
import SDDSServTheme

final class ChipViewModel: ObservableObject {
    @Published var title: String = "Chip Title"
    @Published var isEnabled: Bool = true
    @Published var iconImageEnabled: Bool = true
    @Published var buttomImageEnabled: Bool = true
    @Published var size: SDDSChipSize = .medium(.default(8))
    @Published var borderStyle: ChipBorderStyle = .default(8)
    @Published var appearance: ChipAppearance = SDDSChip.accent.appearance
    @Published var variationName: String = SDDSChip.accent.name
    @Published var iconImage: Image? = nil
    @Published var buttonImage: Image? = nil
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setIconImage()
        setButtonImage()
        
        observeSizeChange()
    }
    
    private func observeSizeChange() {
        $size
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                self.appearance = self.appearance.size(value)
            }
            .store(in: &cancellables)
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
    
    func updateBorderStyle(borderStyle: ChipBorderStyle) {
        switch size {
        case .small:
            size = .small(borderStyle)
        case .medium:
            size = .medium(borderStyle)
        case .large:
            size = .large(borderStyle)
        case .extraSmall:
            size = .extraSmall(borderStyle)
        }
    }
}

// MARK: - SDDSChipSize Extensions

extension SDDSChipSize: Hashable, CaseIterable {
    public static var allCases: [SDDSChipSize] {
        [.large(.default(8)), .medium(.default(8)), .small(.default(8)), .extraSmall(.default(8))]
    }

    public var debugDescription: String {
        switch self {
        case .large:
            return "Large"
        case .medium:
            return "Medium"
        case .small:
            return "Small"
        case .extraSmall:
            return "Extra Small"
        }
    }
    
    public var shapeToken: ShapeToken {
        switch self {
        case .large:
            return ShapeToken.roundL
        case .medium:
            return ShapeToken.roundM
        case .small:
            return ShapeToken.roundS
        case .extraSmall:
            return ShapeToken.roundXs
        }
    }
}
