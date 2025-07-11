import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct ListItemView: View {
    @ObservedObject private var viewModel: ListItemViewModel
    
    init() {
        self.viewModel = ListItemViewModel()
    }
    
    var body: some View {
        List {
            Section {
                SDDSListItem(
                    title: viewModel.title,
                    rightContentEnabled: viewModel.rightContentEnabled,
                    disabled: viewModel.disabled,
                    appearance: viewModel.appearance
                )
            }
            .listRowInsets(EdgeInsets())
            
            Section {
                Picker("Layout", selection: $viewModel.layout) {
                    ForEach(ListItemLayout.allCases, id: \.self) { layout in
                        Text(layout.rawValue.capitalized).tag(layout)
                    }
                }
                VariationsView(viewModel: viewModel)
                VStack {
                    HStack {
                        Text("Title")
                        Spacer()
                        TextField("Title", text: $viewModel.title)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Right Content")
                        Spacer()
                        Toggle("", isOn: $viewModel.rightContentEnabled)
                    }
                    HStack {
                        Text("Disabled")
                        Spacer()
                        Toggle("", isOn: $viewModel.disabled)
                    }
                }
            }
        }
    }
}

#Preview {
    ListItemView()
} 
