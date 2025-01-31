import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

struct TextAreaView: View {
    @ObservedObject private var viewModel: TextAreaViewModel

    init(viewModel: TextAreaViewModel = TextAreaViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                SDDSTextArea(
                    value: $viewModel.value,
                    title: viewModel.title,
                    optionalTitle: viewModel.optionalTitle,
                    placeholder: viewModel.placeholder,
                    caption: viewModel.caption,
                    counter: viewModel.counter,
                    disabled: viewModel.disabled,
                    readOnly: viewModel.readOnly,
                    labelPlacement: viewModel.labelPlacement,
                    required: viewModel.required,
                    requiredPlacement: viewModel.requiredPlacement,
                    dynamicHeight: viewModel.dynamicHeight,
                    appearance: viewModel.appearance.size(viewModel.size),
                    layout: viewModel.layout,
                    iconActionViewProvider: iconActionView
                )
            }

            Section {
                Picker("Size", selection: $viewModel.sizeName) {
                    ForEach(viewModel.allSizeNames, id: \.self) { sizeName in
                        Text(sizeName).tag(viewModel.sizeName)
                    }
                }

                Picker("Appearance", selection: $viewModel.appearance) {
                    ForEach(viewModel.allTextFieldAppearance, id: \.self) { variation in
                        Text(variation.name).tag(variation.name)
                    }
                }
                
                TextField("Title", text: $viewModel.title)
                TextField("Optional Title", text: $viewModel.optionalTitle)
                TextField("Placeholder", text: $viewModel.placeholder)
                TextField("Caption", text: $viewModel.caption)
                TextField("Counter", text: $viewModel.counter)

                TextField("Value", text: $viewModel.textValue)
                    .onChange(of: viewModel.textValue) { newValue in
                        viewModel.updateValueText(newValue)
                    }
                    .onChange(of: viewModel.value) { newValue in
                        if newValue.text != viewModel.textValue {
                            viewModel.textValue = newValue.text
                        }
                    }

                Toggle("Disabled", isOn: $viewModel.disabled)
                Toggle("Read Only", isOn: $viewModel.readOnly)
                Toggle("Required", isOn: $viewModel.required)
                Toggle("Action", isOn: $viewModel.iconActionViewEnabled)
                Toggle("Dynamic Height", isOn: $viewModel.dynamicHeight)

                Picker("Label Placement", selection: $viewModel.labelPlacement) {
                    ForEach(TextAreaLabelPlacement.allCases, id: \.self) { placement in
                        Text(placement.rawValue.capitalized).tag(placement)
                    }
                }

                Picker("Required Placement", selection: $viewModel.requiredPlacement) {
                    ForEach(TextAreaRequiredPlacement.allCases, id: \.self) { placement in
                        Text(placement.rawValue.capitalized).tag(placement)
                    }
                }

                Picker("Layout", selection: $viewModel.layout) {
                    ForEach(TextAreaLayout.allCases, id: \.self) { layout in
                        Text(layout.rawValue.capitalized).tag(layout)
                    }
                }

                Button("Add Chip") {
                    viewModel.addChip()
                }

                ForEach(viewModel.chips.indices, id: \.self) { index in
                    HStack {
                        TextField(
                            "Chip \(index + 1)",
                            text: Binding(
                                get: {
                                    guard !viewModel.chips.isEmpty else {
                                        return ""
                                    }
                                    return viewModel.chips[index].title
                                },
                                set: { newTitle in
                                    viewModel.updateChipTitle(at: index, with: newTitle)
                                }
                            )
                        )
                        Spacer()
                        Button("Remove") {
                            viewModel.removeChip(at: index)
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
        .navigationTitle("SDDSTextArea")
    }
    
    private var iconActionView: ViewProvider? {
        if viewModel.iconActionViewEnabled {
            ViewProvider(
                Image.image("textFieldIconAction")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
        } else {
            nil
        }
    }
}

extension TextAreaView: Equatable {
    static func == (lhs: TextAreaView, rhs: TextAreaView) -> Bool {
        return lhs.viewModel == rhs.viewModel
    }
}

#Preview {
    NavigationView {
        TextAreaView()
    }
}
