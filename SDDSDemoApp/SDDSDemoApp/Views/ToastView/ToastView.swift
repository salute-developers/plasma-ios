import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct ToastView: View {
    @ObservedObject private var viewModel: ToastViewModel = ToastViewModel()
    @State private var isToastPresented = false
    
    var body: some View {
        List {
            Section {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                            isToastPresented = true
                        }
                        .toast(
                            isPresented: $isToastPresented,
                            text: viewModel.text,
                            appearance: viewModel.appearance,
                            position: viewModel.position,
                            duration: viewModel.duration,
                            contentStart: { contentStart },
                            contentEnd: { contentEnd }
                        )
                        Spacer()
                    }
                    Spacer()
                }
            }
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
        .navigationTitle("SDDSToast")
    }
    
    @ViewBuilder
    var contentStart: some View {
        if viewModel.contentStartEnabled {
            Image(systemName: "info.circle")
        }
    }
    
    @ViewBuilder
    var contentEnd: some View {
        if viewModel.contentEndEnabled {
            Image(systemName: "xmark")
        }
    }
}

#Preview {
    NavigationView {
        ToastView()
    }
} 
