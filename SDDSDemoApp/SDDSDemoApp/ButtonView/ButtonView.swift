import Foundation
import SwiftUI
import Combine
import SDDSComponents

final class ButtonViewModel: ObservableObject {
    @Published var buttonViewModel: SDDSButtonViewModel
    @Published var isIconVisible: Bool = false
    @Published var alignment: SDDSComponents.Alignment = .left
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(buttonViewModel: SDDSButtonViewModel = SDDSButtonViewModel(style: .black)) {
        self.buttonViewModel = buttonViewModel
            
        observeButtonViewModelValues()
        observeIcon()
    }
    
    private func observeButtonViewModelValues() {
        buttonViewModel.$size
            .combineLatest(buttonViewModel.$layoutMode)
            .combineLatest(buttonViewModel.$iconAttributes)
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    private func observeIcon() {
        $isIconVisible
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                if value {
                    self.setIconAttributes(alignment: self.alignment)
                } else {
                    self.buttonViewModel.iconAttributes = nil
                }
            }
            .store(in: &cancellables)
        
        $alignment
            .sink { [weak self] value in
                guard let self = self, isIconVisible else {
                    return
                }
                self.setIconAttributes(alignment: value)
            }
            .store(in: &cancellables)
    }
    
    private func setIconAttributes(alignment: SDDSComponents.Alignment) {
        buttonViewModel.iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.Alignment) -> ButtonIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
}

struct ButtonView: View {
    @ObservedObject private var viewModel: ButtonViewModel
    
    init(viewModel: ButtonViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSButton(viewModel: viewModel.buttonViewModel)
                    Spacer()
                }
                .frame(height: 150)
            }
            
            Section {
                HStack {
                    Text("Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                }
                HStack {
                    Text("Title")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Button Title", text: $viewModel.buttonViewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Value")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Button Value", text: $viewModel.buttonViewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Toggle("Icon", isOn: $viewModel.isIconVisible)
                }
                HStack {
                    Text("Icon Alignment")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSComponents.Alignment.allCases, id: \.self) { alignment in
                            Button(alignment.rawValue.capitalized) {
                                viewModel.alignment = alignment
                            }
                        }
                    } label: {
                        Text(viewModel.alignment.rawValue)
                    }
                }
                HStack {
                    Text("Size")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(ButtonSize.allCases, id: \.self) { size in
                            Button(size.rawValue) {
                                viewModel.buttonViewModel.size = size
                            }
                        }
                    } label: {
                        Text(viewModel.buttonViewModel.size.rawValue)
                    }
                }
                HStack {
                    Text("Layout")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(ButtonLayoutMode.allCases, id: \.self) { layoutMode in
                            Button(layoutMode.title) {
                                viewModel.buttonViewModel.layoutMode = layoutMode
                            }
                        }
                    } label: {
                        Text(viewModel.buttonViewModel.layoutMode.title)
                    }
                }
                HStack {
                    Toggle("Disabled", isOn: $viewModel.buttonViewModel.isDisabled)
                }
                HStack {
                    Toggle("Loading", isOn: $viewModel.buttonViewModel.isLoading)
                }
            }
        }
    }
}

#Preview {
    ButtonView(viewModel: ButtonViewModel())
}
