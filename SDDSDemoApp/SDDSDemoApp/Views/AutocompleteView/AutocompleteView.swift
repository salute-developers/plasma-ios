import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme
import SDDSIcons

struct AutocompleteView: View {
    @ObservedObject private var viewModel: AutocompleteViewModel = AutocompleteViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                autocompleteForPosition(viewModel.fieldAlignment)
                    .padding()
            }
            .frame(height: 300)
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .listRowInsets(.init())
            
            Section {
                layoutPicker
                fieldAlignmentView
                VariationsView(viewModel: viewModel)
                withEmptyStateToggle
                showLoadingToggle
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Autocomplete")
    }
    
    @ViewBuilder
    private func autocompleteForPosition(_ position: AutocompleteFieldAlignment) -> some View {
        switch position {
        case .topLeft:
            VStack {
                HStack {
                    autocompleteField
                    Spacer()
                }
                Spacer()
            }
        case .topCenter:
            VStack {
                HStack {
                    Spacer()
                    autocompleteField
                    Spacer()
                }
                Spacer()
            }
        case .topRight:
            VStack {
                HStack {
                    Spacer()
                    autocompleteField
                }
                Spacer()
            }
        case .centerLeft:
            HStack {
                autocompleteField
                Spacer()
            }
        case .center:
            HStack {
                Spacer()
                autocompleteField
                Spacer()
            }
        case .centerRight:
            HStack {
                Spacer()
                autocompleteField
            }
        case .bottomLeft:
            VStack {
                Spacer()
                HStack {
                    autocompleteField
                    Spacer()
                }
            }
        case .bottomCenter:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    autocompleteField
                    Spacer()
                }
            }
        case .bottomRight:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    autocompleteField
                }
            }
        }
    }
    
    private var autocompleteField: some View {
        SDDSAutocomplete(
            value: $viewModel.value,
            title: "Поиск",
            placeholder: "введите текст",
            appearance: viewModel.appearance,
            actionContent: Action {
                Asset.search36.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            },
            isDropdownPresented: $viewModel.isDropdownPresented,
            items: viewModel.listItems,
            isLoading: viewModel.showLoading,
            shouldShowEmptyState: viewModel.shouldShowEmptyState,
            placementMode: .strict,
            onItemSelected: { index in
                if index < viewModel.filteredNames.count {
                    let selectedName = viewModel.filteredNames[index]
                    viewModel.value = .single(selectedName)
                    viewModel.isDropdownPresented = false
                    viewModel.updateListItems(with: .single(selectedName))
                }
            },
            loaderContent: {
                // Loader content - показывается только когда есть элементы (как lastItem в списке)
                HStack {
                    Spacer()
                    SDDSSpinner(isAnimating: true, appearance: Spinner.xs.default.appearance)
                    Text("Загрузка")
                    Spacer()
                }
                .frame(height: 48) // Фиксированная высота, как у SDDSListItem
                .padding(.horizontal)
            },
            emptyStateContent: {
                // Empty state content
                VStack(spacing: 4) {
                    Image("plasma")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.secondary)
                    
                    Text("Ничего не найдено")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    Text("Попробуйте изменить запрос")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.secondary)
                }
                .frame(height: 91)
                .frame(maxWidth: .infinity)
            }
        )
        .frame(width: UIScreen.main.bounds.width / 1.5) // Делаем в 1.5 раза уже
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .onChange(of: viewModel.value) { _ in
            // Читаем актуальное значение напрямую из viewModel.value в момент выполнения
            let currentValue = viewModel.value
            viewModel.updateListItems(with: currentValue)
        }
    }
    
    private var layoutPicker: some View {
        Picker("Layout", selection: $viewModel.layout) {
            ForEach(AutocompleteLayout.allCases, id: \.self) { layout in
                Text(layout.rawValue.capitalized).tag(layout)
            }
        }
    }
    
    private var fieldAlignmentView: some View {
        HStack {
            Text("Field Alignment")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(AutocompleteFieldAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue) {
                        viewModel.fieldAlignment = alignment
                    }
                }
            } label: {
                Text(viewModel.fieldAlignment.rawValue)
            }
        }
    }
    
    private var withEmptyStateToggle: some View {
        Toggle("With Empty State", isOn: $viewModel.withEmptyState)
    }
    
    private var showLoadingToggle: some View {
        Toggle("Show Loading", isOn: $viewModel.showLoading)
    }
    
}

#Preview {
    NavigationView {
        AutocompleteView()
    }
}

