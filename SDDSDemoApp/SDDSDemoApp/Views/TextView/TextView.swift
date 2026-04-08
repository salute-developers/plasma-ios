import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SandboxSwiftUI

struct TextView: View {
    @ObservedObject private var viewModel: TextViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: TextViewModel = TextViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                textPreview
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 8)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)

            Section {
                SandboxThemeSubthemeSection(theme: $viewModel.theme, subtheme: $viewModel.subtheme)

                TextField("Line limit", value: $viewModel.lineLimit, format: .number)
                    .keyboardType(.numberPad)

                Toggle("Soft wrap", isOn: $viewModel.softWrap)

                Picker("Overflow", selection: $viewModel.overflow) {
                    ForEach(TextDemoOverflow.allCases) { mode in
                        Text(mode.rawValue.capitalized).tag(mode)
                    }
                }

                Picker("Color mode", selection: $viewModel.colorMode) {
                    ForEach(TextDemoColorMode.allCases) { mode in
                        Text(mode.rawValue == "fillColor" ? "Fill color" : "Fill gradient").tag(mode)
                    }
                }

                Picker("Multiline alignment", selection: $viewModel.multilineTextAlignment) {
                    Text("Leading").tag(TextAlignment.leading)
                    Text("Center").tag(TextAlignment.center)
                    Text("Trailing").tag(TextAlignment.trailing)
                }

                VStack(alignment: .leading) {
                    Text("Minimum scale: \(viewModel.minimumScaleFactor, specifier: "%.2f")")
                    Slider(value: $viewModel.minimumScaleFactor, in: 0.5...1, step: 0.05)
                }

                TextEditor(text: $viewModel.bodyText)
                    .frame(minHeight: 120)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Text")
    }

    @ViewBuilder
    private var textPreview: some View {
        let content = SDDSText(
            viewModel.bodyText,
            fillStyle: viewModel.fillStyle,
            lineLimit: viewModel.previewLineLimit,
            minimumScaleFactor: viewModel.minimumScaleFactor,
            multilineTextAlignment: viewModel.multilineTextAlignment,
            truncationMode: viewModel.resolvedTruncation
        )
        .frame(maxWidth: 280, alignment: alignment(for: viewModel.multilineTextAlignment))

        switch viewModel.overflow {
        case .ellipsis:
            content
        case .clip:
            content
                .frame(
                    maxHeight: viewModel.clipPreviewMaxHeight,
                    alignment: .top
                )
                .clipped()
                .overlay(alignment: .bottomTrailing) {
                    Rectangle()
                        .fill(backgroundColorForSubthemeColor(viewModel.subtheme, colorScheme: colorScheme))
                        .frame(width: 18, height: viewModel.clipEllipsisMaskHeight)
                }
        }
    }

    private func alignment(for textAlignment: TextAlignment) -> Alignment {
        switch textAlignment {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        default: return .leading
        }
    }
}

#Preview {
    NavigationStack {
        TextView()
    }
}
