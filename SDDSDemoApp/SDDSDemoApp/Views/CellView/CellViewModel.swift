import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

enum CellContent: String, CaseIterable {
    case avatar
    case iconButton
    case `switch`
    case checkbox
    case radiobox
    case none
}

final class CellViewModel: ComponentViewModel<CellVariationProvider> {
    @Published var alignment: CellContentAlignment = .center
    
    @Published var label: String = "label"
    @Published var title: String = "title"
    @Published var subtitle: String = "subtitle"
    
    @Published var leftContentType: CellContent = .avatar
    @Published var rightContentType: CellContent = .iconButton

    @Published var disclosureEnabled: Bool = true
    @Published var disclosureText: String = ""
   
    @Published var isOn: Bool = false
    @Published var isSelected: Bool = false
    @Published var state: SelectionControlState = .deselected
    
    init() {
        super.init(variationProvider: CellVariationProvider())
    }
    
    @ViewBuilder
    func addContent(type: CellContent) -> some View {
        switch type {
        case .avatar:
                SDDSAvatar(
                    text: "AB",
                    image: nil,
                    placeholderImage: nil,
                    status: .online,
                    appearance: appearance.avatarAppearance,
                    accessibility: AvatarAccessibility()
                )
        case .iconButton:
                IconButton(
                    iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
                    isDisabled: false,
                    isLoading: false,
                    spinnerImage: Image.image("spinner"),
                    appearance: appearance.iconButtonAppearance,
                    layoutMode: .fixedWidth(.packed),
                    action: {}
                )
        case .switch:
                SDDSSwitch(
                    title: "",
                    subtitle: "",
                    isOn: Binding(get: { self.isOn }, set: { newValue in self.isOn = newValue }),
                    isEnabled: true,
                    appearance: appearance.switchAppearance,
                    switchAccessibility: SwitchAccessibility()
                )
        case .radiobox:
                SDDSRadiobox(
                    isSelected: Binding(get: { self.isSelected }, set: { newValue in self.isSelected = newValue }),
                    title: "",
                    subtitle: "",
                    isEnabled: true,
                    images: .defaultImages,
                    appearance: appearance.radioBoxAppearance
                )
        case .checkbox:
                SDDSCheckbox(
                    state: Binding(get: { self.state }, set: { newValue in self.state = newValue }),
                    title: "",
                    subtitle: "",
                    isEnabled: true,
                    images: .checkbox,
                    appearance: appearance.checkBoxAppearance
                )
        case .none:
            EmptyView()
        }
    }
}
