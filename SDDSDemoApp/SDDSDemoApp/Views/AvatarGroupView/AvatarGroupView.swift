//import SwiftUI
//
//import Combine
//import SDDSComponents
//
//struct AvatarGroupView: View {
//    @ObservedObject private var viewModel: AvatarGroupViewModel
//
//    init(viewModel: AvatarGroupViewModel = AvatarGroupViewModel()) {
//        self.viewModel = viewModel
//    }
//
//    var body: some View {
//        List {
//            Section {
//                HStack {
//                    Spacer()
//                    AvatarGroup(
//                        data: viewModel.avatarData,
//                        lastAvatar: viewModel.lastAvatar,
//                        size: viewModel.sizeConfiguration
//                    )
//                    Spacer()
//                }
//            }
//
//            Section(header: Text("Configuration")) {
//                HStack {
//                    Text("Max Displaying Count")
//                    Spacer()
//                    Stepper(value: $viewModel.maxDisplayingAvatarCount, in: 1...10) {
//                        Text("\(viewModel.maxDisplayingAvatarCount)")
//                    }
//                }
//            }
//        }
//        .navigationTitle("SDDSAvatarGroup")
//    }
//}
//
//#Preview {
//    NavigationView {
//        AvatarGroupView()
//    }
//}
