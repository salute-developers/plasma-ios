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
                    label: viewModel.label,
                    title: viewModel.title,
                    subtitle: viewModel.subtitle,
                    counterText: viewModel.layout == .listNumberedItem ? viewModel.counterText : nil,
                    rightContentEnabled: viewModel.rightContentEnabled,
                    disabled: viewModel.disabled,
                    appearance: viewModel.appearance
                )
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .listRowInsets(EdgeInsets())
            
            Section {
                Picker("Layout", selection: $viewModel.layout) {
                    ForEach(ListItemLayout.itemLayouts, id: \.self) { layout in
                        Text(layout.rawValue.capitalized).tag(layout)
                    }
                }
                VariationsView(viewModel: viewModel)
                VStack {
                    HStack {
                        Text("Label")
                        Spacer()
                        TextField("Label", text: $viewModel.label)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Title")
                        Spacer()
                        TextField("Title", text: $viewModel.title)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Subtitle")
                        Spacer()
                        TextField("Subtitle", text: $viewModel.subtitle)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Counter")
                        Spacer()
                        TextField("Counter", text: $viewModel.counterText)
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
