import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct ModalView: View {
    @StateObject private var viewModel = ModalViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var isPresented = false
    
    var body: some View {
        List {
            Section {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                            isPresented = true
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
            Section {
                VariationsView(viewModel: viewModel)
                Toggle("hasClose", isOn: $viewModel.hasClose)
                Toggle("useNativeBlackout", isOn: $viewModel.useNativeBlackout)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Modal")
        .modal(
            isPresented: $isPresented,
            appearance: viewModel.appearance,
            closeImage: viewModel.hasClose ? Image(systemName: "xmark") : nil,
            useNativeBlackout: viewModel.useNativeBlackout,
            subtheme: viewModel.theme.subtheme(viewModel.subtheme),
            onShow: nil,
            onClose: nil
        ) {
            HStack {
                Text("Modal")
                Spacer()
            }
            .frame(width: 120)
        }
    }
}



