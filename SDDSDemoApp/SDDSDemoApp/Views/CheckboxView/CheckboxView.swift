import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct CheckboxView: View {
    @ObservedObject private var viewModel: CheckboxViewModel
    
    init(viewModel: CheckboxViewModel = CheckboxViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSCheckbox(
                        state: $viewModel.state,
                        title: viewModel.title,
                        subtitle: viewModel.subtitle,
                        isEnabled: viewModel.isEnabled,
                        images: .checkbox,
                        size: viewModel.size,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Checkbox Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Subtitle")
                    Spacer()
                    TextField("Checkbox Subtitle", text: $viewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("State")
                    Spacer()
                    Menu {
                        ForEach(SelectionControlState.allCases, id: \.self) { state in
                            Button(state.rawValue.capitalized) {
                                viewModel.state = state
                            }
                        }
                    } label: {
                        Text(viewModel.state.rawValue.capitalized)
                    }
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
                    Text("Image Size")
                    Spacer()
                    VStack {
                        TextField("Width", value: $viewModel.imageWidth, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .frame(maxWidth: 100)
                        TextField("Height", value: $viewModel.imageHeight, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .frame(maxWidth: 100)
                    }
                }
                
                HStack {
                    Text("Horizontal Gap")
                    Spacer()
                    TextField("Gap", value: $viewModel.horizontalGap, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
                
                HStack {
                    Text("Vertical Gap")
                    Spacer()
                    TextField("Gap", value: $viewModel.verticalGap, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
            }
        }
        .navigationTitle("SDDSCheckbox")
    }
}

#Preview {
    CheckboxView(viewModel: CheckboxViewModel())
}
