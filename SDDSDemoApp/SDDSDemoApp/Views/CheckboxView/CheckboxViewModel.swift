import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview

final class CheckboxViewModel: ObservableObject {
    // MARK: - Checkbox Properties
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var state: SelectionControlState = .deselected
    @Published var isEnabled: Bool = true
    @Published var size: SelectionControlSizeConfiguration = SDDSCheckboxSize.medium
    @Published var appearance: CheckboxAppearance = CheckboxAppearance.default
    
    // MARK: - Screen properties
    @Published var tintColor: ColorStyle = .none
    @Published var imageWidth: CGFloat = 20
    @Published var imageHeight: CGFloat = 20
    @Published var horizontalGap: CGFloat = 8
    @Published var verticalGap: CGFloat = 0
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeColors()
        observeSize()
    }
    
    private func observeColors() {
        $tintColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withTintColor(style == .none ? nil : style.color.token) ?? .default
            }
            .store(in: &cancellables)
    }
    
    private func observeSize() {
        Publishers.CombineLatest3($imageWidth, $imageHeight, $horizontalGap)
            .combineLatest($verticalGap)
            .sink { [weak self] (sizeValues, verticalGap) in
                let (width, height, horizontalGap) = sizeValues
                self?.size = CustomCheckboxSize(
                    imageSize: CGSize(width: width, height: height),
                    horizontalGap: horizontalGap,
                    verticalGap: verticalGap
                )
            }
            .store(in: &cancellables)
    }
}

// Custom Size Configuration
struct CustomCheckboxSize: SelectionControlSizeConfiguration {
    var imageSize: CGSize
    var horizontalGap: CGFloat
    var verticalGap: CGFloat
    
    var debugDescription: String {
        String(reflecting: self)
    }
}

// Extension for Appearance to update colors
extension CheckboxAppearance {
    func withTintColor(_ color: ColorToken?) -> CheckboxAppearance {
        .init(
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: titleColor,
            subtitleColor: subtitleColor,
            disabledAlpha: disabledAlpha,
            imageTintColor: color
        )
    }
}

enum ColorStyle: String, CaseIterable {
    case none, blue, green, red, gray, black
    
    var color: Color {
        switch self {
        case .none:
            return .clear
        case .blue:
            return .blue
        case .green:
            return .green
        case .red:
            return .red
        case .gray:
            return .gray
        case .black:
            return .black
        }
    }
}
