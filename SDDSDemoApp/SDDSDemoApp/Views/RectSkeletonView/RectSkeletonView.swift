import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct RectSkeletonView: View {
    @ObservedObject private var viewModel: RectSkeletonViewModel = RectSkeletonViewModel()
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        List {
            Section {
                SDDSRectSkeleton(appearance: viewModel.appearance)
                    .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .frame(height: 64)
                    .padding(.vertical)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .listStyle(.plain)
        .navigationTitle("RectSkeleton")
    }
}

#Preview {
    NavigationView {
        RectSkeletonView()
    }
} 
