import SwiftUI
import SDDSComponents
import SDDSIcons
import SandboxSwiftUI

struct SelectView: View {
    @ObservedObject private var viewModel: SelectViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: SelectViewModel = SelectViewModel()) {
        self.viewModel = viewModel
    }

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
                        .typography(headerFooterTypography)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                }
            },
            footerContent: {
                if viewModel.showFooter {
                    if viewModel.isLoading {
                        HStack {
                            Spacer()
                            SDDSSpinner(isAnimating: true, appearance: loaderSpinnerAppearance)
                            Text("Загрузка")
                                .typography(headerFooterTypography)
                                .foregroundStyle(.secondary)
                                .padding(.leading, 8)
                            Spacer()
                        }
                        .frame(height: 48)
                    } else {
                        Text("Footer")
                            .typography(headerFooterTypography)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                    }
                }
            },
            loaderContent: {
                HStack {
                    Spacer()
                    SDDSSpinner(isAnimating: true, appearance: loaderSpinnerAppearance)
                    Text("Загрузка")
                        .typography(headerFooterTypography)
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
        .frame(width: 260, alignment: .leading)
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
                            searchIconAsset.image
                                .renderingMode(.template)
                                .resizable()
                                .frame(
                                    width: viewModel.appearance.textFieldAppearance.size.iconSize.width,
                                    height: viewModel.appearance.textFieldAppearance.size.iconSize.height
                                )
                                .aspectRatio(contentMode: .fit)
                        )
                    },
                    actionContent: {
                        AnyView(
                            disclosureIconAsset.image
                                .renderingMode(.template)
                                .resizable()
                                .frame(
                                    width: viewModel.appearance.textFieldAppearance.size.iconActionSize.width,
                                    height: viewModel.appearance.textFieldAppearance.size.iconActionSize.height
                                )
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.primary)
                                .opacity(viewModel.readOnly ? 0.4 : 1.0)
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
    
    private var searchIconAsset: ImageAsset {
        let iconWidth = viewModel.appearance.textFieldAppearance.size.iconSize.width
        if iconWidth <= 16 {
            return Asset.search16
        } else if iconWidth <= 24 {
            return Asset.search24
        } else {
            return Asset.search36
        }
    }
    
    private var disclosureIconAsset: ImageAsset {
        let iconWidth = viewModel.appearance.textFieldAppearance.size.iconActionSize.width
        if viewModel.isDropdownPresented {
            if iconWidth <= 16 {
                return Asset.disclosureUpOutline16
            } else if iconWidth <= 24 {
                return Asset.disclosureUpOutline24
            } else {
                return Asset.disclosureUpOutline36
            }
        } else {
            if iconWidth <= 16 {
                return Asset.disclosureDownOutline16
            } else if iconWidth <= 24 {
                return Asset.disclosureDownOutline24
            } else {
                return Asset.disclosureDownOutline36
            }
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
    
    private var headerFooterTypography: TypographyToken {
        let cellAppearance = viewModel.appearance.selectItemAppearance.cellAppearance
        return cellAppearance.titleTypography.typography(with: cellAppearance.size) ?? .undefined
    }
    
    private var loaderSpinnerAppearance: SpinnerAppearance {
        if let appearance = loaderVisibleSpinnerAppearance {
            return appearance
        }
        
        return SpinnerAppearance(
            startColor: ColorToken(
                id: "selectLoaderStartFallback",
                darkColor: .white,
                lightColor: .black
            ),
            endColor: ColorToken(
                id: "selectLoaderEndFallback",
                darkColor: .gray,
                lightColor: .gray
            ),
            size: DefaultSpinnerSize(size: 16)
        )
    }
    
    private var loaderVisibleSpinnerAppearance: SpinnerAppearance? {
        let appearances: [SpinnerAppearance] = viewModel.theme.spinnerVariations.flatMap { variation in
            if variation.styles.isEmpty {
                return [variation.appearance]
            }
            return variation.styles.map(\.appearance)
        }
        
        guard var visible = appearances.first(
            where: { $0.startColor.resolvedDefaultValue() != .color(.clearColor) || $0.endColor.resolvedDefaultValue() != .color(.clearColor) }
        ) else {
            return nil
        }
        
        let resolvedSize = min(visible.size.size, 16)
        visible.size = DefaultSpinnerSize(
            size: resolvedSize,
            padding: visible.size.padding,
            angle: visible.size.angle
        )
        return visible
    }
}

#Preview {
    NavigationView {
        SelectView()
    }
}

