import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

struct TextFieldView: View {
    @ObservedObject private var viewModel: TextFieldViewModel

    init(viewModel: TextFieldViewModel = TextFieldViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                SDDSTextField(
                    value: $viewModel.value,
                    title: viewModel.title,
                    optionalTitle: viewModel.optionalTitle,
                    placeholder: viewModel.placeholder,
                    caption: viewModel.caption,
                    textBefore: viewModel.textBefore,
                    textAfter: viewModel.textAfter,
                    disabled: viewModel.disabled,
                    readOnly: viewModel.readOnly,
                    style: viewModel.style,
                    labelPlacement: viewModel.labelPlacement,
                    required: viewModel.required,
                    requiredPlacement: viewModel.requiredPlacement,
                    appearance: viewModel.appearance,
                    size: viewModel.size,
                    layout: viewModel.layout
                )
            }

            Section {
                TextField("Title", text: $viewModel.title)
                TextField("Optional Title", text: $viewModel.optionalTitle)
                TextField("Placeholder", text: $viewModel.placeholder)
                TextField("Caption", text: $viewModel.caption)
                TextField("Text Before", text: $viewModel.textBefore)
                TextField("Text After", text: $viewModel.textAfter)

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

                Picker("Style", selection: $viewModel.style) {
                    ForEach(SDDSComponents.TextFieldStyle.allCases, id: \.self) { style in
                        Text(style.rawValue.capitalized).tag(style)
                    }
                }

                Picker("Label Placement", selection: $viewModel.labelPlacement) {
                    ForEach(TextFieldLabelPlacement.allCases, id: \.self) { placement in
                        Text(placement.rawValue.capitalized).tag(placement)
                    }
                }

                Picker("Required Placement", selection: $viewModel.requiredPlacement) {
                    ForEach(TextFieldRequiredPlacement.allCases, id: \.self) { placement in
                        Text(placement.rawValue.capitalized).tag(placement)
                    }
                }

                Picker("Layout", selection: $viewModel.layout) {
                    ForEach(TextFieldLayout.allCases, id: \.self) { layout in
                        Text(layout.rawValue.capitalized).tag(layout)
                    }
                }

                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSTextFieldSize.allCases, id: \.self) { size in
                        Text(size.rawValue).tag(size.rawValue)
                    }
                }

                Picker("Appearance", selection: $viewModel.appearance) {
                    ForEach(TextFieldAppearance.allCases, id: \.self) { appearance in
                        Text(appearance.name).tag(appearance)
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
        .navigationTitle("SDDSTextField")
    }
}

#Preview {
    NavigationView {
        TextFieldView()
    }
}
