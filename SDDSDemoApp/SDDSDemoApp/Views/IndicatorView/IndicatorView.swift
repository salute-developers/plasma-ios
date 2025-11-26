import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

struct IndicatorView: View {
    @ObservedObject private var viewModel: IndicatorViewModel = IndicatorViewModel()
    @Environment(\.colorScheme) private var colorScheme
        
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSIndicator(
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Indicator")
    }


}

#Preview {
    ButtonView()
}
