import SwiftUI
import SDDSComponents

struct CodeFieldView: View {
    @ObservedObject private var viewModel: CodeFieldViewModel
    @State private var textFieldCode: String = ""
    
    init() {
        self.viewModel = CodeFieldViewModel()
    }
    
    var body: some View {
        VStack {
            SDDSCodeField(
                groups: viewModel.selectedGroups,
                caption: viewModel.caption.isEmpty ? "" : viewModel.caption,
                captionAlignment: viewModel.captionAlignment,
                appearance: viewModel.appearance,
                onCodeChanged: { code in
                    viewModel.code = code
                    textFieldCode = code
                }
            )
            
            List {
                Section {
                    Picker("Group Type", selection: $viewModel.selectedGroupType) {
                        ForEach(viewModel.availableGroupTypes, id: \.self) { groupType in
                            Text(groupType.displayName).tag(groupType)
                        }
                    }
                    VariationsView(viewModel: viewModel)
                    VStack {
                        HStack {
                            Text("Code")
                            Spacer()
                            TextField("Code", text: $textFieldCode)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                                .onChange(of: textFieldCode) { newValue in
                                    let filtered = newValue.filter { $0.isNumber }
                                    if filtered != newValue {
                                        textFieldCode = filtered
                                    }
                                    viewModel.code = filtered
                                }
                        }
                        HStack {
                            Text("Caption")
                            Spacer()
                            TextField("Caption", text: $viewModel.caption)
                                .multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Caption Alignment")
                            Spacer()
                            Picker("Alignment", selection: $viewModel.captionAlignment) {
                                Text("Leading").tag(TextAlignment.leading)
                                Text("Center").tag(TextAlignment.center)
                                Text("Trailing").tag(TextAlignment.trailing)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                }
            }
        }
        .background(.tertiary)
    }
}

#Preview {
    CodeFieldView()
} 
