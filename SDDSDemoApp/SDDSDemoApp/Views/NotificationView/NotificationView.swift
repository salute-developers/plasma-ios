import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct NotificationView: View {
    @StateObject private var viewModel = NotificationViewModel()
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
                            present()
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
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
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Notification")
        .notification(
            isPresented: $isPresented,
            appearance: viewModel.appearance,
            position: viewModel.position,
            closeImage: viewModel.hasClose ? Asset.close24.image : nil,
            subtheme: viewModel.theme.subtheme(viewModel.subtheme),
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
