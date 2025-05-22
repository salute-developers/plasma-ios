import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

struct TextFieldView: View {
    @ObservedObject private var viewModel: TextFieldViewModel = TextFieldViewModel()

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
                    appearance: viewModel.appearance,
                    layout: viewModel.layout,
                    iconContent: Action {
                        if viewModel.iconViewEnabled {
                            Image.image("textFieldIcon")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else {
                            EmptyView()
                        }
                    },
                    actionContent: Action {
                        if viewModel.iconActionViewEnabled {
                            Image.image("textFieldIconAction")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else {
                            EmptyView()
                        }
                    }
                )
            }

            Section {
                Picker("Layout", selection: $viewModel.layout) {
                    ForEach(TextFieldLayout.allCases, id: \.self) { layout in
                        Text(layout.rawValue.capitalized).tag(layout)
                    }
                }
                VariationsView(viewModel: viewModel)
                
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
                Toggle("Icon", isOn: $viewModel.iconViewEnabled)
                Toggle("Action", isOn: $viewModel.iconActionViewEnabled)
                
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
