import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SelectView: View {
    @ObservedObject private var viewModel = SelectViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                SDDSSelect(
                    triggerStyle: viewModel.triggerStyle,
                    text: viewModel.displayText,
                    chips: viewModel.displayChips,
                    title: "Город",
                    placeholder: "Выберите значение",
                    disabled: viewModel.disabled,
                    readOnly: viewModel.readOnly,
                    appearance: viewModel.appearance,
                    isDropdownPresented: $viewModel.isDropdownPresented,
                    options: viewModel.displayedOptions,
                    selectionMode: viewModel.mode == .single ? .single : .multiple,
                    closeOnSingleSelection: viewModel.closeOnSingleSelection,
                    isLoading: viewModel.isLoading,
                    shouldShowEmptyState: viewModel.showEmptyState,
                    onOptionTap: { index in
                        viewModel.handleTap(at: index)
                    },
                    headerContent: {
                        if viewModel.showHeader {
                            Text("Выберите город")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                        }
                    },
                    footerContent: {
                        if viewModel.showFooter {
                            Text("Футер")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                        }
                    },
                    loaderContent: {
                        HStack {
                            Spacer()
                            SDDSSpinner(isAnimating: true, appearance: Spinner.xs.default.appearance)
                            Text("Загрузка")
                                .foregroundStyle(.secondary)
                                .padding(.leading, 8)
                            Spacer()
                        }
                        .frame(height: 48)
                    },
                    emptyStateContent: {
                        VStack(spacing: 4) {
                            Text("Нет данных")
                                .font(.headline)
                            Text("Попробуйте изменить фильтр")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 91)
                    }
                )
                .padding()
            }
            .frame(height: 320)
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .listRowInsets(.init())
            
            Section {
                VariationsView(viewModel: viewModel)
                
                Picker("Trigger", selection: $viewModel.triggerStyle) {
                    Text("TextField").tag(SelectTriggerStyle.textField)
                    Text("Button").tag(SelectTriggerStyle.button)
                }
                
                Picker("Mode", selection: $viewModel.mode) {
                    ForEach(SelectDemoMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue.capitalized).tag(mode)
                    }
                }
                
                Picker("Layout", selection: $viewModel.layout) {
                    ForEach(SelectDemoLayout.allCases, id: \.self) { layout in
                        Text(layout.rawValue.capitalized).tag(layout)
                    }
                }
                
                Toggle("Disabled", isOn: $viewModel.disabled)
                Toggle("Read only", isOn: $viewModel.readOnly)
                Toggle("Loading", isOn: $viewModel.isLoading)
                Toggle("Close on single select", isOn: $viewModel.closeOnSingleSelection)
                Toggle("Empty state", isOn: $viewModel.showEmptyState)
                Toggle("Header", isOn: $viewModel.showHeader)
                Toggle("Footer", isOn: $viewModel.showFooter)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Select")
    }
}

#Preview {
    NavigationView {
        SelectView()
    }
}

