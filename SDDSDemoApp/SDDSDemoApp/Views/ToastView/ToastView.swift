import SwiftUI
import Combine
import SDDSComponents
import SDDSIcons
import SDDSThemeCore
import SandboxSwiftUI

struct ToastView: View {
    @ObservedObject private var viewModel: ToastViewModel
    @Environment(\.colorScheme) private var colorScheme
    @State private var isToastPresented = false

    init(viewModel: ToastViewModel = ToastViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        BasicButton(title: "Show", subtitle: "") {
                            present()
                        }
                        .toast(
                            isPresented: $isToastPresented,
                            text: viewModel.text,
                            appearance: viewModel.appearance,
                            position: viewModel.position,
                            duration: viewModel.duration,
                            subtheme: viewModel.theme.subtheme(viewModel.subtheme),
                            contentStart: { contentStart },
                            contentEnd: { contentEnd }
                        )
                        Spacer()
                    }
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Text")
                    Spacer()
                    TextField("Text", text: $viewModel.text)
                        .multilineTextAlignment(.trailing)
                }
                Picker("Position", selection: $viewModel.position) {
                    ForEach(ToastPosition.allCases, id: \.self) { position in
                        Text(position.rawValue).tag(position)
                    }
                }
                Toggle("Content Start", isOn: $viewModel.contentStartEnabled)
                Toggle("Content End", isOn: $viewModel.contentEndEnabled)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Toast")
    }
    
    @ViewBuilder
    var contentStart: some View {
        if viewModel.contentStartEnabled {
            Asset.infoCircleFill24.image
                .renderingMode(.template)
        }
    }
    
    @ViewBuilder
    var contentEnd: some View {
        if viewModel.contentEndEnabled {
            Asset.close24.image
                .renderingMode(.template)
        }
    }
    
    private func present() {
        guard !viewModel.text.isEmpty || viewModel.contentStartEnabled else {
            return
        }
        isToastPresented = true
    }
}

#Preview {
    NavigationView {
        ToastView()
    }
} 
