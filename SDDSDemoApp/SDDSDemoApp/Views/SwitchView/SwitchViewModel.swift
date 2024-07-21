import Foundation
import Combine
import SwiftUI
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
                self?.appearance = self?.appearance.withTintColor(style.color.equalToken) ?? .defaultAppearance
            }
            .store(in: &cancellables)
        
        $titleColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withTitleColor(style.color.equalToken) ?? .defaultAppearance
            }
            .store(in: &cancellables)
        
        $subtitleColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withSubtitleColor(style.color.equalToken) ?? .defaultAppearance
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
            enabledTitleColor: enabledTitleColor,
            enabledSubtitleColor: enabledSubtitleColor,
            enabledTintColor: color,
            disabledTitleColor: disabledTitleColor,
            disabledSubtitleColor: disabledSubtitleColor,
            disabledTintColor: color
        )
    }
    
    func withTitleColor(_ color: ColorToken) -> SwitchAppearance {
        .init(
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            enabledTitleColor: color,
            enabledSubtitleColor: enabledSubtitleColor,
            enabledTintColor: enabledTintColor,
            disabledTitleColor: color.withOpacity(0.3),
            disabledSubtitleColor: disabledSubtitleColor,
            disabledTintColor: disabledTintColor
        )
    }
    
    func withSubtitleColor(_ color: ColorToken) -> SwitchAppearance {
        .init(
            titleTypography: titleTypography,
            subtitleTypography: subtitleTypography,
            enabledTitleColor: enabledTitleColor,
            enabledSubtitleColor: color,
            enabledTintColor: enabledTintColor,
            disabledTitleColor: disabledTitleColor,
            disabledSubtitleColor: color.withOpacity(0.3),
            disabledTintColor: disabledTintColor
        )
    }
}
