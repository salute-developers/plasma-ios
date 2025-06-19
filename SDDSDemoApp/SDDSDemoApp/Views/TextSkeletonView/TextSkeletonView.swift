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
                    lineCount: viewModel.lineCount,
                    lineWidthProvider: viewModel.lineWidthProviderType.provider
                )
            }
            Section {
                HStack {
                    Text("Line Count")
                    TextField("line count", text: $viewModel.lineCountText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                }
                providerSelectionView
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("SDDSTextSkeleton")
    }
    
    @ViewBuilder
    private var providerSelectionView: some View {
        HStack {
            Text("Line Width")
            Spacer()
            Menu {
                ForEach(TextSkeletonLineProviderType.allCases, id: \.self) { providerType in
                    Button(providerType.rawValue.capitalized) {
                        viewModel.lineWidthProviderType = providerType
                    }
                }
            } label: {
                Text(viewModel.lineWidthProviderType.rawValue.capitalized)
            }
        }
    }
}

#Preview {
    NavigationView {
        TextSkeletonView()
    }
} 
