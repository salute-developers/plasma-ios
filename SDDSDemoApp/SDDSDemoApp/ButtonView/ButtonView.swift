import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct ButtonView: View {
    @ObservedObject private var viewModel: ButtonViewModel
    
    init(viewModel: ButtonViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSButton(viewModel: viewModel.buttonViewModel)
                    Spacer()
                }
                .frame(height: 150)
            }
            
            Section {
                HStack {
                    Text("Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSComponents.ButtonStyle.allCases, id: \.self) { style in
                            Button(style.rawValue.capitalized) {
                                viewModel.buttonViewModel.buttonStyle = style
                            }
                        }
                    } label: {
                        Text(viewModel.buttonViewModel.buttonStyle.rawValue.capitalized)
                    }
                }
                HStack {
                    Text("Color Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SolidColorStyle.allCases, id: \.self) { style in
                            Button(style.rawValue) {
                                viewModel.colorStyle = style
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.colorStyle.suiColor)
                            
                            Text(viewModel.colorStyle.rawValue)
                        }
                    }
                }
                if viewModel.isNotEquilateral {
                    HStack {
                        Text("Title")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        TextField("Button Title", text: $viewModel.buttonViewModel.title)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Value")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        TextField("Button Value", text: $viewModel.buttonViewModel.subtitle)
                            .multilineTextAlignment(.trailing)
                    }
                }
                HStack {
                    Toggle("Icon", isOn: $viewModel.isIconVisible)
                }
                if viewModel.isNotEquilateral {
                    HStack {
                        Text("Icon Alignment")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        Menu {
                            ForEach(SDDSComponents.Alignment.allCases, id: \.self) { alignment in
                                Button(alignment.rawValue.capitalized) {
                                    viewModel.alignment = alignment
                                }
                            }
                        } label: {
                            Text(viewModel.alignment.rawValue)
                        }
                    }
                }
                HStack {
                    Text("Size")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(ButtonSize.allCases, id: \.self) { size in
                            Button(size.rawValue) {
                                viewModel.buttonViewModel.size = size
                            }
                        }
                    } label: {
                        Text(viewModel.buttonViewModel.size.rawValue)
                    }
                }
                if viewModel.isNotEquilateral {
                    HStack {
                        Text("Layout")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        Menu {
                            ForEach(ButtonLayoutMode.allCases, id: \.self) { layoutMode in
                                Button(layoutMode.title) {
                                    viewModel.buttonViewModel.layoutMode = layoutMode
                                }
                            }
                        } label: {
                            Text(viewModel.buttonViewModel.layoutMode.title)
                        }
                    }
                }
                HStack {
                    Toggle("Disabled", isOn: $viewModel.buttonViewModel.isDisabled)
                }
                HStack {
                    Toggle("Loading", isOn: $viewModel.buttonViewModel.isLoading)
                }
                HStack {
                    Text("Spinner Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SpinnerStyle.allCases, id: \.self) { spinnerStyle in
                            Button(spinnerStyle.rawValue.capitalized) {
                                viewModel.buttonViewModel.spinnerStyle = spinnerStyle
                            }
                        }
                    } label: {
                        Text(viewModel.buttonViewModel.spinnerStyle.rawValue.capitalized)
                    }
                }
            }
        }
    }
}

#Preview {
    ButtonView(viewModel: ButtonViewModel())
}
