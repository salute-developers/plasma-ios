import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

enum CellContentPreview: String, CaseIterable {
    case avatar
    case iconButton
    //    case `switch`
    //    case checkbox
    //    case radiobox
    case text
    case none
}

final class CellViewModel: ObservableObject {
    @Published var appearance: CellAppearance = Cell.l.appearance
    @Published var alignment: CellContentAlignment = .center
    
    @Published var label: String = "label"
    @Published var title: String = "title"
    @Published var subtitle: String = "subtitle"
    
    //MARK: - Cell Content
    @Published var leftContent: AnyView? = nil
    @Published var centerContent: AnyView? = nil
    @Published var rightContent: AnyView? = nil
    
    //MARK: - Disclosure
    @Published var hasDisclosure: Bool = false
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
    
    init() {
        //        self.avatar = SDDSAvatar(
        //            text: "AB",
        //            image: nil,
        //            placeholderImage: nil,
        //            status: .online,
        //            appearance: appearance.avatarAppearance,
        //            accessibility: AvatarAccessibility()
        //        )
        //        self.iconButton = IconButton(
        //            iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
        //            isDisabled: false,
        //            isLoading: false,
        //            spinnerImage: Image.image("spinner"),
        //            appearance: appearance.iconButtonAppearance,
        //            layoutMode: .fixedWidth(.packed),
        //            action: {}
        //        )
        //        self.switch = SDDSSwitch(
        //            title: "",
        //            subtitle: "",
        //            isOn: .constant(true),
        //            isEnabled: true,
        //            appearance: SDDSSwitch.large.default.appearance,
        //            switchAccessibility: SwitchAccessibility()
        //        )
        //        self.checkbox = SDDSCheckbox(
        //            state: .constant(.indeterminate),
        //            title: "Valur",
        //            subtitle: "Description",
        //            isEnabled: true,
        //            images: .checkbox,
        //            appearance: SDDSCheckbox.medium.default.appearance
        //        )
        //        self.radiobox = SDDSRadiobox(
        //            isSelected: .constant(true),
        //            title: "Value",
        //            subtitle: "Description",
        //            isEnabled: true,
        //            images: .defaultImages,
        //            appearance: SDDSRadiobox.medium.default.appearance
        //        )
    }
    
    //MARK: - Add preview in content
    func addView(for content: CellContentPreview) -> AnyView {
        switch content {
        case .avatar:
            AnyView(
                SDDSAvatar(
                    text: "AB",
                    image: .image(Image.image("checker")),
                    placeholderImage: nil,
                    status: .online,
                    appearance: appearance.avatarAppearance,
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
        case .text:
            AnyView(Text(customText))
        case .none:
            AnyView(EmptyView())
        }
    }
}
