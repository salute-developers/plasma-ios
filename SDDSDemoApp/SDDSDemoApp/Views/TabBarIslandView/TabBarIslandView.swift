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
}

#Preview {
    TabBarIslandView()
}
