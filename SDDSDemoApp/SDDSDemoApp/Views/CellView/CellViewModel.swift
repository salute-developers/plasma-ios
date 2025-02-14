//import Foundation
//import SwiftUI
//import SDDSComponents
//import SDDSServTheme
//
//enum CellContentPreview: String, CaseIterable {
//    case avatar
//    case iconButton
//    //    case `switch`
//    //    case checkbox
//    //    case radiobox
//    case text
//    case none
//}
//
//final class CellViewModel: ObservableObject {
//    //MARK: - Cell Content
//    @Published var leftContent: [CellElement] = []
//    
//    @Published var centerContent: [CellElement] = []
//    
//    @Published var label: String = "label"
//    @Published var title: String = "title"
//    @Published var subtitle: String = "subtitle"
//    
//    @Published var rightContent: [CellElement] = []
//    
//    @Published var appearance: CellAppearance = Cell.l.appearance
//    
//    //MARK: - Disclosure
//    @Published var hasDisclosure: Bool = false {
//        didSet {
//            setDisclosure()
//        }
//    }
//    @Published var disclosure: Disclosure? = nil
//    @Published var disclosureText: String = ""
//    
//    //MARK: - Content alignment
//    @Published var alignment: CellContentAlignment = .center
//    
//    //MARK: - Cell content variations
//    @Published var contentLeftPreview: CellContentPreview = .none {
//        didSet {
//            updateView(in: &leftContent, for: contentLeftPreview)
//        }
//    }
//    
//    @Published var contentCenterPreview: CellContentPreview = .none {
//        didSet {
//            updateView(in: &centerContent, for: contentCenterPreview)
//        }
//    }
//    
//    @Published var contentRightPreview: CellContentPreview = .none {
//        didSet {
//            updateView(in: &rightContent, for: contentRightPreview)
//        }
//    }
//    //MARK: - Additional views
//    @Published var text: String = "Custom text"
//    
//    init() {
//        //        self.avatar = SDDSAvatar(
//        //            text: "AB",
//        //            image: nil,
//        //            placeholderImage: nil,
//        //            status: .online,
//        //            appearance: appearance.avatarAppearance,
//        //            accessibility: AvatarAccessibility()
//        //        )
//        //        self.iconButton = IconButton(
//        //            iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
//        //            isDisabled: false,
//        //            isLoading: false,
//        //            spinnerImage: Image.image("spinner"),
//        //            appearance: appearance.iconButtonAppearance,
//        //            layoutMode: .fixedWidth(.packed),
//        //            action: {}
//        //        )
//        //        self.switch = SDDSSwitch(
//        //            title: "",
//        //            subtitle: "",
//        //            isOn: .constant(true),
//        //            isEnabled: true,
//        //            appearance: SDDSSwitch.large.default.appearance,
//        //            switchAccessibility: SwitchAccessibility()
//        //        )
//        //        self.checkbox = SDDSCheckbox(
//        //            state: .constant(.indeterminate),
//        //            title: "Valur",
//        //            subtitle: "Description",
//        //            isEnabled: true,
//        //            images: .checkbox,
//        //            appearance: SDDSCheckbox.medium.default.appearance
//        //        )
//        //        self.radiobox = SDDSRadiobox(
//        //            isSelected: .constant(true),
//        //            title: "Value",
//        //            subtitle: "Description",
//        //            isEnabled: true,
//        //            images: .defaultImages,
//        //            appearance: SDDSRadiobox.medium.default.appearance
//        //        )
//    }
//    
//    //MARK: - Add preview in content
//    func addView(for content: CellContentPreview) -> CellElement {
//        switch content {
//        case .avatar:
//            return .avatar(SDDSAvatarData(
//                text: "AB",
//                image: nil,
//                placeholderImage: nil,
//                status: .online,
//                appearance: appearance.avatarAppearance,
//                accessibility: AvatarAccessibility()
//            )
//            )
//        case .iconButton:
//            return .iconButton(IconButtonData(
//                iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
//                isDisabled: false,
//                isLoading: false,
//                spinnerImage: Image.image("spinner"),
//                appearance: appearance.iconButtonAppearance,
//                layoutMode: .fixedWidth(.packed),
//                action: {}
//            )
//            )
//        case .text:
//            return .custom(
//                CellCustomViewProvider(view: Text(text))
//            )
//        case .none:
//            return .custom(
//                CellCustomViewProvider(view: EmptyView())
//            )
//        }
//    }
//    
//    //MARK: - Update view
//    private func updateView(in contentView: inout [CellElement], for contentPreview: CellContentPreview) {
//        if contentView.isEmpty {
//            contentView.append(addView(for: contentPreview))
//        } else {
//            contentView[0] = addView(for: contentPreview)
//        }
//    }
//    
//    //MARK: - Set disclosure
//    private func setDisclosure() {
//        if hasDisclosure {
//            disclosure = .default(DefaultDisclosure(
//                text: disclosureText,
//                icon: .image(.init(systemName: "arrowshape.right"))
//            )
//            )
//        } else {
//            disclosure = nil
//        }
//    }
//    
//    //MARK: - Remove view from content
//    func removeView(index: Int) {}
//}
