import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct RadioboxView: View {
    @ObservedObject private var viewModel: RadioboxViewModel
    
    init(viewModel: RadioboxViewModel = RadioboxViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSRadiobox(
                        isSelected: $viewModel.isSelected,
                        title: viewModel.title,
                        subtitle: viewModel.subtitle,
                        isEnabled: viewModel.isEnabled,
                        images: RadioboxView.radiobox,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Radiobox Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Subtitle")
                    Spacer()
                    TextField("Radiobox Subtitle", text: $viewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("State")
                    Spacer()
                    Toggle("Selected", isOn: $viewModel.isSelected)
                }
                
                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
                
                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSRadioboxSize.allCases, id: \.self) { size in
                        Button(size.description) {
                            viewModel.size = size
                        }
                    }
                }
                
                Picker("Appearance", selection: $viewModel.appearance) {
                    ForEach(SDDSRadiobox.all, id: \.self) { variation in
                        Button(variation.name) {
                            viewModel.appearance = variation.appearance.size(viewModel.size)
                            viewModel.variationName = variation.name
                        }
                    }
                }
                
            }
        }
        .navigationTitle("SDDSRadiobox")
    }
}

extension RadioboxView {
    static var radiobox: RadioboxImages {
        .init(
            selectedImage: Image.image("radioboxOn", bundle: Bundle(for: CheckboxViewModel.self)),
            deselectedImage: Image.image("radioboxIconOff", bundle: Bundle(for: CheckboxViewModel.self))
        )
    }
}

#Preview {
    RadioboxView(viewModel: RadioboxViewModel())
}
