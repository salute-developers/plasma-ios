import SwiftUI
import SDDSComponents
import SDDSIcons
import SDDSThemeCore
import SandboxSwiftUI

struct ImageView: View {
    @ObservedObject private var viewModel: ImageViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: ImageViewModel = ImageViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSImage(
                        image: Asset.cameraPhotoFill24.image.renderingMode(.template),
                        appearance: viewModel.appearance
                    )
                    .frame(minWidth: 16, maxWidth: 30, minHeight: 16, maxHeight: 35)
                    Spacer()
                }
                .frame(minHeight: 120)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)

            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Image")
    }
}

#Preview {
    ImageView()
}
