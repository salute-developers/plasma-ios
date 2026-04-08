import SwiftUI
import SDDSComponents
import SDDSIcons
import SDDSThemeCore
import SandboxSwiftUI

struct IconView: View {
    @ObservedObject private var viewModel: IconViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: IconViewModel = IconViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    iconPreview
                    Spacer()
                }
                .frame(minHeight: 100)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)

            Section {
                SandboxThemeSubthemeSection(theme: $viewModel.theme, subtheme: $viewModel.subtheme)

                Picker("Mode", selection: $viewModel.mode) {
                    Text("Tint").tag(IconDemoMode.tint)
                    Text("Fill color").tag(IconDemoMode.fillColor)
                    Text("Fill gradient").tag(IconDemoMode.fillGradient)
                }

                VStack(alignment: .leading) {
                    Text("Size: \(Int(viewModel.sideLength)) pt")
                    Slider(value: $viewModel.sideLength, in: 16...72, step: 4)
                }

                Toggle("Use environment defaults", isOn: $viewModel.useEnvironmentDefaults)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Icon")
    }

    @ViewBuilder
    private var iconPreview: some View {
        if viewModel.useEnvironmentDefaults {
            SDDSIcon(Asset.plasma24.image)
                .environment(\.sddsIconEnvironment, viewModel.iconEnvironmentForMode(theme: viewModel.theme))
        } else {
            SDDSIcon(
                Asset.plasma24.image,
                fillStyle: viewModel.fillStyleForMode(theme: viewModel.theme),
                sideLength: viewModel.sideLength
            )
        }
    }
}

#Preview {
    NavigationStack {
        IconView()
    }
}
