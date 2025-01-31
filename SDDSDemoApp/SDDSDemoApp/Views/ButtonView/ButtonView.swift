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
                    switch viewModel.buttonType {
                    case .basic:
                        BasicButton(
                            title: viewModel.title,
                            subtitle: viewModel.subtitle,
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
                            title: viewModel.title,
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
                HStack {
                    Text("Appearance")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        switch viewModel.buttonType {
                        case .basic:
                            ForEach(BasicButton.all, id: \.self) { variation in
                                Button(variation.name) {
                                    viewModel.appearance = variation.appearance.size(viewModel.size)
                                    viewModel.variationName = variation.name
                                }
                            }
                        case .link:
                            ForEach(LinkButton.all, id: \.self) { variation in
                                Button(variation.name) {
                                    viewModel.appearance = variation.appearance.size(viewModel.size)
                                    viewModel.variationName = variation.name
                                }
                            }
                        case .icon:
                            ForEach(IconButton.all, id: \.self) { variation in
                                Button(variation.name) {
                                    viewModel.appearance = variation.appearance.size(viewModel.size)
                                    viewModel.variationName = variation.name
                                }
                            }
                        }
                    } label: {
                        Text(viewModel.variationName.capitalized)
                    }
                }
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
                HStack {
                    Toggle("Icon", isOn: $viewModel.isIconVisible)
                }
                if viewModel.buttonType == .icon {
                    HStack {
                        Toggle("Pilled", isOn: $viewModel.isPilled)
                    }
                }
                if viewModel.buttonType != .icon {
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
                }
                HStack {
                    Text("Size")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    switch viewModel.buttonType {
                    case .basic:
                        Menu {
                            ForEach(BasicButtonSize.allCases, id: \.self) { size in
                                Button(size.rawValue) {
                                    viewModel.size = size
                                }
                            }
                        } label: {
                            if let size = viewModel.size as? BasicButtonSize {
                                Text(size.rawValue)
                            }
                        }
                    case .link:
                        Menu {
                            ForEach(LinkButtonSize.allCases, id: \.self) { size in
                                Button(size.rawValue) {
                                    viewModel.size = size
                                }
                            }
                        } label: {
                            if let size = viewModel.size as? LinkButtonSize {
                                Text(size.rawValue)
                            }
                        }
                    case .icon:
                        Menu {
                            ForEach(IconButtonSize.allCases, id: \.self) { size in
                                Button(size.rawValue) {
                                    viewModel.size = size
                                }
                            }
                        } label: {
                            if let size = viewModel.size as? IconButtonSize {
                                Text(size.rawValue)
                            }
                        }
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
    ButtonView(viewModel: ButtonViewModel())
}
