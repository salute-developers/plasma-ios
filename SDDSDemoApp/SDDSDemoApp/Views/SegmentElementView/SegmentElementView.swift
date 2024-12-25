import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

public struct SegmentElementView: View {
    @ObservedObject private var viewModel: SegmentElementViewModel
    
    init(viewModel: SegmentElementViewModel = SegmentElementViewModel()) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List {
            segmentView
            Section {
                segmentElementType
                title
                subtitle
                size
                appearance
                alignment
                disabled
                shapeStyle
            }
    
            Section {
                counter
            }
        }
    }
    
    public var segmentView: some View {
        HStack {
            Spacer()
            SDDSSegmentElement(
                title: viewModel.title,
                subtitle: viewModel.subtitle,
                iconAttributes: viewModel.iconAttributes,
                isDisabled: viewModel.isDisabled,
                appearance: viewModel.appearance,
                counter: viewModel.counter,
                action: {}
            )
            Spacer()
        }
    }
    
    public var segmentElementType: some View {
        HStack {
            Text("Content Type")
            Spacer()
            Menu {
                ForEach(SegmentElementContentType.allCases, id: \.self) { content in
                    Button {
                        viewModel.contentType = content
                    } label: {
                        Text(content.rawValue.capitalized)
                    }
                }
            } label: {
                Text(viewModel.contentType.rawValue.capitalized)
            }
        }
    }
    
    public var title: some View {
        HStack {
            Text("Title")
            TextField("Title", text: $viewModel.title)
                .multilineTextAlignment(.trailing)
        }
    }
    
    public var subtitle: some View {
        HStack {
            Text("Value")
            TextField("Subtitle", text: $viewModel.subtitle)
                .multilineTextAlignment(.trailing)
        }
    }
    
    public var size: some View {
        HStack {
            Text("Size")
            Spacer()
            Menu {
                ForEach(SegmentElementSize.allCases, id: \.self) { size in
                    Button(size.rawValue) {
                        viewModel.size = size
                        viewModel.counterSize = size.counterSize
                    }
                }
            } label: {
                if let size = viewModel.size as? SegmentElementSize {
                    Text(size.rawValue)
                }
            }
        }
    }
    
    public var appearance: some View {
        HStack {
            Text("Appearance")
            Spacer()
            Menu {
                ForEach(SDDSSegmentElement.all, id: \.self) { variation in
                    Button(variation.name) {
                        viewModel.appearance = variation.appearance.size(viewModel.size)
                        viewModel.variationName = variation.name
                    }
                }
            } label: {
                Text(viewModel.variationName.capitalized)
            }
        }
    }
    
    public var shapeStyle: some View {
        HStack {
            Toggle("Pilled", isOn: $viewModel.isPilled)
        }
    }
    
    public var alignment: some View {
        HStack {
            Text("icon Alignment")
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
    
    public var disabled: some View {
        HStack {
            Toggle("Disabled", isOn: $viewModel.isDisabled)
        }
    }
    
    public var counter: some View {
        VStack {
            HStack {
                Text("Appearance")
                Spacer()
                Menu {
                    ForEach(SDDSCounter.all, id: \.self) { variation in
                        Button(variation.name) {
                            viewModel.counterAppearance = variation.appearance.size(viewModel.appearance.size.counterSize)
                            viewModel.counterVariationName = variation.name
                        }
                    }
                } label: {
                    Text(viewModel.counterVariationName.capitalized)
                }
            }
            Divider()
            HStack {
                Text("Counter data")
                TextField("Number", text: $viewModel.counterData.value)
                    .multilineTextAlignment(.trailing)
            }
            Divider()
            HStack {
                Text("Current Size")
                Spacer()
                if let currentSize = viewModel.size.counterSize as? CounterSize, viewModel.isCounterVisible {
                    Text(currentSize.rawValue)
                } else {
                    Text("none")
                        .foregroundColor(Color.gray.opacity(0.5))
                }
            }
        }
    }
}

#Preview {
    SegmentElementView(viewModel: SegmentElementViewModel())
}
