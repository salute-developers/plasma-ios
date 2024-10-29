import SwiftUI
import Combine
import SDDSComponents
import SDDSComponents
import SDDSservTheme

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
                    style: viewModel.style,
                    labelPlacement: viewModel.labelPlacement,
                    required: viewModel.required,
                    requiredPlacement: viewModel.requiredPlacement,
                    appearance: viewModel.appearance,
                    size: viewModel.size, 
                    chipGroupSize: viewModel.size.chipGroupSize,
                    layout: viewModel.layout,
                    iconActionViewProvider: ViewProvider(iconActionView)
                )
            }

            Section {
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

                Picker("Style", selection: $viewModel.style) {
                    ForEach(SDDSComponents.TextAreaStyle.allCases, id: \.self) { style in
                        Text(style.rawValue.capitalized).tag(style)
                    }
                }

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

                Picker("Size", selection: $viewModel.size) {
                    ForEach(SDDSTextAreaSize.allCases, id: \.self) { size in
                        Text(size.rawValue).tag(size.rawValue)
                    }
                }
                .onChange(of: viewModel.size) { newValue in
                    viewModel.updateChipSize(with: newValue)
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
    
    @ViewBuilder
    private var iconActionView: some View {
        Image.image("textFieldIconAction")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    NavigationView {
        TextAreaView()
    }
}
