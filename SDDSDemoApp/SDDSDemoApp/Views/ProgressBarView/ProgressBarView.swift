import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct ProgressBarView: View {
    @ObservedObject private var viewModel: ProgressBarViewModel

    init(viewModel: ProgressBarViewModel = ProgressBarViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSProgressView(
                        progress: $viewModel.progress,
                        isEnabled: viewModel.isEnabled,
                        appearance: viewModel.appearance,
                        size: viewModel.size
                    )
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Progress")
                    Spacer()
                    Slider(value: $viewModel.progress, in: 0...1)
                }
                
                HStack {
                    Text("Progress Value (%)")
                    Spacer()
                    TextField("Progress", text: $viewModel.progressString)
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }

                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
                
                HStack {
                    Text("Tint Color")
                    Spacer()
                    Menu {
                        ForEach(ColorStyle.allCases, id: \.self) { style in
                            Button(style.rawValue) {
                                viewModel.tintColor = style
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.tintColor.color)
                            
                            Text(viewModel.tintColor.rawValue)
                        }
                    }
                }
                
                HStack {
                    Text("Track Color")
                    Spacer()
                    Menu {
                        ForEach(ColorStyle.allCases, id: \.self) { style in
                            Button(style.rawValue) {
                                viewModel.trackColor = style
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.trackColor.color)
                            
                            Text(viewModel.trackColor.rawValue)
                        }
                    }
                }
                
                HStack {
                    Text("Height")
                    Spacer()
                    TextField("Height", value: $viewModel.height, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
                
                HStack {
                    Text("Indicator Height")
                    Spacer()
                    TextField("Height", value: $viewModel.indicatorHeight, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
                
                HStack {
                    Text("Corner Radius")
                    Spacer()
                    TextField("Radius", value: $viewModel.cornerRadius, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
                
                HStack {
                    Text("Indicator Corner Radius")
                    Spacer()
                    TextField("Radius", value: $viewModel.indicatorCornerRadius, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
            }
        }
        .navigationTitle("SDDSProgressView")
    }
}

#Preview {
    ProgressBarView(viewModel: ProgressBarViewModel())
}
