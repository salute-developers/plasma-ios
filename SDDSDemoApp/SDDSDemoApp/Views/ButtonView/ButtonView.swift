import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponents

struct ButtonView: View {
    @ObservedObject private var viewModel: ButtonViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: ButtonViewModel = ButtonViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSButton(
                        title: viewModel.title,
                        subtitle: viewModel.subtitle,
                        iconAttributes: viewModel.iconAttributes,
                        size: viewModel.size,
                        isDisabled: viewModel.isDisabled,
                        isLoading: viewModel.isLoading,
                        spinnerImage: viewModel.spinnerImage,
                        spinnerStyle: viewModel.spinnerStyle,
                        buttonStyle: viewModel.buttonStyle,
                        appearance: viewModel.appearance,
                        layoutMode: viewModel.layoutMode, 
                        action: {}
                    )
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSComponents.ButtonStyle.allCases, id: \.self) { style in
                            Button(style.rawValue.capitalized) {
                                viewModel.buttonStyle = style
                            }
                        }
                    } label: {
                        Text(viewModel.buttonStyle.rawValue.capitalized)
                    }
                }
                HStack {
                    Text("Color Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSServeB2CStyle.allCases, id: \.self) { style in
                            Button(style.rawValue) {
                                viewModel.colorStyle = style
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.colorStyle.defaultButtonAppearance.backgroundColor.color(for: colorScheme))
                            
                            Text(viewModel.colorStyle.rawValue)
                        }
                    }
                }
                if viewModel.isNotEquilateral {
                    HStack {
                        Text("Title")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        TextField("Button Title", text: $viewModel.title)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Value")
                        Spacer()
                            .frame(maxWidth: .infinity)
                        TextField("Button Value", text: $viewModel.subtitle)
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
                                viewModel.size = size
                            }
                        }
                    } label: {
                        if let size = viewModel.size as? ButtonSize {
                            Text(size.rawValue)
                        }
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
                                    viewModel.layoutMode = layoutMode
                                }
                            }
                        } label: {
                            Text(viewModel.layoutMode.title)
                        }
                    }
                }
                HStack {
                    Toggle("Disabled", isOn: $viewModel.isDisabled)
                }
                HStack {
                    Toggle("Loading", isOn: $viewModel.isLoading)
                }
                HStack {
                    Text("Spinner Style")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SpinnerStyle.allCases, id: \.self) { spinnerStyle in
                            Button(spinnerStyle.rawValue.capitalized) {
                                viewModel.spinnerStyle = spinnerStyle
                            }
                        }
                    } label: {
                        Text(viewModel.spinnerStyle.rawValue.capitalized)
                    }
                }
            }
        }
        .navigationTitle("SDDSButton")
    }
}

#Preview {
    ButtonView(viewModel: ButtonViewModel())
}
