import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

public struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel = CounterViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    public var body: some View {
        switch viewModel.componentViewLayoutMode {
        case .screen:
            List {
                counterView
                Section {
                    settings
                }
            }
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
            
        case .subScreen:
            settings
        }
    }
    
    @ViewBuilder
    private var settings: some View {
        if viewModel.componentViewLayoutMode == .screen {
            VariationsView(viewModel: viewModel)
        }
        dataTextField
    }
    
    public var counterView: some View {
        Section {
            HStack {
                Spacer()
                SDDSCounter(
                    text: viewModel.text,
                    appearance: viewModel.appearance,
                    isAnimating: false,
                    isHighlighted: false,
                    isHovered: false,
                    isSelected: false
                )
                Spacer()
            }
        }
        .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
    }
    
    public var dataTextField: some View {
        HStack {
            Text("Data")
            TextField("data", text: $viewModel.text)
                .multilineTextAlignment(.trailing)
        }
    }

}

#Preview {
    CounterView(viewModel: CounterViewModel())
}
