import Foundation
import SwiftUI

/*
 MARK: - Disclosure
 */
public struct DisclosureViewProvider: View {
    let disclosureText: String
    let disclosureIcon: ViewProvider? //ButtonIcon?
    let disclosure: ViewProvider?
    let arrow: DisclosureArrow
    
    init(
        disclosureText: String,
        disclosureIcon: ViewProvider?,
        disclosure: ViewProvider?,
        arrow: DisclosureArrow
    ) {
        self.disclosureText = disclosureText
        self.disclosureIcon = disclosureIcon
        self.disclosure = disclosure
        self.arrow = arrow
    }
    
    @ViewBuilder
    public var body: some View {
        HStack {
            Text(disclosureText)
            
            switch arrow {
            case .image(let image):
                image
                //                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                //                    .foregroundColor(.gray)
                    .debug(color: .yellow, condition: true)
            case .custom(let viewProvider):
                viewProvider.view
            }
        }
    }
}

public enum DisclosureArrow {
    case image(Image)
    case custom(ViewProvider)
}

public enum CellContentAlignment {
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
    public let disclosure: DisclosureViewProvider?
    public let alignment: CellContentAlignment
    
    public init(
        leftContent: CellContentLeft? = nil,
        centerContent: CellContentCenter,
        rightContent: CellContentRight? = nil,
        disclosure: DisclosureViewProvider? = nil,
        alignment: CellContentAlignment = .center
    ) {
        self.leftContent = leftContent
        self.centerContent = centerContent
        self.rightContent = rightContent
        self.disclosure = disclosure
        self.alignment = alignment
    }
    
    public var body: some View {
        HStack {
            leftView
                .debug(color: .blue, condition: true)
            /*
             Mock left-center Spacers
             */
            Spacer()
                .frame(width: 50)
            
            centerView
                .debug(color: .blue, condition: true)
            
            /*
             Mock right-center Spacers
             */
            Spacer()
                .frame(width: 50)
            
            rightView
                .debug(color: .blue, condition: true)
        }
        .debug(color: .red, condition: true)
    }
}

extension SDDSCell {
    @ViewBuilder
    private var leftView: some View {
        HStack(spacing: 0) {
            if let leftContent = leftContent {
                ForEach(leftContent.data, id: \.self) { content in
                    content
                }
            }
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
            if let rightContent = rightContent {
                rightContent.buttonIcon
                
                if rightContent.disclosureEnabled {
                    DisclosureViewProvider(
                        disclosureText: "disclosure",
                        disclosureIcon: nil,
                        disclosure: nil,
                        arrow: .image(Image("square.and.arrow.up"))
                    )
                }
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
}
