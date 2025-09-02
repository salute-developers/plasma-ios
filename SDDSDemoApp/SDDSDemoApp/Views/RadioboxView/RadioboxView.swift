import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSservTheme

struct RadioboxView: View {
    @ObservedObject private var viewModel: RadioboxViewModel = RadioboxViewModel()
    
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
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            
            Section {
                VariationsView(viewModel: viewModel)
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
                
            }
        }
        .navigationTitle("Radiobox")
    }
}

#Preview {
    RadioboxView()
}
