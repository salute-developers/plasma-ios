import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct TextSkeletonView: View {
    @ObservedObject private var viewModel: TextSkeletonViewModel = TextSkeletonViewModel()

    var body: some View {
        List {
            Section {
                SDDSTextSkeleton(
                    appearance: viewModel.appearance,
                    lineCount: viewModel.lineCount
                )
            }
            Section {
                HStack {
                    Text("Line Count")
                    TextField("line count", text: $viewModel.lineCountText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                }
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("SDDSTextSkeleton")
    }
}

#Preview {
    NavigationView {
        TextSkeletonView()
    }
} 
