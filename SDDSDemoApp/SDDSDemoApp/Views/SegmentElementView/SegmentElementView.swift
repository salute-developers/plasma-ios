import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

public enum SegmentElementContentType: String, CaseIterable {
    case left = "left"
    case right = "right"
    case none = "none"
}

public struct SegmentElementView: View {
    @ObservedObject private var viewModel: SegmentElementViewModel
    
    init(viewModel: SegmentElementViewModel = SegmentElementViewModel()) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List {
            segmentView
            Section {
                title
                subtitle
                size
                appearance
                icon
                alignment
            }
        }
    }
    
    public var segmentView: some View {
        HStack {
            Spacer()
            SDDSSegmentElement(title: viewModel.title,
                               contentType: .none,
                               iconAttributes: viewModel.iconAttributes,
                               appearance: viewModel.appearance,
                               action: {}
            )
            Spacer()
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
                Text(viewModel.variationName)
            }
        }
    }
    
    public var contentType: some View {
        HStack {
            Text("type")
            Spacer()
            Menu {
                ForEach(SegmentElementContentType.allCases, id: \.self) { type in
                    Button(type.rawValue) {
                        //                        switch type {
                        //                        case .left:
                        //
                        //                            viewModel.contentType = .left()
                        //                        }
                    }
                }
            } label: {
                Text("type")
            }
        }
    }
    
    public var icon: some View {
        HStack {
            Toggle("Icon", isOn: $viewModel.isIconVisible)
        }
    }
    
    public var alignment: some View {
        HStack {
            Text("Alignment")
            Spacer()
            Menu {
                ForEach(SegmentElementAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue)
            }
        }
    }
}

#Preview {
    SegmentElementView(viewModel: SegmentElementViewModel())
}
