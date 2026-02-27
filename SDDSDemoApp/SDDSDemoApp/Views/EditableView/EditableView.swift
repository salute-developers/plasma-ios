import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

struct EditableView: View {
    @ObservedObject private var viewModel: EditableViewModel = EditableViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                editable
                    .id(editableRenderIdentity)
                Spacer()
            }
            .background(Color.clear)
            
            List {
                Section {
                    VariationsView(viewModel: viewModel)
                    
                    TextField("Text", text: $viewModel.text)
                    Toggle("Enabled", isOn: $viewModel.enabled)
                    Toggle("Read only", isOn: $viewModel.readOnly)
                    Toggle("Single line", isOn: $viewModel.singleLine)
                    Toggle("Icon", isOn: $viewModel.hasIcon)
                    
                    Picker("Text align", selection: $viewModel.textAlign) {
                        Text("Start").tag(TextAlignment.leading)
                        Text("Center").tag(TextAlignment.center)
                        Text("End").tag(TextAlignment.trailing)
                    }
                    
                    Picker("Icon placement", selection: $viewModel.iconPlacement) {
                        ForEach(EditableIconPlacement.allCases, id: \.self) { placement in
                            Text(placement.rawValue.capitalized).tag(placement)
                        }
                    }
                }
            }
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        }
    }
    
    @ViewBuilder
    private var editable: some View {
        if viewModel.hasIcon {
            SDDSEditable(
                text: $viewModel.text,
                enabled: viewModel.enabled,
                readOnly: viewModel.readOnly,
                singleLine: viewModel.singleLine,
                textAlign: viewModel.textAlign,
                iconPlacement: viewModel.iconPlacement,
                appearance: viewModel.appearance,
                iconContent: Action {
                    Asset.editFill24.image
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            )
        } else {
            SDDSEditable(
                text: $viewModel.text,
                enabled: viewModel.enabled,
                readOnly: viewModel.readOnly,
                singleLine: viewModel.singleLine,
                textAlign: viewModel.textAlign,
                iconPlacement: viewModel.iconPlacement,
                appearance: viewModel.appearance
            )
        }
    }

    private var editableRenderIdentity: String {
        [
            viewModel.theme.name,
            "\(viewModel.subtheme)",
            viewModel.variation?.name ?? "no-variation",
            viewModel.style?.name ?? "no-style",
            "enabled:\(viewModel.enabled)",
            "readonly:\(viewModel.readOnly)",
            "singleline:\(viewModel.singleLine)",
            "hasicon:\(viewModel.hasIcon)",
            "textalign:\(viewModel.textAlign)",
            "iconplacement:\(viewModel.iconPlacement)"
        ].joined(separator: "|")
    }
}

#Preview {
    NavigationView {
        EditableView()
    }
}
