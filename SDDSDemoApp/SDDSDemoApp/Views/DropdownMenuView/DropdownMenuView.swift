import SwiftUI
import SDDSComponents
import SDDSServTheme

struct DropdownMenuView: View {
    @ObservedObject private var viewModel: DropdownMenuViewModel = DropdownMenuViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var isDropdownMenuPresented = false
    @State private var contentHeight: CGFloat = 0
    @State private var forceUpdate: Bool = false
    private let maxHeight: CGFloat = 250
    
    var body: some View {
        List {
            Section {
                buttonForPosition(viewModel.buttonPosition)
                    .padding()
            }
            .frame(height: 300)
            .background(Color(.white))
            .listRowInsets(.init())
            .onTapGesture {
                isDropdownMenuPresented = false
            }
            .onChange(of: contentHeight) { newHeight in
                isDropdownMenuPresented = false
                DispatchQueue.main.async {
                    isDropdownMenuPresented = true
                }
            }
            
            Section {
                layout
                buttonPositionView
                placementSelectionView
                alignmentSelectionView
                VariationsView(viewModel: viewModel)
                itemsCount
                autoHideToggle
            }
        }
        .navigationTitle("DropdownMenu")
    }
    
    @ViewBuilder
    private var layout: some View {
        Picker("Layout", selection: $viewModel.layout) {
            ForEach(DropDownMenuLayout.allCases, id: \.self) { layout in
                Text(layout.rawValue.capitalized).tag(layout)
            }
        }
    }
    
    private var duration: TimeInterval? {
        viewModel.autoHide ? 3.0 : nil
    }
    
    @ViewBuilder
    private func dropdownMenuContent() -> some View {
        SDDSList(
            items: listItems,
            contentHeight: $contentHeight,
            showDividers: viewModel.dividerEnabled,
            maxHeight: maxHeight,
            appearance: viewModel.appearance.listAppearance
        )
        .frame(height: min(contentHeight, maxHeight))
        .padding([.top, .bottom], viewModel.appearance.size.offset)
    }
    
    private var listItems: [SDDSListItem<EmptyView>] {
        let items = (0..<viewModel.itemsCount).map { index in
            SDDSListItem(
                title: "Item \(index + 1)",
                rightContentEnabled: viewModel.hasDisclosure,
                disabled: false,
                appearance: viewModel.appearance.listAppearance.listItemAppearance,
                onTap: {}
            )
        }
        
        return items
    }
        
    @ViewBuilder
    private func buttonForPosition(_ position: DropdownMenuButtonPosition) -> some View {
        switch position {
        case .topLeft:
            VStack {
                HStack {
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isDropdownMenuPresented = true
                    }
                    .dropdownMenu(
                        isPresented: $isDropdownMenuPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        content: { dropdownMenuContent() }
                    )
                    Spacer()
                }
                Spacer()
            }
        case .topCenter:
            VStack {
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isDropdownMenuPresented = true
                    }
                    .dropdownMenu(
                        isPresented: $isDropdownMenuPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        content: { dropdownMenuContent() }
                    )
                    Spacer()
                }
                Spacer()
            }
        case .topRight:
            VStack {
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isDropdownMenuPresented = true
                    }
                    .dropdownMenu(
                        isPresented: $isDropdownMenuPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        content: { dropdownMenuContent() }
                    )
                }
                Spacer()
            }
        case .centerLeft:
            HStack {
                BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    isDropdownMenuPresented = true
                }
                .dropdownMenu(
                    isPresented: $isDropdownMenuPresented,
                    appearance: viewModel.appearance,
                    placement: viewModel.placement,
                    alignment: viewModel.alignment,
                    content: { dropdownMenuContent() }
                )
                Spacer()
            }
        case .center:
            HStack {
                Spacer()
                BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    isDropdownMenuPresented = true
                }
                .dropdownMenu(
                    isPresented: $isDropdownMenuPresented,
                    appearance: viewModel.appearance,
                    placement: viewModel.placement,
                    alignment: viewModel.alignment,
                    content: { dropdownMenuContent() }
                )
                Spacer()
            }
        case .centerRight:
            HStack {
                Spacer()
                BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    isDropdownMenuPresented = true
                }
                .dropdownMenu(
                    isPresented: $isDropdownMenuPresented,
                    appearance: viewModel.appearance,
                    placement: viewModel.placement,
                    alignment: viewModel.alignment,
                    content: { dropdownMenuContent() }
                )
            }
        case .bottomLeft:
            VStack {
                Spacer()
                HStack {
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isDropdownMenuPresented = true
                    }
                    .dropdownMenu(
                        isPresented: $isDropdownMenuPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        content: { dropdownMenuContent() }
                    )
                    Spacer()
                }
            }
        case .bottomCenter:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isDropdownMenuPresented = true
                    }
                    .dropdownMenu(
                        isPresented: $isDropdownMenuPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        content: { dropdownMenuContent() }
                    )
                    Spacer()
                }
            }
        case .bottomRight:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isDropdownMenuPresented = true
                    }
                    .dropdownMenu(
                        isPresented: $isDropdownMenuPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        content: { dropdownMenuContent() }
                    )
                }
            }
        }
    }
    
    private var placementSelectionView: some View {
        HStack {
            Text("Placement")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverPlacement.allCases, id: \.self) { placement in
                    Button(placement.rawValue) {
                        viewModel.placement = placement
                    }
                }
            } label: {
                Text(viewModel.placement.rawValue)
            }
        }
    }
    
    private var buttonPositionView: some View {
        HStack {
            Text("Button Position")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(DropdownMenuButtonPosition.allCases, id: \.self) { position in
                    Button(position.rawValue) {
                        viewModel.buttonPosition = position
                    }
                }
            } label: {
                Text(viewModel.buttonPosition.rawValue)
            }
        }
    }
    
    private var alignmentSelectionView: some View {
        HStack {
            Text("Alignment")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue.capitalized) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue.capitalized)
            }
        }
    }
    
    private var itemsCount: some View {
        TextField("Count", text: $viewModel.textInput)
            .keyboardType(.numberPad)
    }
    
    private var autoHideToggle: some View {
        Toggle("Auto Hide", isOn: $viewModel.autoHide)
    }
    
    private var hasDisclosure: some View {
        Toggle("Has Disclosure", isOn: $viewModel.hasDisclosure)
    }
    
    private var dividerEnabled: some View {
        Toggle("Divider Enabled", isOn: $viewModel.dividerEnabled)
    }
    


}

#Preview {
    NavigationView {
        DropdownMenuView()
    }
}
