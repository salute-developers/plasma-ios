import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct MaskView: View {
    @ObservedObject private var viewModel: MaskViewModel = MaskViewModel()

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
                    mask: viewModel.currentMask,
                    maskDisplayMode: viewModel.maskDisplayMode,
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
                Picker("Mask Type", selection: $viewModel.selectedMaskType) {
                    ForEach(MaskType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                
                if viewModel.selectedMaskType != .none {
                    Picker("Display Mode", selection: $viewModel.maskDisplayMode) {
                        ForEach(MaskDisplayMode.allCases, id: \.self) { mode in
                            Text(mode.rawValue.capitalized).tag(mode)
                        }
                    }
                    
                    if viewModel.selectedMaskType == .number {
                        Stepper("Fraction Digits: \(viewModel.numberFractionDigits)", value: $viewModel.numberFractionDigits, in: 0...10)
                        
                        Picker("Decimal Separator", selection: $viewModel.numberDecimalSeparator) {
                            Text(",").tag(",")
                            Text(".").tag(".")
                        }
                    } else {
                        TextField("Custom Format", text: $viewModel.customFormat)
                            .font(.system(.body, design: .monospaced))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                }
                
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
                        // Обновляем textValue только если он реально отличается
                        // чтобы избежать циклов
                        if newValue.text != viewModel.textValue {
                            viewModel.textValue = newValue.text
                        }
                    }

                Toggle("Disabled", isOn: $viewModel.disabled)
                Toggle("Read Only", isOn: $viewModel.readOnly)
                Toggle("Icon", isOn: $viewModel.iconViewEnabled)
                Toggle("Action", isOn: $viewModel.iconActionViewEnabled)
            }
        }
        .navigationTitle("TextField")
    }
}

#Preview {
    NavigationView {
        MaskView()
    }
}

