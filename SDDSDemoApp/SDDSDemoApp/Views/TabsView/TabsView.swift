import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct TabsView: View {
    @ObservedObject private var viewModel: TabsViewModel = TabsViewModel()

    var body: some View {
        List {
            Section {
                SDDSTabs(
                    items: viewModel.tabsItems,
                    selectedId: viewModel.selectedId,
                    clipMode: viewModel.clipMode,
                    tabItemType: viewModel.tabItemType,
                    stretch: viewModel.stretch,
                    appearance: viewModel.appearance,
                    onSelect: { id in
                        viewModel.selectedId = id
                    }
                )
            }

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
                
                if viewModel.tabsType != .iconTabs {
                    HStack {
                        Text("Tab Item Type")
                        Spacer()
                        Menu {
                            Button("Default") {
                                viewModel.tabItemType = .default
                            }
                            Button("Header") {
                                viewModel.tabItemType = .header
                            }
                        } label: {
                            Text(viewModel.tabItemType == .default ? "Default" : "Header")
                        }
                    }
                }
                
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
                
                if viewModel.clipModeType == .showMore {
                    HStack {
                        Text("Show All Text")
                        Spacer()
                        TextField("Show All", text: $viewModel.showAllText)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Dropdown Max Height")
                        Spacer()
                        Stepper(
                            "\(Int(viewModel.dropdownMaxHeight))",
                            value: $viewModel.dropdownMaxHeight,
                            in: 100...500,
                            step: 50
                        )
                    }
                }
                
                HStack {
                    Text("Number of Tabs")
                    Spacer()
                    Stepper(
                        "\(viewModel.numberOfTabs)",
                        value: $viewModel.numberOfTabs,
                        in: 1...10
                    )
                }
                
                Toggle("Stretch", isOn: $viewModel.stretch)
            }
        }
        .navigationTitle("Tabs")
    }
}

#Preview {
    NavigationView {
        TabsView()
    }
}

