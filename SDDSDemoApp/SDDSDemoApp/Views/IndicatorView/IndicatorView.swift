import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSservTheme

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
            
            Section {
                VariationsView(viewModel: viewModel)
            }
        }
        .navigationTitle("Indicator")
    }


}

#Preview {
    ButtonView()
}
