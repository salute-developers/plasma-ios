import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSComponents

final class SwitchViewModel: ObservableObject {
    // MARK: - Switch Properties
    @Published var title: String = "Switch Title"
    @Published var subtitle: String = "Switch Subtitle"
    @Published var isOn: Bool = true
    @Published var isEnabled: Bool = true
    @Published var size: SwitchSizeConfiguration = SwitchSize()
    @Published var appearance: SwitchAppearance = .defaultAppearance
    @Published var switchAccessibility: SwitchAccessibility = SwitchAccessibility()
    
    // MARK: - Screen properties
    @Published var tintColor: ColorStyle = .green
    @Published var titleColor: ColorStyle = .black
    @Published var subtitleColor: ColorStyle = .gray
    @Published var verticalGap: CGFloat = 0
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        observeColors()
        observeSize()
    }
    
    private func observeColors() {
        $tintColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withTintColor(style.color.token) ?? .defaultAppearance
            }
            .store(in: &cancellables)
        
        $titleColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withTitleColor(style.color.token) ?? .defaultAppearance
            }
            .store(in: &cancellables)
        
        $subtitleColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withSubtitleColor(style.color.token) ?? .defaultAppearance
            }
            .store(in: &cancellables)
    }
    
    private func observeSize() {
        $verticalGap
            .sink { [weak self] gap in
                self?.size = SwitchSize(verticalGap: gap)
            }
            .store(in: &cancellables)
    }
}

// Custom Size Configuration
struct SwitchSize: SwitchSizeConfiguration {
    var debugDescription: String {
        String(reflecting: self)
    }

    var width: CGFloat?
    var verticalGap: CGFloat
    
    init(width: CGFloat? = 170, verticalGap: CGFloat = 0) {
        self.width = width
        self.verticalGap = verticalGap
    }
}

// Extension for Appearance to update colors
extension SwitchAppearance {
    func withTintColor(_ color: ColorToken) -> SwitchAppearance {
        .init(
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: titleColor,
            subtitleColor: subtitleColor,
            tintColor: color,
            disabledAlpha: disabledAlpha
        )
    }
    
    func withTitleColor(_ color: ColorToken) -> SwitchAppearance {
        .init(
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: color,
            subtitleColor: subtitleColor,
            tintColor: tintColor,
            disabledAlpha: disabledAlpha
        )
    }
    
    func withSubtitleColor(_ color: ColorToken) -> SwitchAppearance {
        .init(
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            titleColor: titleColor,
            subtitleColor: color,
            tintColor: tintColor,
            disabledAlpha:  disabledAlpha
        )
    }
}
