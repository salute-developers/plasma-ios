import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

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
                    .id("wheel-\(viewModel.wheelsCount)-\(viewModel.visibleItemsCount)")
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Wheels Count")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(1...3, id: \.self) { count in
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
                HStack {
                    Text("Divider Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        Button("Empty") {
                            viewModel.dividerStyle = .empty
                        }
                        Button("Dots") {
                            viewModel.dividerStyle = .dots
                        }
                        Button("Divider") {
                            viewModel.dividerStyle = .divider
                        }
                    } label: {
                        Text(dividerStyleText(viewModel.dividerStyle))
                    }
                }
            }
            
            Section(header: Text("Custom Labels")) {
                ForEach(0..<min(viewModel.wheelsCount, viewModel.wheelLabels.count), id: \.self) { index in
                    HStack {
                        Text("Wheel \(index + 1)")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        TextField("Label", text: Binding(
                            get: { viewModel.wheelLabels[index] },
                            set: { viewModel.updateWheelLabel(at: index, label: $0) }
                        ))
                        .multilineTextAlignment(.trailing)
                    }
                }
            }
            
            Section(header: Text("Text After")) {
                ForEach(0..<min(viewModel.wheelsCount, viewModel.wheelTextAfter.count), id: \.self) { index in
                    HStack {
                        Text("Wheel \(index + 1)")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        TextField("Text After", text: Binding(
                            get: { viewModel.wheelTextAfter[index] },
                            set: { viewModel.updateWheelTextAfter(at: index, textAfter: $0) }
                        ))
                        .multilineTextAlignment(.trailing)
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
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Wheel")
    }
    
    private func dividerStyleText(_ style: WheelDividerStyle) -> String {
        switch style {
        case .empty:
            return "Empty"
        case .dots:
            return "Dots"
        case .divider:
            return "Divider"
        }
    }
}

#Preview {
    WheelView()
}
