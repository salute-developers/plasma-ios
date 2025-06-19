import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct RectSkeletonView: View {
    @ObservedObject private var viewModel: RectSkeletonViewModel = RectSkeletonViewModel()

    var body: some View {
        List {
            Section {
                SDDSRectSkeleton(appearance: viewModel.appearance)
            }
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("SDDSRectSkeleton")
    }
}

#Preview {
    NavigationView {
        RectSkeletonView()
    }
} 
