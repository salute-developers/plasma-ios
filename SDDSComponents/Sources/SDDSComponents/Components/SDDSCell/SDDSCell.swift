import Foundation
import SwiftUI

/*
 MARK: - CellContent
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

/*
 MARK: - Cell
 */
public struct SDDSCell: View {
    public let leftContent: CellContentLeft?
    public let centerContent: CellContentCenter
    
    public init(
        leftContent: CellContentLeft?,
        centerContent: CellContentCenter
    ) {
        self.leftContent = leftContent
        self.centerContent = centerContent
    }
    
    public var body: some View {
        HStack {
            leftView
            
            paddings(between: .leftCenter)
            
            centerView
            
            paddings(between: .rightCenter)
        }
    }
}

public enum CellContentRight {}

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
            if hasContent {
                value(for: centerContent.label)
                
                value(for: centerContent.title)
                
                value(for: centerContent.subtitle)
            } else {
                EmptyView() //Or ViewProvider
            }
        }
    }
    
    @ViewBuilder
    private func value(for value: String) -> some View {
        Text(value)
    }
    
    private var hasContent: Bool {
        !centerContent.label.isEmpty || !centerContent.title.isEmpty || !centerContent.subtitle.isEmpty
    }
    
    private var paddings(between content: CellContentType) -> some View {
        Spacer
            .frame(width: )
    }
}


private enum CellContentType {
    case leftCenter
    case rightCenter
}
