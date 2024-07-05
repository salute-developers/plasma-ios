import Foundation
import SwiftUI
import Combine
import SDDSIcons

public struct SDDSButton: View {
    @ObservedObject private var viewModel: SDDSButtonViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var isAnimating = false
    
    public init(viewModel: SDDSButtonViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            Button {
                viewModel.action()
            } label: {
                if viewModel.isEquilateral {
                    equilateralButton
                } else {
                    basicButton
                }
            }
            .opacity(viewModel.contentOpacity)
            .background(viewModel.style.backgroundColor.color(for: colorScheme).opacity(viewModel.backgroundOpacity))
            .applyIf(!viewModel.isCircle, transform: { $0.cornerRadius(viewModel.size.cornerRadius) })
            .frame(height: viewModel.size.height)
            .disabled(viewModel.isDisabled)
            
            if viewModel.isLoading {
                spinner
                    .frame(width: viewModel.size.spinnerSize.width, height: viewModel.size.spinnerSize.height)
            }
        }
        .applyIf(viewModel.isCircle, transform: { $0.clipShape(Circle()) })
    }
    
    @ViewBuilder
    private var equilateralButton: some View {
        icon
            .frame(width: viewModel.size.height, height: viewModel.size.height)
    }
    
    @ViewBuilder
    private var basicButton: some View {
        HStack {
            if viewModel.isCentered {
                Spacer()
            }
            if !viewModel.isIconRightAligned && viewModel.iconAttributes != nil {
                icon
                if !viewModel.isEquilateral && !viewModel.title.isEmpty {
                    Spacer().frame(width: Spacing.eight)
                }
            }
            if !viewModel.title.isEmpty {
                Text(viewModel.title)
                    .font(viewModel.titleTypography.font)
                    .fontWeight(viewModel.titleTypography.weight.sui)
                    .foregroundColor(viewModel.style.titleColor.color(for: colorScheme))
            }
            if viewModel.isSideBySide {
                Spacer()
            }
            if !viewModel.subtitle.isEmpty {
                if !viewModel.title.isEmpty {
                    Spacer().frame(width: Spacing.four)
                }
                Text(viewModel.subtitle)
                    .font(viewModel.subtitleTypography.font)
                    .fontWeight(viewModel.subtitleTypography.weight.sui)
                    .foregroundColor(viewModel.style.subtitleColor.color(for: colorScheme))
            }
            if viewModel.isIconRightAligned && viewModel.iconAttributes != nil {
                if !viewModel.title.isEmpty || !viewModel.subtitle.isEmpty {
                    Spacer().frame(width: Spacing.four)
                }
                icon
            }
            if viewModel.isCentered {
                Spacer()
            }
        }
        .frame(
            minHeight: max(
                viewModel.subtitleTypography.lineHeight,
                viewModel.titleTypography.lineHeight
            )
        )
        .padding(viewModel.size.paddings)
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
            VStack {
                Spacer()
            }
                .foregroundColor(.red)
        }
    }
    
    @ViewBuilder
    private var spinner: some View {
        if viewModel.isLoading {
            SpinnerView(
                image: viewModel.spinnerImage,
                foregroundColor: viewModel.style.spinnerColor.color(for: colorScheme)
            )
        } else {
            EmptyView()
        }
    }
}

struct SDDSButton_Previews: PreviewProvider {
    static var previews: some View {
        SDDSButton(viewModel: SDDSButtonViewModel.equilateral(size: .large, layoutMode: .circle))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large square button")
        
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
