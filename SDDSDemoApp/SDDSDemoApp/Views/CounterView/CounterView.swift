import Foundation
import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

public struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel
    
    init(viewModel: CounterViewModel = CounterViewModel()) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List {
            counterView
            Section {
                dataTextField
                appearance
                size
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
    
    public var appearance: some View {
        HStack {
            Text("Appearance")
            Spacer()
            Menu {
                ForEach(SDDSCounter.all, id: \.self) { variation in
                    Button(variation.name) {
                        viewModel.appearance = variation.appearance.size(viewModel.size)
                        viewModel.variationName = variation.name
                    }
                }
            } label: {
                Text(viewModel.variationName.capitalized)
            }
        }
    }
    
    public var size: some View {
        HStack {
            Text("Size")
            Spacer()
            Menu {
                ForEach(CounterSize.allCases, id: \.self) { size in
                    Button(size.rawValue) {
                        viewModel.size = size
                    }
                }
            } label: {
                if let size = viewModel.size as? CounterSize {
                    Text(size.rawValue)
                }
            }
        }
    }
}

#Preview {
    CounterView(viewModel: CounterViewModel())
}
