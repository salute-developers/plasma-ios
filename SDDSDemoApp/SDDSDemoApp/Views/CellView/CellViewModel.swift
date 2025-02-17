import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

enum CellContentPreview: String, CaseIterable {
    case avatar
    case iconButton
    case `switch`
//    case checkbox
//    case radiobox
    case text
    case none
}

final class CellViewModel: ObservableObject {
    @Published var alignment: CellContentAlignment = .center
    @Published var appearance: CellAppearance = Cell.l.appearance
    
    @Published var label: String = "label"
    @Published var title: String = "title"
    @Published var subtitle: String = "subtitle"
    
    //MARK: - Cell Content
    @Published var leftContent: AnyView? = nil
    @Published var centerContent: AnyView? = nil
    @Published var rightContent: AnyView? = nil
    
    //MARK: - Disclosure
    @Published var hasDisclosure: Bool = false {
        didSet {
            setDisclosureIcon()
        }
    }
    @Published var disclosure: AnyView? = nil
    @Published var disclosureText: String = ""
    @Published var disclosureIcon: Image? = nil
    
    //MARK: - Cell content elements
    @Published var contentLeftPreview: CellContentPreview = .none {
        didSet {
            leftContent = addView(for: contentLeftPreview)
        }
    }
    @Published var contentCenterPreview: CellContentPreview = .none {
        didSet {
            centerContent = addView(for: contentCenterPreview)
        }
    }
    @Published var contentRightPreview: CellContentPreview = .none {
        didSet {
            rightContent = addView(for: contentRightPreview)
        }
    }
    
    //MARK: - Additional views
    @Published var customText: String = "Custom text"
    
    init() {}
    
    //MARK: - Add preview in content
    func addView(for content: CellContentPreview) -> AnyView {
        switch content {
        case .avatar:
            AnyView(
                SDDSAvatar(
                    text: "AB",
                    image: nil,
                    placeholderImage: nil,
                    status: .online,
                    appearance: SDDSAvatar.default.large.appearance,
                    accessibility: AvatarAccessibility()
                )
            )
        case .iconButton:
            AnyView(
                IconButton(
                    iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
                    isDisabled: false,
                    isLoading: false,
                    spinnerImage: Image.image("spinner"),
                    appearance: appearance.iconButtonAppearance,
                    layoutMode: .fixedWidth(.packed),
                    action: {}
                )
            )
        case .switch:
            AnyView(
                SDDSSwitch(
                    title: "Label",
                    subtitle: "Description",
                    isOn: .constant(true),
                    isEnabled: false,
                    appearance: appearance.switchAppearance,
                    switchAccessibility: SwitchAccessibility()
                )
            )
//        case .radiobox:
//            AnyView(
//                SDDSRadiobox(
//                    isSelected: .constant(true),
//                    title: "Value",
//                    subtitle: "Description",
//                    isEnabled: true,
//                    images: .defaultImages,
//                    appearance: SDDSRadiobox.medium.default.appearance
//                )
//            )
//        case .checkbox:
//            AnyView(
//                SDDSCheckbox(
//                    state: .constant(.indeterminate),
//                    title: "Valur",
//                    subtitle: "Description",
//                    isEnabled: true,
//                    images: .checkbox,
//                    appearance: SDDSCheckbox.medium.default.appearance
//                )
//            )
        case .text:
            AnyView(Text(customText))
        case .none:
            AnyView(EmptyView())
        }
    }
    
    //MARK: - Set Disclosure
    private func setDisclosureIcon () {
        if hasDisclosure {
            disclosureText = "disclosure"
            disclosureIcon = Image(systemName: "arrow.right.to.line.compact")
        } else {
            disclosureIcon = nil
            disclosureText = ""
        }
    }
}
