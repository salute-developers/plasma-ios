import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

struct CodeInputView: View {
    @ObservedObject private var viewModel: CodeInputViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init() {
        self.viewModel = CodeInputViewModel()
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                SDDSCodeInput(
                    code: $viewModel.code,
                    groups: viewModel.selectedGroups,
                    validation: viewModel.validation,
                    validationResult: $viewModel.validationResult,
                    caption: viewModel.captionText.isEmpty ? "" : viewModel.captionText,
                    captionAlignment: viewModel.captionAlignment,
                    isHidden: viewModel.isHidden,
                    appearance: viewModel.appearance
                )
                .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
                .popover(
                    isPresented: $viewModel.successToastDisplayed,
                    appearance: Popover.m.default.appearance,
                    placement: .bottom,
                    alignment: .center,
                    tailEnabled: false,
                    triggerCentered: true,
                    placementMode: .strict,
                    content: { popoverContent }
                )
                Spacer()
            }
            .backgroundColorForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
            
            List {
                Section {
                    VariationsView(viewModel: viewModel)
                    groupType
                    code
                    caption
                    captionAlignment
                    hidden
                }
            }
            .background(.tertiary)
        }
        .background(colorScheme == .light ? .white : .black)
    }
    
    @ViewBuilder
    private var groupType: some View {
        Picker("Group Type", selection: $viewModel.selectedGroupType) {
            ForEach(viewModel.availableGroupTypes, id: \.self) { groupType in
                Text(groupType.displayName).tag(groupType)
            }
        }
    }
    
    @ViewBuilder
    private var code: some View {
        HStack {
            Text("Code")
            Spacer()
            TextField("Code", text: $viewModel.code)
                .multilineTextAlignment(.trailing)
        }
    }
    
    @ViewBuilder
    private var caption: some View {
        HStack {
            Text("Caption")
            Spacer()
            TextField("Caption", text: $viewModel.caption)
                .multilineTextAlignment(.trailing)
        }
    }
    
    @ViewBuilder
    private var captionAlignment: some View {
        HStack {
            Text("Caption Alignment")
            Menu {
                ForEach(CodeFieldAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue) {
                        viewModel.captionAlignment = alignment
                    }
                }
            } label: {
                HStack {
                    Spacer()
                    Text(viewModel.captionAlignment.rawValue)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 8)
                }
            }
        }
    }
    
    @ViewBuilder
    private var popoverContent: some View {
        VStack(spacing: 8) {
            HStack {
                Spacer()
                Text("Validated! 🎉")
                    .font(.headline)
                Spacer()
            }
            HStack {
                Spacer()
                BasicButton(title: "Close", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    viewModel.successToastDisplayed = false
                }
                Spacer()
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private var hidden: some View {
        VStack(alignment: .leading) {
            Toggle("Is Hidden", isOn: $viewModel.isHidden)
        }
    }
}

#Preview {
    CodeInputView()
}
