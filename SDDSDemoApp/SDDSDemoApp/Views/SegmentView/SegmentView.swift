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
                segmentElementAppearance
                segmentSize
                stackOrientation
                maxElements
                shape
            }
            Section {
                maxElementsAdditional
            }
        }
    }
    
    var segment: some View {
        SDDSSegment(
            data: viewModel.data,
            size: viewModel.size,
            layoutMode: viewModel.layoutMode,
            shapeStyle: viewModel.shapeStyle
        )
    }
    
    var segmentElementAppearance: some View {
        HStack {
            Text("Segment Appearance")
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
    
    var segmentSize: some View {
        HStack {
            Text("Segment size")
            Spacer()
            Menu {
                ForEach(SegmentItemSize.allCases, id: \.self) { size in
                    Button(size.rawValue) {
                        viewModel.segmentItemAppearance = viewModel.segmentItemAppearance.size(size)
                    }
                }
            } label: {
                if let size = viewModel.size as? SegmentItemSize {
                    Text(size.rawValue)
                }
            }
        }
    }
    
    var stackOrientation: some View {
        HStack {
            Picker("Stack orientation", selection: $viewModel.layoutMode) {
                ForEach(SegmentLayoutMode.allCases, id: \.self) { orientation in
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
    
    var maxElementsAdditional: some View {
        ForEach(viewModel.data.indices, id: \.self) { index in
            HStack {
                TextField(
                    "Label",
                    text: Binding(
                        get: {
                            guard !viewModel.data.isEmpty else {
                                return ""
                            }
                            return viewModel.data[index].title
                        },
                        set: { newTitle in
                            viewModel.updateSegmentItem(at: index, title: newTitle)
                        }
                    )
                )
                Spacer()
                Button("Delete") {
                    viewModel.removeItem(at: index)
                }
                .foregroundColor(.red)
            }
        }
    }
    
    public var shape: some View {
        HStack {
            Toggle("Shape style", isOn: $viewModel.shapeStyleToggle)
        }
    }
}

#Preview {
    SegmentView(viewModel: SegmentViewModel())
}
