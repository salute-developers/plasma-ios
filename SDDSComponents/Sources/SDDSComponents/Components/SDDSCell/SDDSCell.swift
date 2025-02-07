import Foundation
import SwiftUI

/*
 MARK: - Cell Content
 */
public enum CellContentLeft {
    case icon(Image)
    case avatar(SDDSAvatar)
    case custom(ViewProvider)
}

public struct CellContentCenter {
    public let label: String
    public let title: String
    public let subtitle: String
    
    public init(label: String, title: String, subtitle: String) {
        self.label = label
        self.title = title
        self.subtitle = subtitle
    }
}

public struct CellContentRight {
    let disclosureEnabled: Bool
    let view: ViewProvider
    
    public init(
        disclosureEnabled: Bool,
        view: ViewProvider
    ) {
        self.disclosureEnabled = disclosureEnabled
        self.view = view
    }
}

/*
 MARK: - Disclosure
 */
public struct DisclosureViewProvider {
    let alignment: CellContentRightAlignment //in API Documentation name is `gravity`
    let disclosureText: String
    let disclosureIcon: ViewProvider? //ButtonIcon?
    let disclosure: ViewProvider?
    
    init(
        alignment: CellContentRightAlignment,
        disclosureText: String,
        disclosureIcon: ViewProvider?,
        disclosure: ViewProvider?
    ) {
        self.alignment = alignment
        self.disclosureText = disclosureText
        self.disclosureIcon = disclosureIcon
        self.disclosure = disclosure
    }
}

public enum CellContentRightAlignment {
    case top
    case center
    case bottom
}

/*
 MARK: - Cell
 */
public struct SDDSCell: View {
    public let leftContent: CellContentLeft?
    public let centerContent: CellContentCenter
    public let rightContent: CellContentRight?
    
    public init(
        leftContent: CellContentLeft? = nil,
        centerContent: CellContentCenter,
        rightContent: CellContentRight = nil?
    ) {
        self.leftContent = leftContent
        self.centerContent = centerContent
        self.rightContent = rightContent
    }
    
    public var body: some View {
        HStack {
            leftView
            
            /*
             Mock left-center Spacers
             */
            Spacer()
                .frame(width: 30)
            
            centerView
            
            /*
             Mock right-center Spacers
             */
            Spacer()
                .frame(width: 30)
            
            rightContent
        }
    }
}

extension SDDSCell {
    @ViewBuilder
    private var leftView: some View {
        switch leftContent {
        case .icon(let icon):
            icon
        case .avatar(let SDDSAvatar):
            SDDSAvatar
        case .none:
            EmptyView()
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var centerView: some View {
        VStack {
            if hasCenterContent {
                value(for: centerContent.label)
                
                value(for: centerContent.title)
                
                value(for: centerContent.subtitle)
            } else {
                EmptyView() //Or ViewProvider
            }
        }
    }
    
    @ViewBuilder
    private var rightView: some View {
        HStack {
            if let view = rightContent?.view, rightContent?.disclosureEnabled {
                DisclosureViewProvider
                
                view
            }
        }
    }
    
    @ViewBuilder
    private func value(for value: String) -> some View {
        Text(value)
    }
    
    private var hasCenterContent: Bool {
        !centerContent.label.isEmpty || !centerContent.title.isEmpty || !centerContent.subtitle.isEmpty
    }
    
    private var hasRightContentWithoutDisclosure: Bool {
        rightContent != nil && rightContent?.disclosureEnabled
    }
}
