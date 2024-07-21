import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class CheckboxViewModel: ObservableObject {
    // MARK: - Checkbox Properties
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var state: SelectionControlState = .deselected
    @Published var isEnabled: Bool = true
    @Published var size: SelectionControlSizeConfiguration = SDDSCheckboxSize()
    @Published var appearance: CheckboxAppearance = .defaultExample
    
    // MARK: - Screen properties
    @Published var tintColor: ColorStyle = .green
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
                self?.appearance = self?.appearance.withTintColor(style.color.equalToken) ?? .defaultExample
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
    static var defaultExample: CheckboxAppearance {
        .init(
            titleTypography: .semibold16,
            subtitleTypography: .semibold14,
            enabledTitleColor: .blackTitleColor,
            enabledSubtitleColor: .subtitleColor,
            disabledTitleColor: .blackTitleColor.withOpacity(0.3),
            disabledSubtitleColor: .subtitleColor.withOpacity(0.3),
            disabledImageAlpha: 0.3,
            imageTintColor: .greenColor
        )
    }
    
    func withTintColor(_ color: ColorToken) -> CheckboxAppearance {
        .init(
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            enabledTitleColor: enabledTitleColor,
            enabledSubtitleColor: enabledSubtitleColor,
            disabledTitleColor: disabledTitleColor,
            disabledSubtitleColor: disabledSubtitleColor,
            disabledImageAlpha: disabledImageAlpha,
            imageTintColor: color
        )
    }
}

enum ColorStyle: String, CaseIterable {
    case blue, green, red, gray, black
    
    var color: Color {
        switch self {
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
