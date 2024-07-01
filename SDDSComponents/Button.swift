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
    @Published public var disabled: Bool
    @Published public var loading: Bool
    public var action: () -> Void
    
    public init(text: String,
                subtitle: String? = nil,
                icon: IconAttributes? = nil,
                disabled: Bool = false,
                loading: Bool = false,
                action: @escaping () -> Void = {}) {
        self.text = text
        self.subtitle = subtitle
        self.icon = icon
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
                    .padding([.leading, .trailing], Spacing.sixteen)
                    .padding([.top, .bottom], Spacing.eleven)
            }
        }
        .background(Color.black)
        .disabled(viewModel.disabled)
        .frame(height: Spacing.fourty)
        .cornerRadius(Spacing.ten)
    }
}

extension SDDSButtonViewModel {
    static var textOnly: SDDSButtonViewModel {
        .init(text: "Label")
    }
}

struct SDDSButton_Previews: PreviewProvider {
    static var previews: some View {
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Standard button with text")
    }
}
