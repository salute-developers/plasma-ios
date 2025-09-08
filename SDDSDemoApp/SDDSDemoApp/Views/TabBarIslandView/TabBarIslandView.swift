import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct TabBarIslandView: View {
    @ObservedObject private var viewModel: TabBarIslandViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: TabBarIslandViewModel = TabBarIslandViewModel()) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        List {
            Section {
                tabBarTypeSelectionView
                extraSelectionView
                countView
                customWidth
                VariationsView(viewModel: viewModel)
            }
        }
        .tabBarIsland(
            items: viewModel.tabBarItems,
            selectedIndex: $viewModel.selectedIndex,
            appearance: viewModel.appearance
        )
        .navigationTitle("TabBar Island")
    }
    
    @ViewBuilder
    private var tabBarTypeSelectionView: some View {
        HStack {
            Text("TabBar Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(TabBarIslandType.allCases, id: \.self) { tabBarIslandType in
                    Button(tabBarIslandType.rawValue.capitalized) {
                        viewModel.tabBarIslandType = tabBarIslandType
                    }
                }
            } label: {
                Text(viewModel.tabBarIslandType.rawValue.capitalized)
            }
        }
    }
    
    @ViewBuilder
    private var countView: some View {
        HStack {
            Text("Count")
            TextField("line count", text: $viewModel.countText)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
        }
    }
    
    @ViewBuilder
    private var extraSelectionView: some View {
        HStack {
            Text("Extra Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(TabBarExtra.allCases, id: \.self) { extra in
                    Button(extra.rawValue.capitalized) {
                        viewModel.extra = extra
                    }
                }
            } label: {
                Text(viewModel.extra.rawValue.capitalized)
            }
        }
    }
    
    @ViewBuilder
    private var customWidth: some View {
        HStack {
            Text("Custom Width")
            Spacer()
            Toggle("", isOn: $viewModel.customWidthEnabled)
        }
    }
}

#Preview {
    TabBarIslandView()
}
