import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore

struct ButtonView: View {
    @ObservedObject private var viewModel: ButtonViewModel
    
    init(viewModel: ButtonViewModel = ButtonViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section("View") {
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
                    .applyIf(viewModel.isDebug, transform: { $0.debug() })
                    Spacer()
                }
            }
            
            Section("Tokens") {
                HStack {
                    Text("Title")
                    Spacer()
                    Text(viewModel.appearance.titleColor.id)
                }
                HStack {
                    Text("Title Font")
                    Spacer()
                    Text(viewModel.appearance.titleTypography.typography(with: viewModel.size)?.description ?? "")
                }
                HStack {
                    Text("Subtitle")
                    Spacer()
                    Text(viewModel.appearance.subtitleColor.id)
                }
                HStack {
                    Text("Subtitle Font")
                    Spacer()
                    Text(viewModel.appearance.subtitleTypography.typography(with: viewModel.size)?.description ?? "")
                }
                HStack {
                    Text("Spinner")
                    Spacer()
                    Text(viewModel.appearance.spinnerColor.id)
                }
                HStack {
                    Text("Background")
                    Spacer()
                    Text(viewModel.appearance.backgroundColor.id)
                }
            }
            
            Section("Settings") {
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
                    Text("Appearance")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(ButtonAppearance.all, id: \.name) { appearance in
                            Button(appearance.name) {
                                viewModel.appearance = appearance
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.appearance.backgroundColor.color())
                            
                            Text(viewModel.appearance.name)
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
                    Toggle("Debug", isOn: $viewModel.isDebug)
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
