import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme
import PlasmaB2CTheme

enum Theme {
    case sddsServ
    case plasmaB2C
}

extension Theme {
    var chips: [AppearanceVariation<ChipAppearance>] {
        switch self {
        case .sddsServ:
            return SDDSServTheme.SDDSChip.all
        case .plasmaB2C:
            return PlasmaB2CTheme.SDDSChip.all
        }
    }
    
    var chipSizes: [ChipSizeConfiguration] {
        switch self {
        case .sddsServ:
            return SDDSServTheme.SDDSChipSize.allCases
        case .plasmaB2C:
            return PlasmaB2CTheme.SDDSChipSize.allCases
        }
    }
}

let variations = Theme.sddsServ.chips // вернет чипы всех цветов для темы sddsServ
let sizes = Theme.sddsServ.chipSizes // вернет всевозможные размеры чипов для темы sddsServ

final class ChipViewModel: ObservableObject {
    @Published var title: String = "Chip Title"
    @Published var isEnabled: Bool = true
    @Published var iconImageEnabled: Bool = true
    @Published var buttomImageEnabled: Bool = true
    @Published var size: SDDSServTheme.SDDSChipSize = .medium
    @Published var shapeStyle: ComponentShapeStyle = .cornered
    @Published var appearance: ChipAppearance = SDDSServTheme.SDDSChip.accent.appearance
    @Published var variationName: String = SDDSServTheme.SDDSChip.accent.name
    @Published var iconImage: Image? = nil
    @Published var buttonImage: Image? = nil
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setIconImage()
        setButtonImage()
        observeSizeChange()
        observeShapeStyleChange()
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
    
    private func observeShapeStyleChange() {
        $shapeStyle
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                self.appearance = self.appearance.shapeStyle(value)
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
    
    func updateBorderStyle(borderStyle: ComponentShapeStyle) {        
        appearance = appearance.shapeStyle(borderStyle)
    }
}

// MARK: - SDDSChipSize Extensions

extension SDDSServTheme.SDDSChipSize: Hashable, CaseIterable {
    public static var allCases: [SDDSServTheme.SDDSChipSize] {
        [.large, .medium, .small, .extraSmall]
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
        fatalError()
//        switch self {
//        case .large:
//            return SDDSServTheme.ShapeToken.roundL
//        case .medium:
//            return SDDSServTheme.ShapeToken.roundM
//        case .small:
//            return SDDSServTheme.ShapeToken.roundS
//        case .extraSmall:
//            return SDDSServTheme.ShapeToken.roundXs
//        }
    }
}
