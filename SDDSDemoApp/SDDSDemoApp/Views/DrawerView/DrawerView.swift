import SwiftUI
import SDDSComponents
import SDDSServTheme

struct DrawerView: View {
    @ObservedObject private var viewModel: DrawerViewModel = DrawerViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var isDrawerPresented = false
    
    var body: some View {
        List {
            Section {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        BasicButton(
                            title: "Показать Drawer",
                            subtitle: "",
                            appearance: BasicButton.m.accent.appearance
                        ) {
                            isDrawerPresented = true
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .frame(height: 300)
            }
            .listRowInsets(.init())
            
            Section {
                VariationsView(viewModel: viewModel)
                headerToggle
                footerToggle
                overlayToggle
                alignmentSelectionView
            }
        }
        .drawer(
            isPresented: $isDrawerPresented,
            appearance: viewModel.appearance,
            alignment: viewModel.alignment,
            overlayAppearance: viewModel.showOverlay ? Overlay.default.appearance : nil,
            onClose: {
                isDrawerPresented = false
            },
            header: {
                if viewModel.showHeader {
                    Text("Header")
                } else {
                    EmptyView()
                }
            },
            content: {
//                SDDSList(
//                    items: (1...9).map { index in
//                        SDDSListItem(
//                            title: "Item \(index)",
//                            rightContent: { EmptyView() },
//                            appearance: ListItemNormal.m.appearance
//                        )
//                    },
//                    appearance: ListNormal.m.appearance
//                )
                if viewModel.alignment == .bottom || viewModel.alignment == .top {
                    Text("Content")
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                } else {
                    Text("Content")
                        .frame(width: 80)
                        .frame(maxHeight: .infinity)
                }

            },
            footer: {
                if viewModel.showFooter {
                    Text("Footer")
                } else {
                    EmptyView()
                }
            }
        )
    }
    
    private var alignmentSelectionView: some View {
        HStack {
            Text("Alignment")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(DrawerAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue.capitalized) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue.capitalized)
            }
        }
    }
    
    private var headerToggle: some View {
        Toggle("Header", isOn: $viewModel.showHeader)
    }
    
    private var footerToggle: some View {
        Toggle("Footer", isOn: $viewModel.showFooter)
    }
    
    private var overlayToggle: some View {
        Toggle("Show Overlay", isOn: $viewModel.showOverlay)
    }
}

#Preview {
    NavigationView {
        DrawerView()
    }
}

