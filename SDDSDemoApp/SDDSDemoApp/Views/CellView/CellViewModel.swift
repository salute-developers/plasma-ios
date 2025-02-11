import Foundation
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

enum CellContentPreview: String, CaseIterable {
    case avatar
    case icon
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
    
    //MARK: - Size Variations
    // -
    
    //MARK: - Additional views
    @Published var avatar: SDDSAvatar
    @Published var avatarAppearance: AvatarAppearance = SDDSAvatar.extraExtraLarge.large.appearance
    @Published var iconButton: IconButton
    @Published var iconButtonAppearance: ButtonAppearance =  IconButton.large.clear.appearance
    @Published var text: String = "Custom text"
    
    init() {
        self.avatar = SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: SDDSAvatar.extraExtraLarge.large.appearance,
            accessibility: AvatarAccessibility()
        )
        self.iconButton = IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.large.clear.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
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
                icon: .init(systemName: "arrowshape.right")
            )
            )
        } else {
            disclosure = nil
        }
    }
    
    //MARK: - Remove view from content
    func removeView(index: Int) {}
}
