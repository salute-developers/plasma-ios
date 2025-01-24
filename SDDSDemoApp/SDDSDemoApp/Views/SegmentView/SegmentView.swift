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
            Section {
                segmentItemSize
                segmentItemAppearance
                segmentSize
                stackOrientation
                shape
                stretch
                maxElements
            }
            Section {
                maxElementsAdditionalWindow
            }
        }
    }
    
    var segment: some View {
        SDDSSegment(
            data: viewModel.data,
            appearance: viewModel.appearance
        )
    }
    
    var segmentItemAppearance: some View {
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
    
    var segmentItemSize: some View {
        HStack {
            Text("Segment item size")
            Spacer()
            Menu {
                ForEach(SegmentItemSize.allCases, id: \.self) { size in
                    Button(size.rawValue) {
                        viewModel.segmentItemSize = size
                    }
                }
            } label: {
                if let size = viewModel.segmentItemSize as? SegmentItemSize {
                    Text(size.rawValue.capitalized)
                }
            }
        }
    }
    
    var stretch: some View {
        HStack {
            Toggle("Strech", isOn: $viewModel.strechMode)
        }
    }
    
    var segmentSize: some View {
        HStack {
            Text("Segment size")
            Spacer()
            Menu {
                ForEach(SegmentSize.allCases, id: \.self) { size in
                    Button(size.rawValue) {
                        viewModel.size = size
                    }
                }
            } label: {
                if let size = viewModel.size as? SegmentSize {
                    Text(size.rawValue.capitalized)
                }
            }
        }
    }
    
    var stackOrientation: some View {
        HStack {
            Picker("Stack orientation", selection: $viewModel.layoutOrientation) {
                ForEach(SegmentLayoutOrientation.allCases, id: \.self) { orientation in
                    Text(orientation.rawValue)
                }
            }
        }
    }
    
    var maxElements: some View {
        HStack {
            Text("Max elements")
            Spacer()
            TextField("Number", text: $viewModel.maxItemsString)
                .multilineTextAlignment(.trailing)
        }
    }
    
    var maxElementsAdditionalWindow: some View {
        ForEach(viewModel.data, id: \.id) { item in
            HStack {
                TextField(
                    "Label",
                    text: Binding(
                        get: { item.title },
                        set: { newTitle in
                            viewModel.updateSegmentItem(id: item.id, title: newTitle)
                        }
                    )
                )
                Spacer()
                Button("Delete") {
                    viewModel.removeItem(id: item.id)
                }
                .foregroundColor(.red)
            }
        }
    }
    
    public var shape: some View {
        HStack {
            Toggle("Pilled", isOn: $viewModel.isPilled)
        }
    }
}

#Preview {
    SegmentView(viewModel: SegmentViewModel())
}
