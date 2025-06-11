import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct NotificationView: View {
    @StateObject private var viewModel = NotificationViewModel()
    @State private var isPresented = false
    
    var body: some View {
        List {
            Section {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                            present()
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            Section {
                Picker("Layout", selection: $viewModel.layout) {
                    ForEach(NotificationLayout.allCases, id: \.self) { layout in
                        Text(layout.rawValue.capitalized).tag(layout)
                    }
                }
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
                Toggle("hasClose", isOn: $viewModel.hasClose)
            }
        
        }
        .navigationTitle("SDDSNotification")
        .notification(
            isPresented: $isPresented,
            appearance: viewModel.appearance,
            position: viewModel.position,
            hasClose: viewModel.hasClose,
            content: {
                Text(viewModel.text)
                    .padding([.leading, .trailing], 8)
            }
        )
    }
    
    private func present() {
        guard !viewModel.text.isEmpty || viewModel.hasClose else {
            return
        }
        isPresented = true
    }
}
