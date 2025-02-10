import Foundation
import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

enum SDDSButtonType: String, CaseIterable {
    case basic = "Basic Button"
    case link = "Link Button"
    case icon = "Icon Button"
}

struct ButtonView: View {
    @ObservedObject private var viewModel: ButtonViewModel = ButtonViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    switch viewModel.buttonType {
                    case .basic:
                        BasicButton(
                            title: viewModel.label,
                            subtitle: viewModel.value,
                            iconAttributes: viewModel.iconAttributes,
                            isDisabled: viewModel.isDisabled,
                            isLoading: viewModel.isLoading,
                            spinnerImage: viewModel.spinnerImage,
                            appearance: viewModel.appearance,
                            layoutMode: viewModel.layoutMode,
                            action: {}
                        )
                    case .link:
                        LinkButton(
                            title: viewModel.label,
                            iconAttributes: viewModel.iconAttributes,
                            isDisabled: viewModel.isDisabled,
                            isLoading: viewModel.isLoading,
                            spinnerImage: viewModel.spinnerImage,
                            appearance: viewModel.appearance,
                            layoutMode: viewModel.layoutMode,
                            action: {}
                        )
                    case .icon:
                        IconButton(
                            iconAttributes: viewModel.iconAttributes,
                            isDisabled: viewModel.isDisabled,
                            isLoading: viewModel.isLoading,
                            spinnerImage: viewModel.spinnerImage,
                            appearance: viewModel.appearance,
                            layoutMode: viewModel.layoutMode,
                            action: {}
                        )
                    }
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Button Type")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(SDDSButtonType.allCases, id: \.self) { buttonType in
                            Button(buttonType.rawValue.capitalized) {
                                viewModel.buttonType = buttonType
                            }
                        }
                    } label: {
                        Text(viewModel.buttonType.rawValue.capitalized)
                    }
                }
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Label")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Button Label", text: $viewModel.label)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Value")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Button Value", text: $viewModel.value)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Toggle("Icon", isOn: $viewModel.iconVisible)
                }
                HStack {
                    Text("Icon Alignment")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(ButtonAlignment.allCases, id: \.self) { alignment in
                            Button(alignment.rawValue) {
                                viewModel.alignment = alignment
                            }
                        }
                    } label: {
                        Text(viewModel.alignment.rawValue)
                    }
                }
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
                HStack {
                    Toggle("Disabled", isOn: $viewModel.isDisabled)
                }
                HStack {
                    Toggle("Loading", isOn: $viewModel.isLoading)
                }
            }
        }
        .navigationTitle("SDDSButton")
    }
}

#Preview {
    ButtonView()
}
