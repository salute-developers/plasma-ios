import Foundation
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

enum CellContentPreview: String, CaseIterable {
    case avatar
    case icon
    case `switch`
//    case checkbox
//    case radiobox
    case text
    case none
}

final class CellViewModel: ObservableObject {
    //MARK: - Content left
    @Published var leftContent: CellContentLeft = CellContentLeft()
    
    //MARK: - Content center
    @Published var centerContent: CellContentCenter = CellContentCenter()
    @Published var contentCenterPreview: CellContentPreview = .none {
        didSet {
            updateView(in: &leftContent.contentView, for: contentCenterPreview)
        }
    }
    
    //MARK: - Content right
    @Published var rightContent: CellContentRight = CellContentRight()
    
    //MARK: - Disclosure
    @Published var hasDisclosure: Bool = false {
        didSet {
            setDisclosure()
        }
    }
    @Published var disclosure: Disclosure? = nil
    @Published var disclosureText: String = ""
    
    //MARK: - Content alignment
    @Published var alignment: CellContentAlignment = .center
    
    //MARK: - Cell content variations
    @Published var contentLeftPreview: CellContentPreview = .none {
        didSet {
            updateView(in: &leftContent.contentView, for: contentLeftPreview)
        }
    }
    
    @Published var contentRightPreview: CellContentPreview = .none {
        didSet {
            updateView(in: &rightContent.contentView, for: contentRightPreview)
        }
    }
    //MARK: - Additional views
    @Published var avatar: SDDSAvatar? = nil
    @Published var iconButton: IconButton? = nil
    @Published var `switch`: SDDSSwitch? = nil
    @Published var checkbox: SDDSCheckbox? = nil
    @Published var radiobox: SDDSRadiobox? = nil
    @Published var text: String = "Custom text"
    
    init() {
        self.avatar = SDDSAvatar(
            text: "AB",
            image: nil,
            placeholderImage: nil,
            status: .online,
            appearance: SDDSAvatar.default.large.appearance,
            accessibility: AvatarAccessibility()
        )
        self.iconButton = IconButton(
            iconAttributes: .init(image: Image("buttonIcon"), alignment: ButtonAlignment.leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.large.clear.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
        self.switch = SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            appearance: SDDSSwitch.large.default.appearance,
            switchAccessibility: SwitchAccessibility()
        )
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
    func addView(for content: CellContentPreview) -> CellCustomViewProvider {
        switch content {
        case .avatar:
            CellCustomViewProvider(
                view: avatar
            )
        case .icon:
            CellCustomViewProvider(
                view: iconButton
            )
        case .text:
            CellCustomViewProvider(
                view: Text(text)
            )
        case .switch:
            CellCustomViewProvider(
                view: `switch`
            )
//        case .checkbox:
//            CellCustomViewProvider(
//                view: checkbox
//            )
//        case .radiobox:
//            CellCustomViewProvider(
//                view: radiobox
//            )
        case .none:
            CellCustomViewProvider(
                view: EmptyView()
            )
        }
    }
    
    //MARK: - Update view
    private func updateView(in contentView: inout [CellCustomViewProvider], for contentPreview: CellContentPreview) {
        if contentView.isEmpty {
            contentView.append(addView(for: contentPreview))
        } else {
            contentView[0] = addView(for: contentPreview)
        }
    }
    
    //MARK: - Set disclosure
    private func setDisclosure() {
        if hasDisclosure {
            disclosure = .default(DefaultDisclosure(
                text: disclosureText,
                icon: .image(.init(systemName: "arrowshape.right"))
            )
            )
        } else {
            disclosure = nil
        }
    }
    
    //MARK: - Remove view from content
    func removeView(index: Int) {}
}
