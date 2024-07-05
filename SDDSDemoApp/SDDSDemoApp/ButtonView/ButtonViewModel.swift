import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class ButtonViewModel: ObservableObject {
    @Published var buttonViewModel: SDDSButtonViewModel
    @Published var isIconVisible: Bool = false
    @Published var alignment: SDDSComponents.Alignment = .left
    @Published var colorStyle: SolidColorStyle = .black
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(buttonViewModel: SDDSButtonViewModel = SDDSButtonViewModel(appearance: .black)) {
        self.buttonViewModel = buttonViewModel
            
        observeButtonViewModelValues()
        observeIcon()
        observeColorStyle()
    }
    
    private func observeButtonViewModelValues() {
        buttonViewModel.$size
            .combineLatest(buttonViewModel.$layoutMode)
            .combineLatest(buttonViewModel.$iconAttributes)
            .combineLatest(buttonViewModel.$buttonStyle)
            .combineLatest(buttonViewModel.$appearance)
            .combineLatest(buttonViewModel.$spinnerStyle)
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
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
                    self.buttonViewModel.iconAttributes = nil
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
        buttonViewModel.iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.Alignment) -> ButtonIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
        
    private func applyColorStyle(_ colorStyle: SolidColorStyle) {
        let black = ButtonAppearance.black
        
        buttonViewModel.appearance = .init(
            titleTypography: black.titleTypography,
            titleColor: colorStyle.primaryTextColor.equalToken,
            subtitleTypography: black.subtitleTypography,
            subtitleColor: black.subtitleColor,
            iconColor: colorStyle.primaryTextColor.equalToken,
            spinnerColor: colorStyle.spinnerColor.equalToken,
            backgroundColor: colorStyle.suiColor.equalToken
        )
    }
}

extension ButtonViewModel {
    var isNotEquilateral: Bool {
        switch buttonViewModel.buttonStyle {
        case .basic:
            true
        case .square, .circle:
            false
        }
    }
}
