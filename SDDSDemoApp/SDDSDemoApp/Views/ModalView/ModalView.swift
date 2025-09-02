import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSservTheme

struct ModalView: View {
    @StateObject private var viewModel = ModalViewModel()
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
            
            Section {
                VariationsView(viewModel: viewModel)
                Toggle("hasClose", isOn: $viewModel.hasClose)
                Toggle("useNativeBlackout", isOn: $viewModel.useNativeBlackout)
            }
        }
        .navigationTitle("Modal")
        .modal(
            isPresented: $isPresented,
            appearance: viewModel.appearance,
            closeImage: viewModel.hasClose ? Image(systemName: "xmark") : nil,
            useNativeBlackout: viewModel.useNativeBlackout,
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



