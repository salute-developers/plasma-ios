import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct TabBarView: View {
    @ObservedObject private var viewModel: TabBarViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: TabBarViewModel = TabBarViewModel()) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        List {
            Section {
                tabBarTypeSelectionView
                extraSelectionView
                VariationsView(viewModel: viewModel)
            }
        }
        .tabBar(
            items: viewModel.tabBarItems,
            selectedIndex: $viewModel.selectedIndex,
            appearance: viewModel.appearance
        )
        .navigationTitle("TabBar")
    }
    
    @ViewBuilder
    private var tabBarTypeSelectionView: some View {
        HStack {
            Text("TabBar Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(TabBarType.allCases, id: \.self) { tabBarType in
                    Button(tabBarType.rawValue.capitalized) {
                        viewModel.tabBarType = tabBarType
                    }
                }
            } label: {
                Text(viewModel.tabBarType.rawValue.capitalized)
            }
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
}

#Preview {
    TabBarView()
}
