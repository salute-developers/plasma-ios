import Foundation
import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

public struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel = CounterViewModel()
    
    public var body: some View {
        List {
            counterView
            Section {
                VariationsView(viewModel: viewModel)
                dataTextField
            }
        }
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
                    isHovered: false
                )
                Spacer()
            }
        }
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
