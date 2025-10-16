import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct WheelView: View {
    @ObservedObject private var viewModel: WheelViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: WheelViewModel = WheelViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSWheel(
                        wheels: viewModel.wheels,
                        selection: $viewModel.selection,
                        wheelCount: viewModel.wheelsCount,
                        visibleItemsCount: viewModel.visibleItemsCount
                    )
                    .wheelAppearance(viewModel.appearance)
                    Spacer()
                }
            }
            
            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Wheels Count")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(1...5, id: \.self) { count in
                            Button("\(count)") {
                                viewModel.wheelsCount = count
                            }
                        }
                    } label: {
                        Text("\(viewModel.wheelsCount)")
                    }
                }
                HStack {
                    Text("Visible Items")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(3...7, id: \.self) { count in
                            Button("\(count)") {
                                viewModel.visibleItemsCount = count
                            }
                        }
                    } label: {
                        Text("\(viewModel.visibleItemsCount)")
                    }
                }
            }
            
            Section(header: Text("Descriptions")) {
                ForEach(0..<min(viewModel.wheelsCount, viewModel.wheelDescriptions.count), id: \.self) { index in
                    HStack {
                        Text("Wheel \(index + 1)")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        TextField("Description", text: Binding(
                            get: { viewModel.wheelDescriptions[index] },
                            set: { viewModel.updateWheelDescription(at: index, description: $0) }
                        ))
                        .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
        .navigationTitle("Wheel")
    }
}

#Preview {
    WheelView()
}

