import SwiftUI
import SDDSComponents
import SDDSServTheme

struct OverlayView: View {
    @ObservedObject private var viewModel: OverlayViewModel
    
    init() {
        self.viewModel = OverlayViewModel()
    }
    
    var body: some View {
        List {
            Section {
                segmentView
                    .overlay(isPresented: $viewModel.isPresent, appearance: viewModel.appearance)
            }
            
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
    }
    
    private var segmentView: some View {
        let items = (0..<4).map { index in
            SDDSSegmentItemData(
                id: viewModel.ids[index],
                title: "Item \(index)",
                subtitle: "Subtitle",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                appearance: SegmentItem.l.primary.appearance,
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
                appearance: Segment.l.primary.appearance,
                layoutOrientation: .vertical,
                selectedItemId: $viewModel.selectedItemId,
                isDisabled: false
            )
            Spacer()
        }
    }
}

#Preview {
    OverlayView()
}
