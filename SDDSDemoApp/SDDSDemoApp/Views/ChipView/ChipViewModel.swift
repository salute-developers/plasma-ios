import SwiftUI
import SDDSComponentsPreview
import Combine
import SDDSComponents
import SDDSServTheme

final class ChipViewModel: ObservableObject {
    @Published var title: String = "Chip Title"
    @Published var isEnabled: Bool = true
    @Published var size: SDDSChipSize = .medium(.default(8))
    @Published var borderStyle: ChipBorderStyle = .default(8)
    @Published var appearance: ChipAppearance = .default

    var removeAction: () -> Void {
        { print("Chip removed") }
    }
}

// MARK: - ChipAppearance Extensions

extension ChipAppearance: CaseIterable {
    public static var allCases: [ChipAppearance] {
        [.default]
    }

    public var name: String {
        return "Default"
    }
}

// MARK: - SDDSChipSize Extensions

extension SDDSChipSize: CaseIterable {
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
