import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct SelectView: View {
    @ObservedObject private var viewModel = SelectViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                selectForPosition(viewModel.triggerPosition)
                    .padding()
            }
            .frame(height: 320)
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .listRowInsets(.init())
            
            Section {
                VariationsView(viewModel: viewModel)
                
                Picker("Trigger", selection: $viewModel.triggerKind) {
                    Text("TextField").tag(SelectTriggerKind.textField)
                    Text("Button").tag(SelectTriggerKind.button)
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
                
                HStack {
                    Text("Trigger Position")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SelectTriggerPosition.allCases, id: \.self) { position in
                            Button(position.rawValue) {
                                viewModel.triggerPosition = position
                            }
                        }
                    } label: {
                        Text(viewModel.triggerPosition.rawValue)
                    }
                }
                
                placementSelectionView
                alignmentSelectionView
                placementModeSelectionView
                
                Toggle("Disabled", isOn: $viewModel.disabled)
                Toggle("Read only", isOn: $viewModel.readOnly)
                Toggle("Loading", isOn: $viewModel.isLoading)
                Toggle("Empty state", isOn: $viewModel.showEmptyState)
                Toggle("Header", isOn: $viewModel.showHeader)
                Toggle("Footer", isOn: $viewModel.showFooter)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Select")
    }
    
    @ViewBuilder
    private func selectForPosition(_ position: SelectTriggerPosition) -> some View {
        switch position {
        case .topStart:
            VStack {
                HStack {
                    selectControl
                    Spacer()
                }
                Spacer()
            }
        case .topCenter:
            VStack {
                HStack {
                    Spacer()
                    selectControl
                    Spacer()
                }
                Spacer()
            }
        case .topEnd:
            VStack {
                HStack {
                    Spacer()
                    selectControl
                }
                Spacer()
            }
        case .centerStart:
            HStack {
                selectControl
                Spacer()
            }
        case .center:
            HStack {
                Spacer()
                selectControl
                Spacer()
            }
        case .centerEnd:
            HStack {
                Spacer()
                selectControl
            }
        case .bottomStart:
            VStack {
                Spacer()
                HStack {
                    selectControl
                    Spacer()
                }
            }
        case .bottomCenter:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    selectControl
                    Spacer()
                }
            }
        case .bottomEnd:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    selectControl
                }
            }
        }
    }
    
    private var selectControl: some View {
        SDDSSelect(
            triggerStyle: triggerStyle,
            text: viewModel.displayText,
            chips: viewModel.displayChips,
            disabled: viewModel.disabled,
            readOnly: viewModel.readOnly,
            appearance: viewModel.appearance,
            isDropdownPresented: $viewModel.isDropdownPresented,
            options: viewModel.displayedOptions,
            selectionMode: viewModel.mode == .single ? .single : .multiple,
            isLoading: viewModel.isLoading,
            shouldShowEmptyState: viewModel.showEmptyState,
            placement: viewModel.placement,
            triggerAlignment: viewModel.alignment,
            placementMode: viewModel.placementMode,
            onOptionTap: { index in
                viewModel.handleTap(at: index)
            },
            headerContent: {
                if viewModel.showHeader {
                    Text("Header")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                }
            },
            footerContent: {
                if viewModel.showFooter {
                    Text("Footer")
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
        .frame(width: 220, alignment: .leading)
    }
    
    private var triggerStyle: SelectTriggerStyle {
        switch viewModel.triggerKind {
        case .textField:
            return .textField(
                TextFieldData(
                    title: "Город",
                    placeholder: "Город",
                    caption: "Выберите город",
                    appearance: viewModel.appearance.textFieldAppearance,
                    iconContent: {
                        AnyView(
                            Asset.search24.image
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                    }
                )
            )
        case .button:
            return .button(
                ButtonData(
                    title: "Город",
                    appearance: viewModel.appearance.buttonAppearance,
                    layoutMode: .fixedWidth(.packed),
                    action: {}
                )
            )
        }
    }
    
    private var placementSelectionView: some View {
        HStack {
            Text("Placement")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverPlacement.allCases, id: \.self) { placement in
                    Button(placement.rawValue) {
                        viewModel.placement = placement
                    }
                }
            } label: {
                Text(viewModel.placement.rawValue)
            }
        }
    }
    
    private var alignmentSelectionView: some View {
        HStack {
            Text("Alignment")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue.capitalized) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue.capitalized)
            }
        }
    }
    
    private var placementModeSelectionView: some View {
        HStack {
            Text("Placement Mode")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverPlacementMode.allCases, id: \.self) { mode in
                    Button(mode.rawValue.capitalized) {
                        viewModel.placementMode = mode
                    }
                }
            } label: {
                Text(viewModel.placementMode.rawValue.capitalized)
            }
        }
    }
}

#Preview {
    NavigationView {
        SelectView()
    }
}

