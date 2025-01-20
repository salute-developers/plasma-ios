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
                stackOrientation
                maxElements
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
            layoutMode: viewModel.layoutMode
        )
    }
    
    var segmentElementAppearance: some View {
        HStack {
            Text("Segment Appearance")
            Spacer()
                .frame(width: .infinity)
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
            TextField("Number", text: $viewModel.maxElementsString)
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
                    viewModel.removeElement(at: index)
                }
                .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    SegmentView(viewModel: SegmentViewModel())
}
