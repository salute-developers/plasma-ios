import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class ButtonViewModel: ObservableObject {
    // MARK: - Button Properties
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var size: ButtonSizeConfiguration = BasicButtonSize.medium
    @Published var isDisabled: Bool = false
    @Published var isLoading: Bool = false
    @Published var spinnerImage: Image = Image("spinner", bundle: Bundle(for: ButtonViewModel.self))
    @Published var buttonStyle: SDDSComponents.ButtonStyle = .basic
    @Published var appearance: ButtonAppearance = BasicButton.default.appearance
    @Published var variationName: String = BasicButton.default.name
    @Published var layoutMode: ButtonLayoutMode = .wrapContent
    
    @Published var buttonType: SDDSButtonType = .basic
    
    // MARK: - Screen properties
    @Published var isIconVisible: Bool = false
    @Published var isPilled: Bool = false
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading
    @Published var colorStyle: SDDSServeB2CStyle = .accent
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeIcon()
        observeSizeChange()
        observeTypeChange()
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
        
        $isPilled
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                if value {
                    self.appearance = self.appearance.shapeStyle(.pilled)
                } else {
                    self.appearance = self.appearance.shapeStyle(.cornered)
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
    
    private func observeTypeChange() {
        $buttonType
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                switch value {
                case .basic:
                    self.appearance = BasicButton.default.appearance
                    self.variationName = BasicButton.default.name
                    self.size = BasicButtonSize.medium
                case .link:
                    self.appearance = LinkButton.default.appearance
                    self.variationName = LinkButton.default.name
                    self.size = LinkButtonSize.medium
                case .icon:
                    self.appearance = IconButton.default.appearance
                    self.variationName = IconButton.default.name
                    self.size = IconButtonSize.medium
                }
            }
            .store(in: &cancellables)
    }
    
    private func setIconAttributes(alignment: SDDSComponents.ButtonAlignment) {
        iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.ButtonAlignment) -> ButtonIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
}
