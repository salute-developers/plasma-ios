import Foundation
import SwiftUI
import Combine
import SDDSComponents

final class ButtonViewModel: ObservableObject {
    @Published var buttonViewModel: SDDSButtonViewModel
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(buttonViewModel: SDDSButtonViewModel = SDDSButtonViewModel(style: .black)) {
        self.buttonViewModel = buttonViewModel
            
        observeValues()
    }
    
    private func observeValues() {
        buttonViewModel.$size
            .combineLatest(buttonViewModel.$layoutMode)
            .sink { [weak self] arguments in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
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
                    Text("Icon")
                    Spacer()
                        .frame(maxWidth: .infinity)
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
