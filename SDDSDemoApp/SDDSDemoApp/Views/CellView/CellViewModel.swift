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
    
    @Published var label: String = ""
    @Published var title: String = ""
    @Published var subtitle: String = ""
    
    @Published var leftContentType: CellContent = .none
    @Published var rightContentType: CellContent = .none

    @Published var disclosureEnabled: Bool = false
    @Published var disclosureText: String = "disclosure"
    
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
                    title: "Label",
                    subtitle: "Description",
                    isOn: .constant(true),
                    isEnabled: false,
                    appearance: appearance.switchAppearance,
                    switchAccessibility: SwitchAccessibility()
                )
        case .radiobox:
                SDDSRadiobox(
                    isSelected: .constant(true),
                    title: "Value",
                    subtitle: "Description",
                    isEnabled: true,
                    images: .defaultImages,
                    appearance: appearance.radioBoxAppearance
                )
        case .checkbox:
                SDDSCheckbox(
                    state: .constant(.indeterminate),
                    title: "Valur",
                    subtitle: "Description",
                    isEnabled: true,
                    images: .checkbox,
                    appearance: appearance.checkBoxAppearance
                )
        case .none:
            EmptyView()
        }
    }
    
    var leftContent: some View {
        addContent(type: leftContentType)
    }
    
    var rightContent: some View {
        addContent(type: rightContentType)
    }
}
