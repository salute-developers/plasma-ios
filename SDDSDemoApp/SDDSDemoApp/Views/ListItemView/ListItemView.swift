import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme
import SDDSIcons

struct ListItemView: View {
    @ObservedObject private var viewModel: ListItemViewModel
    @Environment(\.colorScheme) private var colorScheme
    
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
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
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
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
    }
}

#Preview {
    ListItemView()
} 
