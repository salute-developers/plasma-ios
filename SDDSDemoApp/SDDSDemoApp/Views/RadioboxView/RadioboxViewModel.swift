import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview

final class RadioboxViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var isSelected: Bool = false
    @Published var isEnabled: Bool = true
    @Published var size: SelectionControlSizeConfiguration = SDDSRadioboxSize.medium
    @Published var appearance: RadioboxAppearance = .default
    
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
                self?.size = CustomRadioboxSize(
                    imageSize: CGSize(width: width, height: height),
                    horizontalGap: horizontalGap,
                    verticalGap: verticalGap
                )
            }
            .store(in: &cancellables)
    }
}

// Custom Size Configuration
struct CustomRadioboxSize: SelectionControlSizeConfiguration {
    var imageSize: CGSize
    var horizontalGap: CGFloat
    var verticalGap: CGFloat
    
    var debugDescription: String {
        String(reflecting: self)
    }
}

// Extension for Appearance to update colors
extension RadioboxAppearance {
    func withTintColor(_ color: ColorToken?) -> RadioboxAppearance {
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
