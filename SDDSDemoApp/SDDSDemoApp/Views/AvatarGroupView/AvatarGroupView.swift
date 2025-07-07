import SwiftUI
import Combine
import SDDSComponents

struct AvatarGroupView: View {
    @ObservedObject private var viewModel: AvatarGroupViewModel

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
        .navigationTitle("AvatarGroup")
    }
}

#Preview {
    NavigationView {
        AvatarGroupView()
    }
}
