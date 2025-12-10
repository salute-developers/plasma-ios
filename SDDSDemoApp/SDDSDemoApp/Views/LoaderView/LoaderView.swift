import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

struct LoaderView: View {
    @ObservedObject private var viewModel: LoaderViewModel = LoaderViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    switch viewModel.loaderType {
                    case .spinner:
                        SDDSLoader(appearance: viewModel.appearance)
                            .environment(\.spinnerData, spinnerData)
                    case .circularProgress:
                        SDDSLoader(appearance: viewModel.appearance)
                            .environment(\.circularProgressBarData, circularProgressBarData)
                    }
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
                        
            Section {
                HStack {
                    Text("Loader Type")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(LoaderType.allCases, id: \.self) { loaderType in
                            Button(loaderType.rawValue) {
                                viewModel.loaderType = loaderType
                            }
                        }
                    } label: {
                        Text(viewModel.loaderType.rawValue)
                    }
                }
            }
            
            Section("Loader") {
                VariationsView(viewModel: viewModel)
            }
            
            Section(viewModel.loaderType.rawValue) {
                switch viewModel.loaderType {
                case .spinner:
                    SpinnerView(viewModel: viewModel.spinnerViewModel)
                case .circularProgress:
                    CircularProgressBarView(viewModel: viewModel.circularProgressViewModel)
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Loader")
    }
    
    private var spinnerData: SDDSSpinnerData {
        .init(
            isAnimating: viewModel.spinnerViewModel.isAnimating,
            appearance: viewModel.appearance.spinnerAppearance
        )
    }
    
    private var circularProgressBarData: SDDSCircularProgressBarData {
        let circularProgressViewModel = viewModel.circularProgressViewModel
        return .init(
            progress: circularProgressViewModel.progress,
            hasTrack: circularProgressViewModel.hasTrack,
            content: circularProgressBarContent,
            appearance: viewModel.appearance.circularProgressAppearance
        )
    }
    
    private var circularProgressBarContent: AnyView? {
        if viewModel.circularProgressViewModel.customContent {
            AnyView(icon)
        } else {
            nil
        }
    }
    
    private var icon: some View {
        Asset.close24.image
            .renderingMode(.template)
            .tint(.black)
            .frame(width: 24, height: 24)
    }
}
