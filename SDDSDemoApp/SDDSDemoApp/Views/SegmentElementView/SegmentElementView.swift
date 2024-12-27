import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class SegmentElementViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var size: SegmentElementSizeConfiguration = SegmentElementSize.medium
    @Published var contentType: SegmentElementContent = .none
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isDisabled: Bool = false
    @Published var appearance: SegmentElementAppearance = SDDSSegmentElement.default.appearance
    @Published var variationName: String = SDDSSegmentElement.clear.name

    var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
    }

    private func observeSizeChange() {
        $size
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                self.appearance = self.appearance.size(value)
            }
            .store(in: &cancellables)
    }
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
            }
        }
    }
    
    public var segmentView: some View {
        HStack {
            Spacer()
            SDDSSegmentElement(title: viewModel.title,
                               contentType: .none,
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
    
//    public var contentType: some View {
//        
//    }
    
}

#Preview {
    SegmentElementView(viewModel: SegmentElementViewModel())
}
