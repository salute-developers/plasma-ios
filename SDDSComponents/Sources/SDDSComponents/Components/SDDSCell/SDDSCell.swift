import Foundation
import SwiftUI

public struct SDDSCell: View {
    public let leftContent: CellContentLeft?
    public let centerContent: CellContentCenter
    public let rightContent: CellContentRight?
    public let disclosure: Disclosure?
    public let alignment: CellContentAlignment
    
    public init(
        leftContent: CellContentLeft? = nil,
        centerContent: CellContentCenter,
        rightContent: CellContentRight? = nil,
        disclosure: Disclosure? = nil,
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
             Mock left-center paddings
             */
            Spacer()
            
            centerView
                .debug(color: .blue, condition: true)
            
            /*
             Mock right-center paddings
             */
            Spacer()
            
            rightView
                .debug(color: .blue, condition: true)
        }
        .debug(color: .red, condition: true)
    }
}

extension SDDSCell {
    //MARK: - Content view
    @ViewBuilder
    private var leftView: some View {
        HStack(spacing: 0) {
            if let leftContent = leftContent {
                ForEach(leftContent.contentView, id: \.self) { content in
                    content
                }
            }
        }
    }
    
    @ViewBuilder
    private var centerView: some View {
        VStack {
            if hasCenterContent {
                if !centerContent.label.isEmpty {
                    value(for: centerContent.label)
                }
                
                if !centerContent.title.isEmpty {
                    value(for: centerContent.title)
                }
                
                if !centerContent.subtitle.isEmpty {
                    value(for: centerContent.subtitle)
                }
                
                if !centerContent.contentView.isEmpty {
                    ForEach(centerContent.contentView, id: \.self) { content in
                        content
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var rightView: some View {
        HStack(spacing: 0) {
            if let rightContent = rightContent {
                ForEach(rightContent.contentView, id: \.self) { content in
                    content
                }
                
                disclosureView
            }
        }
    }
    
    //MARK: - Disclosure view
    @ViewBuilder
    private var disclosureView: some View {
        switch disclosure {
        case .default(let defaultDisclosure):
            defaultDisclosureView(for: defaultDisclosure)
        case .custom(let viewProvider):
            viewProvider.view
        case .none:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func defaultDisclosureView(for disclosure: DefaultDisclosure)-> some View {
            HStack {
                value(for: disclosure.text)
                
                ZStack {
                    switch disclosure.icon {
                    case .image(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.gray)
                    case .custom(let viewProvider):
                        viewProvider.view
                    }
                }
                .frame(width: 16, height: 16)
                .debug(color: Color.yellow, condition: true)
            }
            .debug(color: Color.green, condition: true)
    }
    
    //MARK: - Other additional view
    @ViewBuilder
    private func value(for value: String) -> some View {
        Text(value)
    }
    
    //MARK: - Computed values
    private var hasCenterContent: Bool {
        !centerContent.label.isEmpty || !centerContent.title.isEmpty || !centerContent.subtitle.isEmpty
    }
}
