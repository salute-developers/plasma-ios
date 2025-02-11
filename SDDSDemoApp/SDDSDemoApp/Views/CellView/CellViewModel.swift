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
    @Published var contentLeft: CellContentLeft = CellContentLeft()
    
    //MARK: - Content center
    @Published var contentCenter: CellContentCenter = CellContentCenter()
    @Published var label: String = ""
    @Published var title: String = ""
    @Published var subtitle: String = ""
    
    //MARK: - Content right
    @Published var contentRight: CellContentRight = CellContentRight()
    
    //MARK: - Disclosure
    @Published var hasDisclosure: Bool = false
    @Published var disclosureText: String = ""
    
    //MARK: - Content alignment
    @Published var alignment: CellContentAlignment = .center
    
    //MARK: - Additional views
    @Published var avatar: SDDSAvatar? = nil
    @Published var avatarAppearance: AvatarAppearance = SDDSAvatar.default.appearance
    @Published var iconButton: IconButton? = nil
    @Published var iconButtonAppearance: ButtonAppearance = IconButton.medium.accent.appearance
    @Published var text: String = ""
    
    //MARK: - Cell content variations
    @Published var contentLeftPreview: CellContentPreview = .none {
        didSet {
            contentLeft.data.append(addView(for: contentLeftPreview))
        }
    }
    
    @Published var contentRightPreview: CellContentPreview = .none {
        didSet {
            contentLeft.data.append(addView(for: contentRightPreview))
        }
    }
    
    //MARK: - Size Variations
    
    init() {}
    
    //MARK: - Add preview variations
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
    
    func removeView(index: Int) {
        
    }
}
