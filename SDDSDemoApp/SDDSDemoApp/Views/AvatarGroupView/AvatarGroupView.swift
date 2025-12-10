import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

struct AvatarGroupView: View {
    @ObservedObject private var viewModel: AvatarGroupViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: AvatarGroupViewModel = AvatarGroupViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSAvatarGroup(
                        data: viewModel.avatarData,
                        lastAvatar: viewModel.lastAvatar,
                        maxDisplayingAvatarCount: viewModel.maxDisplayingAvatarCount,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            Section(header: Text("Avatar appaerence")) {
                VariationsView(viewModel: viewModel.avatarViewModel)
            }
            Section(header: Text("Configuration")) {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Max Displaying Count")
                    Spacer()
                    Stepper(value: $viewModel.maxDisplayingAvatarCount, in: 1...10) {
                        Text("\(viewModel.maxDisplayingAvatarCount)")
                    }
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("AvatarGroup")
    }
}

#Preview {
    NavigationView {
        AvatarGroupView()
    }
}
