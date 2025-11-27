import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct TabItemView: View {
    @ObservedObject private var viewModel: TabItemViewModel = TabItemViewModel()

    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    if viewModel.tabItemType == .iconTabItem {
                        SDDSTabItem(
                            icon: Asset.plasma24.image,
                            counterValue: viewModel.counterValue,
                            isSelected: viewModel.isSelected,
                            isDisabled: viewModel.isDisabled,
                            orientation: viewModel.orientation,
                            appearance: viewModel.appearance
                        )
                    } else {
                        SDDSTabItem(
                            label: viewModel.label,
                            value: viewModel.value,
                            counterValue: viewModel.counterValue,
                            isSelected: viewModel.isSelected,
                            isDisabled: viewModel.isDisabled,
                            orientation: viewModel.orientation,
                            appearance: viewModel.appearance,
                            startContent: {
                                if viewModel.hasStartContent {
                                    Asset.plasma24.image
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 24, height: 24)
                                } else {
                                    EmptyView()
                                }
                            },
                            contentRight: {
                                if viewModel.hasEndContent {
                                    Asset.plasma24.image
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 24, height: 24)
                                } else {
                                    EmptyView()
                                }
                            },
                            actionContent: {
                                EmptyView()
                            }
                        )
                    }
                    Spacer()
                }
                .padding()
            }

            Section {
                HStack {
                    Text("Tab Item Type")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSTabItemType.allCases, id: \.self) { type in
                            Button(type.rawValue) {
                                viewModel.tabItemType = type
                            }
                        }
                    } label: {
                        Text(viewModel.tabItemType.rawValue)
                    }
                }
                
                VariationsView(viewModel: viewModel)
                
                if viewModel.tabItemType != .iconTabItem {
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
                
                Toggle("Has Counter", isOn: $viewModel.hasCounter)
                
                if viewModel.hasCounter {
                    HStack {
                        Text("Counter Value")
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
                
                Toggle("Selected", isOn: $viewModel.isSelected)
                
                Toggle("Disabled", isOn: $viewModel.isDisabled)
                
                if viewModel.tabItemType != .iconTabItem {
                    Toggle("Has Start Content (Icon)", isOn: $viewModel.hasStartContent)
                    Toggle("Has End Content (Icon)", isOn: $viewModel.hasEndContent)
                }
                
                HStack {
                    Text("Orientation")
                    Spacer()
                    Picker("Orientation", selection: $viewModel.orientation) {
                        Text("Horizontal").tag(TabsOrientation.horizontal)
                        Text("Vertical").tag(TabsOrientation.vertical)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
        .navigationTitle("Tab Item")
    }
}

#Preview {
    NavigationView {
        TabItemView()
    }
}
