import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

struct DrawerView: View {
    @ObservedObject private var viewModel: DrawerViewModel = DrawerViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @State private var isDrawerPresented = false
    
    var body: some View {
        List {
            Section {
                VStack(spacing: 16) {
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
                    
                    HStack {
                        Spacer()
                        BasicButton(
                            title: "Назад",
                            subtitle: "",
                            appearance: BasicButton.m.dark.appearance
                        ) {
                            presentationMode.wrappedValue.dismiss()
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .frame(height: 300)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .listRowInsets(.init())
            
            Section {
                variationTypeSelectionView
                VariationsView(viewModel: viewModel)
                closePlacementSelectionView
                alignmentSelectionView
                headerToggle
                footerToggle
                overlayToggle
                moveContentToggle
                if !viewModel.moveContentEnabled {
                    peekOffsetToggle
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .drawer(
            isPresented: $isDrawerPresented,
            appearance: viewModel.appearance,
            alignment: viewModel.alignment,
            overlayAppearance: viewModel.showOverlay ? Overlay.default.appearance : nil,
            drawerWidth: 160,
            drawerHeight: (viewModel.alignment == .top || viewModel.alignment == .bottom) ? 520 : nil,
            moveContentEnabled: viewModel.moveContentEnabled,
            peekOffset: viewModel.peekOffsetEnabled ? 65 : nil,
            closePlacement: viewModel.closePlacement,
            hasHeader: viewModel.showHeader,
            hasFooter: viewModel.showFooter,
            subtheme: viewModel.theme.subtheme(viewModel.subtheme),
            onClose: {
                isDrawerPresented = false
            },
            header: {
                header
            },
            content: {
                if viewModel.alignment == .bottom || viewModel.alignment == .top {
                    list
                        .frame(maxWidth: .infinity)
                        .frame(height: 470)
                } else {
                    list
                        .frame(width: 130)
                        .frame(maxHeight: .infinity)
                }
            },
            footer: {
                footer
            }
        )
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private var header: some View {
        if viewModel.showHeader {
            Text("Header")
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var footer: some View {
        if viewModel.showFooter {
            Text("Footer")
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var list: some View {
        SDDSList(
            items: (1...9).map { index in
                SDDSListItem(
                    title: "Item \(index)",
                    rightContent: { EmptyView() },
                    appearance: ListItemNormal.m.appearance
                )
            },
            appearance: ListNormal.m.appearance
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
    
    private var closePlacementSelectionView: some View {
        HStack {
            Text("Close Placement")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                Button("Left") {
                    viewModel.closePlacement = .left
                }
                Button("Right") {
                    viewModel.closePlacement = .right
                }
            } label: {
                Text(viewModel.closePlacement == .left ? "Left" : "Right")
            }
        }
    }
    
    private var moveContentToggle: some View {
        Toggle("Move Content", isOn: $viewModel.moveContentEnabled)
    }
    
    private var peekOffsetToggle: some View {
        Toggle("Peek Offset", isOn: $viewModel.peekOffsetEnabled)
    }
    
    private var variationTypeSelectionView: some View {
        HStack {
            Text("Variation Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(DrawerVariationType.allCases, id: \.self) { type in
                    Button(type.rawValue.capitalized) {
                        viewModel.variationType = type
                    }
                }
            } label: {
                Text(viewModel.variationType.rawValue.capitalized)
            }
        }
    }
}

#Preview {
    NavigationView {
        DrawerView()
    }
}

