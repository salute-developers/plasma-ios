import Foundation
import SwiftUI
import Combine
import SDDSIcons

public struct SDDSButton: View {
    @ObservedObject private var viewModel: SDDSButtonViewModel
    @Environment(\.colorScheme) var colorScheme
    
    init(viewModel: SDDSButtonViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Button {
            viewModel.action()
        } label: {
            ZStack {
                HStack(spacing: 0) {
                    if viewModel.isCentered {
                        Spacer()
                    }
                    if viewModel.iconAttributes?.alignment == .left {
                        icon
                        Spacer().frame(width: Spacing.eight)
                    }
                    if let title = viewModel.title {
                        Text(title)
                            .font(viewModel.style.titleTypography.font)
                            .fontWeight(viewModel.style.titleTypography.weight.sui)
                            .foregroundColor(viewModel.style.titleColor.color(for: colorScheme))
                    }
                    if viewModel.isSideBySide {
                        Spacer()
                    }
                    if let subtitle = viewModel.subtitle {
                        Spacer().frame(width: Spacing.four)
                        Text(subtitle)
                            .font(viewModel.style.subtitleTypography.font)
                            .fontWeight(viewModel.style.subtitleTypography.weight.sui)
                            .foregroundColor(viewModel.style.subtitleColor.color(for: colorScheme))
                    }
                    if viewModel.iconAttributes?.alignment == .right {
                        Spacer().frame(width: Spacing.four)
                        icon
                    }
                    if viewModel.isCentered {
                        Spacer()
                    }
                }
                .opacity(viewModel.contentOpacity)
                if viewModel.isLoading {
                    spinner
                }
            }
            .padding(viewModel.size.paddings)
            .background(viewModel.style.backgroundColor.color(for: colorScheme).opacity(viewModel.backgroundOpacity))
            .cornerRadius(viewModel.size.cornerRadius)
            .frame(height: viewModel.size.height)
        }
        .disabled(viewModel.isDisabled)
        .frame(width: 160)
    }
    
    @ViewBuilder
    private var icon: some View {
        if let iconAttributes = viewModel.iconAttributes {
            iconAttributes.image
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(viewModel.style.iconColor.color(for: colorScheme))
                .frame(
                    width: viewModel.size.iconSize.width,
                    height: viewModel.size.iconSize.height
                )
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var spinner: some View {
        viewModel.spinnerImage
            .foregroundColor(viewModel.style.spinnerColor.color(for: colorScheme))
            .rotationEffect(Angle(degrees: viewModel.isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: viewModel.isLoading)
            .onAppear {
                viewModel.isLoading = true
            }
            .frame(width: viewModel.size.spinnerSize.width, height: viewModel.size.spinnerSize.height)
            .fixedSize()
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
