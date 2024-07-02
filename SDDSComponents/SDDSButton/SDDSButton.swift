import Foundation
import SwiftUI
import Combine
import SDDSIcons

public enum Alignment {
    case left
    case right
}

public struct IconAttributes {
    public let image: Image
    public let alignment: Alignment
}

public final class SDDSButtonViewModel: ObservableObject {
    @Published public var title: String?
    @Published public var subtitle: String?
    @Published public var iconAttributes: IconAttributes?
    @Published public var size: ButtonSize
    @Published public var disabled: Bool
    @Published public var loading: Bool
    public var action: () -> Void
    
    public init(title: String?,
                subtitle: String? = nil,
                iconAttributes: IconAttributes? = nil,
                size: ButtonSize = .medium,
                disabled: Bool = false,
                loading: Bool = false,
                action: @escaping () -> Void = {}) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.size = size
        self.disabled = disabled
        self.loading = loading
        self.action = action
    }
}

public struct SDDSButton: View {
    @ObservedObject private var viewModel: SDDSButtonViewModel
    
    init(viewModel: SDDSButtonViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Button {
            viewModel.action()
        } label: {
            HStack(spacing: 0) {
                if viewModel.iconAttributes?.alignment == .left {
                    icon
                    Spacer().frame(width: Spacing.four)
                }
                if let title = viewModel.title {
                    Text(title)
                        .fontWeight(.semibold) // использовать тему
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
                if let subtitle = viewModel.subtitle {
                    Spacer().frame(width: Spacing.four)
                    Text(subtitle)
                        .fontWeight(.semibold) // использовать тему
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, opacity: 0.56))
                }
                if viewModel.iconAttributes?.alignment == .right {
                    Spacer().frame(width: Spacing.four)
                    icon
                }
            }
            .padding(viewModel.size.paddings)
            .background(Color.black)
            .cornerRadius(viewModel.size.cornerRadius)
            .frame(height: viewModel.size.height)
        }
        .disabled(viewModel.disabled)
    }
    
    @ViewBuilder
    private var icon: some View {
        if let iconAttributes = viewModel.iconAttributes {
            iconAttributes.image
                .resizable()
                .frame(
                    width: viewModel.size.iconSize.width,
                    height: viewModel.size.iconSize.height
                )
        } else {
            EmptyView()
        }
    }
}

struct SDDSButton_Previews: PreviewProvider {
    static var previews: some View {
        // Button with title
        SDDSButtonPreviewTextOnly.previews
        
        // Button with title and left icon
        SDDSButtonPreviewTextWithLeftIcon.previews
        
        // Button with title and right icon
        SDDSButtonPreviewTextWithRightIcon.previews
        
        // Button with title and subtitle
        SDDSButtonPreviewTextWithSubtitle.previews
        
        // Button with title, subtitle, and left icon
        SDDSButtonPreviewTextWithLeftIconAndSubtitle.previews
        
        // Button with title, subtitle, and right icon
        SDDSButtonPreviewTextWithRightIconAndSubtitle.previews
    }
}
