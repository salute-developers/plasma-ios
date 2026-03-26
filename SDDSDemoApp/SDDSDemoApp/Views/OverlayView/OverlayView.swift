import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SandboxSwiftUI

struct OverlayView: View {
    @ObservedObject private var viewModel: OverlayViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: OverlayViewModel = OverlayViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                segmentView
                    .frame(maxWidth: .infinity, minHeight: 180, alignment: .center)
                    .overlay(isPresented: $viewModel.isPresent, appearance: viewModel.appearance)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
            Section {
                VariationsView(viewModel: viewModel)
                VStack {
                    HStack {
                        Toggle("Blur", isOn: $viewModel.hasBlur)
                    }
                    HStack {
                        Toggle("Is present", isOn: $viewModel.isPresent)
                    }
                    HStack {
                        Toggle("Has background", isOn: $viewModel.hasBackgroundColor)
                    }
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
    }
    
    private var segmentView: some View {
        guard !viewModel.theme.segmentVariations.isEmpty, !viewModel.theme.segmentItemVariations.isEmpty else {
            return AnyView(
                HStack {
                    Spacer()
                    BasicButton(
                        title: "Overlay Target",
                        subtitle: "",
                        iconAttributes: .init(image: Asset.plasma24.image, alignment: .leading),
                        action: {}
                    )
                    Spacer()
                }
            )
        }

        let items = (0..<4).map { index in
            SDDSSegmentItemData(
                id: viewModel.ids[index],
                title: "Item \(index)",
                subtitle: "Subtitle",
                iconAttributes: .init(image: Asset.starFill36.image, alignment: .leading),
                appearance: viewModel.theme.segmentItemVariations.first?.styles.first?.appearance
                    ?? viewModel.theme.segmentItemVariations.first?.appearance
                    ?? SegmentItemAppearance(),
                counter: { AnyView(EmptyView()) },
                action: {
                    viewModel.selectedItemId = viewModel.ids[index]
                }
            )
        }
        return HStack {
            Spacer()
            SDDSSegment(
                items: items,
                appearance: viewModel.theme.segmentVariations.first?.styles.first?.appearance
                    ?? viewModel.theme.segmentVariations.first?.appearance
                    ?? SegmentAppearance(),
                layoutOrientation: .vertical,
                selectedItemId: $viewModel.selectedItemId,
                isDisabled: false
            )
            Spacer()
        }
        .eraseToAnyView()
    }
}

private extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

#Preview {
    OverlayView()
}
