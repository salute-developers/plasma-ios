import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct TextSkeletonView: View {
    @StateObject private var viewModel: TextSkeletonViewModel = TextSkeletonViewModel()
    @Environment(\.colorScheme) private var colorScheme

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
                .id(skeletonThemeID)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .background(
                    GeometryReader { geo in
                        TextLineCounter(
                            text: viewModel.text,
                            font: viewModel.typography.uiFont,
                            width: geo.size.width,
                            lineHeight: viewModel.typographyLineHeight,
                            lineSpacing: viewModel.lineSpacing
                        ) { count in
                            viewModel.lineCountText = String(max(count, 1))
                        }
                        .hiddenIf(viewModel.textHidden)
                    }
                )
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
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
                kindSelectionView
                providerSelectionView
                VariationsView(viewModel: viewModel)
            }
        }
        .listStyle(.plain)
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle(viewModel.title)
    }
    
    @ViewBuilder
    private var kindSelectionView: some View {
        HStack {
            Text("Kind")
            Spacer()
            Menu {
                ForEach(TextSkeletonKind.allCases, id: \.self) { kind in
                    Button(kind.title) {
                        viewModel.selectedKind = kind
                    }
                }
            } label: {
                Text(viewModel.selectedKind.title)
            }
        }
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
    
    private var skeletonThemeID: String {
        "\(viewModel.theme.rawValue)-\(String(describing: viewModel.subtheme))"
    }
}

#Preview {
    NavigationView {
        TextSkeletonView()
    }
} 
