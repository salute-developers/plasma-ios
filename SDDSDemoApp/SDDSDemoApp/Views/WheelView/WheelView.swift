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
                        description: viewModel.descriptionVisible ? viewModel.description : nil,
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
                    Text("Description")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Enter description", text: $viewModel.description)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Toggle("Show Description", isOn: $viewModel.descriptionVisible)
                }
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
        }
        .navigationTitle("Wheel")
    }
}

#Preview {
    WheelView()
}

