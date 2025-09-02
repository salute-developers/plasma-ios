import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSservTheme

struct RectSkeletonView: View {
    @ObservedObject private var viewModel: RectSkeletonViewModel = RectSkeletonViewModel()

    var body: some View {
        List {
            Section {
                SDDSRectSkeleton(appearance: viewModel.appearance)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .frame(height: 64)
                    .padding(.vertical)
            }
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .listStyle(.plain)
        .navigationTitle("RectSkeleton")
    }
}

#Preview {
    NavigationView {
        RectSkeletonView()
    }
} 
