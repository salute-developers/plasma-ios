import Foundation
import SwiftUI
import Combine

public enum Alignment {
    case left
    case right
}

public struct IconAttributes {
    public let image: Image
    public let alignment: Alignment
}

public final class SDDSButtonViewModel: ObservableObject {
    @Published public var text: String
    @Published public var subtitle: String?
    @Published public var icon: IconAttributes?
    @Published public var size: ButtonSize
    @Published public var disabled: Bool
    @Published public var loading: Bool
    public var action: () -> Void
    
    public init(text: String,
                subtitle: String? = nil,
                icon: IconAttributes? = nil,
                size: ButtonSize = .medium,
                disabled: Bool = false,
                loading: Bool = false,
                action: @escaping () -> Void = {}) {
        self.text = text
        self.subtitle = subtitle
        self.icon = icon
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
            HStack {
                Text(viewModel.text)
                    .foregroundColor(.white)
                    .padding(viewModel.size.paddings)
            }
            .background(Color.black)
            .cornerRadius(viewModel.size.cornerRadius)
            .frame(height: viewModel.size.height)
        }
        .disabled(viewModel.disabled)
    }
}

extension SDDSButtonViewModel {
    static func textOnly(size: ButtonSize) -> SDDSButtonViewModel {
        .init(text: "Label", size: size)
    }
}

struct SDDSButton_Previews: PreviewProvider {
    static var previews: some View {
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .large))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .medium))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Medium button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .small))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Small button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .xs))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("XS button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .xxs))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("XXS button with text")
    }
}
