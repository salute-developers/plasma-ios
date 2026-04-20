import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SandboxSwiftUI

struct AutocompleteView: View {
    @ObservedObject private var viewModel: AutocompleteViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: AutocompleteViewModel = AutocompleteViewModel()) {
        self.viewModel = viewModel
    }

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
                    viewModel.markDropdownItemSelectionPending()
                    viewModel.value = .single(selectedName)
                    viewModel.isDropdownPresented = false
                    viewModel.updateListItems(with: .single(selectedName))
                }
            },
            loaderContent: {
                HStack(spacing: 8) {
                    SDDSSpinner(
                        isAnimating: true,
                        appearance: loaderSpinnerAppearance
                    )
                    Text("Загрузка")
                        .typography(loaderTitleTypography)
                        .foregroundStyle(loaderTitleColor)
                    Spacer(minLength: 0)
                }
                .padding(.leading, loaderListItemAppearance.size.paddingStart)
                .padding(.trailing, loaderListItemAppearance.size.paddingEnd)
                .padding(.top, loaderListItemAppearance.size.paddingTop)
                .padding(.bottom, loaderListItemAppearance.size.paddingBottom)
                .frame(height: loaderListItemAppearance.size.height)
                .frame(maxWidth: .infinity, alignment: .leading)
            },
            emptyStateContent: {
                VStack(spacing: 4) {
                    Asset.plasma24.image
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
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .onChange(of: viewModel.value) { _ in
            viewModel.handleValueChangedForDropdown()
        }
    }
    
    private var loaderSpinnerAppearance: SpinnerAppearance {
        if let appearance = loaderSmallSpinnerAppearance {
            return appearance
        }

        return SpinnerAppearance(
            startColor: ColorToken(
                id: "autocompleteLoaderStartFallback",
                darkColor: .white,
                lightColor: .black
            ),
            endColor: ColorToken(
                id: "autocompleteLoaderEndFallback",
                darkColor: .gray,
                lightColor: .gray
            ),
            size: DefaultSpinnerSize(size: 16)
        )
    }

    private var loaderSmallSpinnerAppearance: SpinnerAppearance? {
        let appearances: [SpinnerAppearance] = viewModel.theme.spinnerVariations.flatMap { variation in
            if variation.styles.isEmpty {
                return [variation.appearance]
            }
            return variation.styles.map(\.appearance)
        }
        guard !appearances.isEmpty else {
            return nil
        }

        guard var smallest = (
            appearances
                .filter { $0.startColor != .clearColor || $0.endColor != .clearColor }
                .min(by: { $0.size.size < $1.size.size })
        )
        else {
            return nil
        }

        let resolvedSize = min(smallest.size.size, 16)
        smallest.size = DefaultSpinnerSize(
            size: resolvedSize,
            padding: smallest.size.padding,
            angle: smallest.size.angle
        )
        return smallest
    }

    private var loaderListItemAppearance: ListItemAppearance {
        viewModel.appearance.dropdownAppearance.listAppearance.listItemAppearance
    }

    private var loaderTitleTypography: TypographyToken {
        loaderListItemAppearance.titleTypography.typography(with: loaderListItemAppearance.size) ?? .undefined
    }

    private var loaderTitleColor: Color {
        loaderListItemAppearance.titleColor.color(for: colorScheme, subtheme: viewModel.theme.subtheme(viewModel.subtheme))
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

