import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

struct SegmentView: View {
    @ObservedObject private var viewModel: SegmentViewModel
    
    init(viewModel: SegmentViewModel = SegmentViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                segment
            }
            Section(header: Text("Segment")) {
                segmentSize
                shape
                stackOrientation
                strech
                background
                isDisabled
            }
            Section(header: Text("Segment Element")) {
                segmentItemAppearance
                value
                helperText
                icon
                iconAlignment
                Group {
                    counter
                }
                addSingleItem
            }
            Section {
                maxElementsAdditionalWindow
            }
        }
    }
    
    // MARK: - Segment Element
    
    @ViewBuilder
    private var value: some View {
        HStack {
            Text("Value")
            TextField("Value", text: $viewModel.value)
                .multilineTextAlignment(.trailing)
        }
    }
    
    @ViewBuilder
    private var helperText: some View {
        HStack {
            Text("Helper Text")
            TextField("Helper Text", text: $viewModel.helperText)
                .multilineTextAlignment(.trailing)
        }
    }
    
    @ViewBuilder
    private var icon: some View {
        HStack {
            Toggle("Icon", isOn: $viewModel.isIconVisible)
        }
    }
    
    @ViewBuilder
    private var iconAlignment: some View {
        HStack {
            Text("Icon Alignment")
            Spacer()
            Menu {
                ForEach(ButtonAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue)
            }
        }
    }
    
    @ViewBuilder
    private var strech: some View {
        HStack {
            Toggle("Strech", isOn: $viewModel.stretch)
        }
    }
    
    
    @ViewBuilder
    private var segment: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                SDDSSegment(
                    items: viewModel.data,
                    appearance: viewModel.appearance,
                    layoutOrientation: viewModel.layoutOrientation,
                    selectedItemId: $viewModel.selectedItemId,
                    isDisabled: viewModel.isDisabled
                )
            }
            .frame(width: geometry.size.width)
        }
        .frame(height: viewModel.segmentHeight)
    }
    
    @ViewBuilder
    private var segmentItemAppearance: some View {
        HStack {
            Text("Segment Item Appearance")
            Spacer()
            Menu {
                ForEach(SDDSSegmentItem.all, id: \.self) { variation in
                    Button(variation.name) {
                        viewModel.segmentItemAppearance = variation.appearance.size(viewModel.segmentItemSize)
                        viewModel.variationName = variation.name
                    }
                }
            } label: {
                Text(viewModel.variationName.capitalized)
            }
        }
    }
    
    @ViewBuilder
    private var isDisabled: some View {
        HStack {
            Toggle("Disabled", isOn: $viewModel.isDisabled)
        }
    }
    
    @ViewBuilder
    private var segmentSize: some View {
        HStack {
            Text("Segment size")
            Spacer()
            Menu {
                ForEach(SegmentSize.allCases, id: \.self) { size in
                    Button(size.rawValue) {
                        viewModel.segmentSize = size
                    }
                }
            } label: {
                Text(viewModel.segmentSize.rawValue.capitalized)
            }
        }
    }
    
    @ViewBuilder
    private var counter: some View {
        Group {
            HStack {
                Toggle("Counter", isOn: $viewModel.isCounterVisible)
            }
            if viewModel.isCounterVisible {
                counterAppearance
                counterText
            }
        }
    }
    
    @ViewBuilder
    private var stackOrientation: some View {
        HStack {
            Picker("Stack orientation", selection: $viewModel.layoutOrientation) {
                ForEach(SegmentLayoutOrientation.allCases, id: \.self) { orientation in
                    Text(orientation.rawValue)
                }
            }
        }
    }
    
    @ViewBuilder
    private var addSingleItem: some View {
        HStack {
            Button("Add item") {
                viewModel.addItem()
            }
        }
    }
    
    @ViewBuilder
    private var maxElementsAdditionalWindow: some View {
        ForEach(viewModel.data.indices, id: \.self) { index in
            HStack {
                Text(viewModel.data[index].title)
                Spacer()
                Button("Delete") {
                    let id = viewModel.data[index].id
                    viewModel.removeItem(id: id)
                }
                .foregroundColor(.red)
            }
        }
    }
    
    @ViewBuilder
    private var shape: some View {
        HStack {
            Toggle("Pilled", isOn: $viewModel.isPilled)
        }
    }
    
    @ViewBuilder
    private var background: some View {
        HStack {
            Toggle("Has Background", isOn: $viewModel.hasBackground)
        }
    }
    
    @ViewBuilder
    private var counterAppearance: some View {
        VStack {
            HStack {
                Text("Counter Appearance")
                Spacer()
                Menu {
                    ForEach(SDDSCounter.all, id: \.self) { variation in
                        Button(variation.name) {
                            viewModel.counterAppearance = variation.appearance.size(viewModel.counterSize)
                            viewModel.counterVariationName = variation.name
                        }
                    }
                } label: {
                    Text(viewModel.counterVariationName.capitalized)
                }
            }
        }
    }
    
    @ViewBuilder
    private var counterText: some View {
        HStack {
            Text("Counter data")
            TextField("Number", text: $viewModel.counterText)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    SegmentView(viewModel: SegmentViewModel())
}
