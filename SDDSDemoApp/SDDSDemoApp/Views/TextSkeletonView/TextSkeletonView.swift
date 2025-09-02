import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSservTheme

struct TextSkeletonView: View {
    @ObservedObject private var viewModel: TextSkeletonViewModel = TextSkeletonViewModel()

    var body: some View {
        List {
            Section {
                SDDSTextSkeleton(
                    appearance: viewModel.appearance,
                    lineCount: viewModel.lineCount,
                    textTypography: viewModel.typography,
                    lineWidthProvider: viewModel.lineWidthProviderType.provider,
                    lineSpacing: viewModel.lineSpacing
                )
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .background(
                    GeometryReader { geo in
                        TextLineCounter(text: viewModel.text, font: viewModel.typography.uiFont, width: geo.size.width) { count in
                            viewModel.lineCountText = String(max(count, 1))
                        }
                        .hiddenIf(viewModel.textHidden)
                    }
                )
            }
            Section {
                HStack {
                    Text("Line Count")
                    TextField("line count", text: $viewModel.lineCountText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                        .disabled(true)
                }
                HStack {
                    Text("Text")
                    TextField("text", text: $viewModel.text)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Toggle(isOn: $viewModel.textHidden) {
                        Text("Text Hidden")
                    }
                }
                providerSelectionView
                VariationsView(viewModel: viewModel)
            }
        }
        .listStyle(.plain)
        .navigationTitle("TextSkeleton")
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
