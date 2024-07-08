import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class ButtonViewModel: ObservableObject {
    // MARK: - Button Properties
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var size: ButtonSizeConfiguration = ButtonSize.medium
    @Published var isDisabled: Bool = false
    @Published var isLoading: Bool = false
    @Published var spinnerImage: Image = Image("spinner", bundle: Bundle(for: Components.self))
    @Published var spinnerStyle: SpinnerStyle = .solid
    @Published var buttonStyle: SDDSComponents.ButtonStyle = .basic
    @Published var appearance: ButtonAppearance = .black
    @Published var layoutMode: ButtonLayoutMode = .wrapContent
    
    // MARK: - Screen properties
    @Published var isIconVisible: Bool = false
    @Published var alignment: SDDSComponents.Alignment = .left
    @Published var colorStyle: SolidColorStyle = .black
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeIcon()
        observeColorStyle()
    }

    private func observeIcon() {
        $isIconVisible
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                if value {
                    self.setIconAttributes(alignment: self.alignment)
                } else {
                    self.iconAttributes = nil
                }
            }
            .store(in: &cancellables)
        
        $alignment
            .sink { [weak self] value in
                guard let self = self, isIconVisible else {
                    return
                }
                self.setIconAttributes(alignment: value)
            }
            .store(in: &cancellables)
    }
    
    private func observeColorStyle() {
        $colorStyle
            .sink { [weak self] value in
                self?.applyColorStyle(value)
            }
            .store(in: &cancellables)
    }
    
    private func setIconAttributes(alignment: SDDSComponents.Alignment) {
        iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.Alignment) -> ButtonIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
        
    private func applyColorStyle(_ colorStyle: SolidColorStyle) {
        let black = ButtonAppearance.black
        
        appearance = .init(
            titleTypography: black.titleTypography,
            titleColor: colorStyle.primaryTextColor.equalToken,
            subtitleTypography: black.subtitleTypography,
            subtitleColor: colorStyle.secondaryTextColor.equalToken,
            iconColor: colorStyle.primaryTextColor.equalToken,
            spinnerColor: colorStyle.spinnerColor.equalToken,
            backgroundColor: colorStyle.suiColor.equalToken
        )
    }
}

extension ButtonViewModel {
    var isNotEquilateral: Bool {
        switch buttonStyle {
        case .basic:
            true
        case .square, .circle:
            false
        @unknown default:
            fatalError()
        }
    }
}
