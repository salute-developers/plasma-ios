import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct SwitchView: View {
    @ObservedObject private var viewModel: SwitchViewModel

    init(viewModel: SwitchViewModel = SwitchViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSSwitch(
                        title: viewModel.title,
                        subtitle: viewModel.subtitle,
                        isOn: $viewModel.isOn,
                        isEnabled: viewModel.isEnabled,
                        size: viewModel.size,
                        appearance: viewModel.appearance,
                        switchAccessibility: viewModel.switchAccessibility
                    )
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Switch Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Subtitle")
                    Spacer()
                    TextField("Switch Subtitle", text: $viewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
                
                HStack {
                    Toggle("On/Off", isOn: $viewModel.isOn)
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
                    Text("Title Color")
                    Spacer()
                    Menu {
                        ForEach(ColorStyle.allCases, id: \.self) { style in
                            Button(style.rawValue) {
                                viewModel.titleColor = style
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.titleColor.color)
                            
                            Text(viewModel.titleColor.rawValue)
                        }
                    }
                }
                
                HStack {
                    Text("Subtitle Color")
                    Spacer()
                    Menu {
                        ForEach(ColorStyle.allCases, id: \.self) { style in
                            Button(style.rawValue) {
                                viewModel.subtitleColor = style
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.subtitleColor.color)
                            
                            Text(viewModel.subtitleColor.rawValue)
                        }
                    }
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
        .navigationTitle("SDDSSwitch")
    }
}

#Preview {
    SwitchView(viewModel: SwitchViewModel())
}
