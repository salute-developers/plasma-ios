import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme
import SDDSIcons

struct TabsView: View {
    @ObservedObject private var viewModel: TabsViewModel = TabsViewModel()
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        List {
            Section {
                HStack {
                    SDDSTabs(
                        items: viewModel.tabsItems,
                        selectedId: viewModel.selectedId,
                        clipMode: viewModel.clipMode,
                        stretch: viewModel.stretch,
                        hasDivider: viewModel.hasDivider,
                        appearance: viewModel.appearance,
                        onSelect: { id in
                            viewModel.selectedId = id
                        }
                    )
                    .id(viewModel.tabsItemsIdentifier)
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)

            Section {
                HStack {
                    Text("Tabs Type")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSTabsType.allCases, id: \.self) { type in
                            Button(type.rawValue) {
                                viewModel.tabsType = type
                            }
                        }
                    } label: {
                        Text(viewModel.tabsType.rawValue)
                    }
                }
                
                VariationsView(viewModel: viewModel)
                
                HStack {
                    Text("Clip Mode")
                    Spacer()
                    Menu {
                        ForEach(TabsViewModel.ClipModeType.allCases, id: \.self) { mode in
                                Button(mode.rawValue) {
                                    viewModel.clipModeType = mode
                            }
                        }
                    } label: {
                        Text(viewModel.clipModeType.rawValue)
                    }
                }
                
                if viewModel.clipModeType == .showMore && viewModel.tabsType != .iconTabs {
                    HStack {
                        Text("Show All Text")
                        Spacer()
                        TextField("Show All", text: $viewModel.showAllText)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                HStack {
                    Text("Number of Tabs")
                    Spacer()
                    Stepper(
                        "\(viewModel.numberOfTabs)",
                        value: $viewModel.numberOfTabs,
                        in: 1...100
                    )
                }
                
                Toggle("Stretch", isOn: $viewModel.stretch)
                Toggle("Has Divider", isOn: $viewModel.hasDivider)
            }
            
            Section {
                if viewModel.tabsType != .iconTabs {
                    HStack {
                        Text("Label")
                        Spacer()
                        TextField("Label", text: $viewModel.label)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Toggle("Has Value", isOn: $viewModel.hasValue)
                    
                    if viewModel.hasValue {
                        HStack {
                            Text("Value")
                            Spacer()
                            TextField("Value", text: Binding(
                                get: { viewModel.value ?? "" },
                                set: { viewModel.value = $0.isEmpty ? nil : $0 }
                            ))
                            .multilineTextAlignment(.trailing)
                        }
                    }
                    
                    if viewModel.tabsType == .tabsDefault {
                        Toggle("Has Start Content Icon", isOn: $viewModel.hasStartContentIcon)
                        if viewModel.appearance.size.orientation == .horizontal {
                            Toggle("Has End Content Icon", isOn: $viewModel.hasEndContentIcon)
                        }
                    }
                }
                Toggle("Has Action", isOn: $viewModel.hasAction)
                
                if viewModel.tabsType != .tabsHeader {
                    counter
                }
                
                Toggle("Disabled", isOn: $viewModel.isDisabled)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .id(viewModel.tabsType)
        .navigationTitle("Tabs")
    }
    
    @ViewBuilder
    private var counter: some View {
        Toggle("Has \(viewModel.counterName)", isOn: $viewModel.hasCounter)
        
        if viewModel.hasCounter {
            HStack {
                Text("\(viewModel.counterName) Value")
                Spacer()
                Stepper(
                    "\(viewModel.counterValue ?? 0)",
                    value: Binding(
                        get: { viewModel.counterValue ?? 0 },
                        set: { viewModel.counterValue = $0 }
                    ),
                    in: 0...99
                )
            }
        }
    }
}

#Preview {
    NavigationView {
        TabsView()
    }
}
