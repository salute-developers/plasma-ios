import SwiftUI
import SDDSComponents
import SDDSServTheme

final class ButtonGroupViewModel: ComponentViewModel<ButtonGroupVariationProvider> {
    @Published var buttons: [ButtonData] = [] {
        didSet {
            guard buttons.isEmpty else {
                return
            }
            self.selectVariation(variations.first)
        }
    }
    @Published var buttonGroupType: SDDSButtonGroupType = .basic {
        didSet {
            self.variationProvider.buttonGroupType = buttonGroupType
            self.selectVariation(variations.first)
            updateButtonsAppearance()
        }
    }
    @Published var layout: ButtonGroupLayout = .horizontal
    @Published var iconEnabled: Bool = true
    @Published var subtitleEnabled: Bool = true
    @Published var value: String = "Button"
    @Published var subtitleValue: String = "Subtitle"
    
    var currentAppearance: ButtonGroupAppearance {
        appearance
    }
    
    init() {
        super.init(variationProvider: ButtonGroupVariationProvider(buttonGroupType: .basic))
    }
    
    func addButton() {
        let newButton: ButtonData
        
        switch buttonGroupType {
        case .basic:
            newButton = ButtonData(
                title: value,
                subtitle: subtitleEnabled ? subtitleValue : "",
                iconAttributes: iconEnabled ? ButtonIconAttributes(image: Image("buttonIcon"), alignment: .leading) : nil,
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image("spinner", bundle: Bundle(for: Components.self)),
                buttonStyle: .basic,
                appearance: appearance.buttonAppearance ?? ButtonAppearance(),
                layoutMode: .wrapContent,
                accessibility: ButtonAccessibility(),
                isSelected: false,
                action: {}
            )
        case .icon:
            newButton = ButtonData(
                title: "",
                subtitle: "",
                iconAttributes: ButtonIconAttributes(image: Image("buttonIcon"), alignment: .leading),
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image("spinner", bundle: Bundle(for: Components.self)),
                buttonStyle: .icon,
                appearance: appearance.buttonAppearance ?? ButtonAppearance(),
                layoutMode: .wrapContent,
                accessibility: ButtonAccessibility(),
                isSelected: false,
                action: {}
            )
        }
        
        buttons.append(newButton)
    }
    
    func updateButtonTitle(at index: Int, with newTitle: String) {
        guard buttons.indices.contains(index) else { return }
        var updatedButton = buttons[index]
        
        updatedButton = ButtonData(
            title: newTitle,
            subtitle: updatedButton.subtitle,
            iconAttributes: updatedButton.iconAttributes,
            isDisabled: updatedButton.isDisabled,
            isLoading: updatedButton.isLoading,
            spinnerImage: updatedButton.spinnerImage,
            buttonStyle: updatedButton.buttonStyle,
            appearance: updatedButton.appearance,
            layoutMode: updatedButton.layoutMode,
            accessibility: updatedButton.accessibility,
            isSelected: updatedButton.isSelected,
            action: updatedButton.action
        )
        buttons[index] = updatedButton
    }
    
    func updateButtonSubtitle(at index: Int, with newSubtitle: String) {
        guard buttons.indices.contains(index) else { return }
        var updatedButton = buttons[index]
        
        updatedButton = ButtonData(
            title: updatedButton.title,
            subtitle: newSubtitle,
            iconAttributes: updatedButton.iconAttributes,
            isDisabled: updatedButton.isDisabled,
            isLoading: updatedButton.isLoading,
            spinnerImage: updatedButton.spinnerImage,
            buttonStyle: updatedButton.buttonStyle,
            appearance: updatedButton.appearance,
            layoutMode: updatedButton.layoutMode,
            accessibility: updatedButton.accessibility,
            isSelected: updatedButton.isSelected,
            action: updatedButton.action
        )
        buttons[index] = updatedButton
    }
    
    func removeButton(at index: Int) {
        guard buttons.indices.contains(index) else { return }
        buttons.remove(at: index)
    }
    
    override func onUpdateAppearance() {
        for index in buttons.indices {
            var updatedButton = buttons[index]
            let buttonAppearance = appearance.buttonAppearance ?? ButtonAppearance()
            
            updatedButton = ButtonData(
                title: updatedButton.title,
                subtitle: updatedButton.subtitle,
                iconAttributes: updatedButton.iconAttributes,
                isDisabled: updatedButton.isDisabled,
                isLoading: updatedButton.isLoading,
                spinnerImage: updatedButton.spinnerImage,
                buttonStyle: updatedButton.buttonStyle,
                appearance: buttonAppearance,
                layoutMode: updatedButton.layoutMode,
                accessibility: updatedButton.accessibility,
                isSelected: updatedButton.isSelected,
                action: updatedButton.action
            )
            buttons[index] = updatedButton
        }
    }
    
    private func updateButtonsAppearance() {
        for index in buttons.indices {
            var updatedButton = buttons[index]
            let buttonAppearance = appearance.buttonAppearance ?? ButtonAppearance()
            let newButtonStyle: SDDSComponents.ButtonStyle = buttonGroupType == .basic ? .basic : .icon
            
            updatedButton = ButtonData(
                title: updatedButton.title,
                subtitle: updatedButton.subtitle,
                iconAttributes: updatedButton.iconAttributes,
                isDisabled: updatedButton.isDisabled,
                isLoading: updatedButton.isLoading,
                spinnerImage: updatedButton.spinnerImage,
                buttonStyle: newButtonStyle,
                appearance: buttonAppearance,
                layoutMode: updatedButton.layoutMode,
                accessibility: updatedButton.accessibility,
                isSelected: updatedButton.isSelected,
                action: updatedButton.action
            )
            buttons[index] = updatedButton
        }
    }
}
