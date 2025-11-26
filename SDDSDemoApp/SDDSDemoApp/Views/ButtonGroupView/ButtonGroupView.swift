import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

enum SDDSButtonGroupType: String, CaseIterable {
    case basic = "Basic Button Group"
    case icon = "Icon Button Group"
}

struct ButtonGroupView: View {
    @ObservedObject var viewModel = ButtonGroupViewModel()
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        List {
            buttonGroupPreviewSection
            variationsSection
            configurationSection
            basicButtonOptionsSection
            addButtonSection
            buttonsListSection
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("ButtonGroup")
    }
    
    // MARK: - Preview Section
    
    @ViewBuilder
    private var buttonGroupPreviewSection: some View {
        Section {
            HStack {
                Spacer()
                SDDSButtonGroup(
                    data: viewModel.buttons,
                    appearance: viewModel.currentAppearance,
                    layout: viewModel.layout
                )
                Spacer()
            }
        }
        .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
    }
    
    // MARK: - Variations Section
    
    @ViewBuilder
    private var variationsSection: some View {
        Section(header: Text("ButtonGroup")) {
            VariationsView(viewModel: viewModel)
        }
    }
    
    // MARK: - Configuration Section
    
    @ViewBuilder
    private var configurationSection: some View {
        Section {
            buttonGroupTypePicker
            layoutPicker
        }
    }
    
    @ViewBuilder
    private var buttonGroupTypePicker: some View {
        HStack {
            Text("Button Group Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(SDDSButtonGroupType.allCases, id: \.self) { buttonGroupType in
                    Button(buttonGroupType.rawValue) {
                        viewModel.buttonGroupType = buttonGroupType
                    }
                }
            } label: {
                Text(viewModel.buttonGroupType.rawValue)
            }
        }
    }
    
    @ViewBuilder
    private var layoutPicker: some View {
        HStack {
            Text("Layout")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(ButtonGroupLayout.allCases, id: \.self) { layout in
                    Button(layout.rawValue.capitalized) {
                        viewModel.layout = layout
                    }
                }
            } label: {
                Text(viewModel.layout.rawValue.capitalized)
            }
        }
    }
    
    // MARK: - Basic Button Options Section
    
    @ViewBuilder
    private var basicButtonOptionsSection: some View {
        if viewModel.buttonGroupType == .basic {
            Section {
                Toggle("Icon", isOn: $viewModel.iconEnabled)
                Toggle("Subtitle", isOn: $viewModel.subtitleEnabled)
            }
        }
    }
    
    // MARK: - Add Button Section
    
    @ViewBuilder
    private var addButtonSection: some View {
        Section {
            HStack {
                TextField("Button Title", text: $viewModel.value)
                Spacer()
                Button("Add Button") {
                    viewModel.addButton()
                }
            }
            
            if viewModel.subtitleEnabled && viewModel.buttonGroupType == .basic {
                HStack {
                    TextField("Button Subtitle", text: $viewModel.subtitleValue)
                }
            }
        }
    }
    
    // MARK: - Buttons List Section
    
    @ViewBuilder
    private var buttonsListSection: some View {
        Section {
            ForEach(viewModel.buttons.indices, id: \.self) { index in
                buttonItemView(for: index)
            }
        }
    }
    
    @ViewBuilder
    private func buttonItemView(for index: Int) -> some View {
        VStack {
            HStack {
                TextField(
                    "\(viewModel.buttons[index].title)",
                    text: Binding(
                        get: {
                            guard !viewModel.buttons.isEmpty else {
                                return ""
                            }
                            return viewModel.buttons[index].title
                        },
                        set: { newTitle in
                            viewModel.updateButtonTitle(at: index, with: newTitle)
                        }
                    )
                )
                Spacer()
                Button("Remove") {
                    viewModel.removeButton(at: index)
                }
                .foregroundColor(.red)
            }
            
            if viewModel.subtitleEnabled && viewModel.buttonGroupType == .basic {
                HStack {
                    TextField(
                        "\(viewModel.buttons[index].subtitle)",
                        text: Binding(
                            get: {
                                guard !viewModel.buttons.isEmpty else {
                                    return ""
                                }
                                return viewModel.buttons[index].subtitle
                            },
                            set: { newSubtitle in
                                viewModel.updateButtonSubtitle(at: index, with: newSubtitle)
                            }
                        )
                    )
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ButtonGroupView()
    }
}
