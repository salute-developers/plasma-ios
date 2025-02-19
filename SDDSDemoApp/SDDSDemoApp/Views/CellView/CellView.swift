import Foundation
import SwiftUI
import SDDSComponents

struct CellView: View {
    @ObservedObject private var viewModel: CellViewModel
    
    init(viewModel: CellViewModel = CellViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                cell
            }
            Section(header: Text("Cell")) {
                variations
                contentLeft
                contentCenter
                contentRight
                hasDisclosure
                disclosureText
                alignment
            }
        }
    }
    
    private var cell: some View {
        SDDSCell(
            appearance: viewModel.appearance,
            alignment: viewModel.alignment,
            label: viewModel.label,
            title: viewModel.title,
            subtitle: viewModel.subtitle,
            disclosureEnabled: viewModel.disclosureEnabled,
            disclosureText: viewModel.disclosureText,
            leftContent: { leftContent },
            rightContent: { rightContent }
        )
    }
    
    private var variations: some View {
        VariationsView(viewModel: viewModel)
    }
    
    private var contentLeft: some View {
        HStack {
            Text("Content Left")
            Spacer()
            Menu {
                ForEach(CellContent.allCases, id: \.self) { content in
                    Button(content.rawValue) {
                        viewModel.leftContentType = content
                    }
                }
            } label: {
                Text(viewModel.leftContentType.rawValue.capitalized)
            }
        }
    }
    
    private var contentCenter: some View {
        HStack {
            Text("Content Center")
            Spacer()
            VStack {
                HStack {
                    TextField("Label", text: $viewModel.label)
                }
                Divider()
                HStack {
                    TextField("Title", text: $viewModel.title)
                }
                Divider()
                HStack {
                    TextField("Subtitle", text: $viewModel.subtitle)
                }
            }
        }
    }
    
    private var contentRight: some View {
        HStack {
            Text("Content Right")
            Spacer()
            Menu {
                ForEach(CellContent.allCases, id: \.self) { content in
                    Button(content.rawValue) {
                        viewModel.rightContentType = content
                    }
                }
            } label: {
                Text(viewModel.rightContentType.rawValue.capitalized)
            }
        }
    }
    
    private var hasDisclosure: some View {
        Toggle("Disclosure", isOn: $viewModel.disclosureEnabled)
    }
    
    private var disclosureText: some View {
        HStack {
            Text("Disclosure text")
            Spacer()
            TextField("Disclosure text", text: $viewModel.disclosureText)
        }
    }
    
    private var alignment: some View {
        HStack {
            Text("Alignment")
            Spacer()
            Menu {
                ForEach(CellContentAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue.capitalized)
            }
        }
    }
    
    private var leftContent: some View {
        addContent(type: viewModel.leftContentType)
    }
    
    private var rightContent: some View {
        addContent(type: viewModel.rightContentType)
    }
    
    @ViewBuilder
    private func addContent(type: CellContent) -> some View {
        switch type {
        case .avatar:
            SDDSAvatar(
                text: "AB",
                image: nil,
                placeholderImage: nil,
                status: .online,
                accessibility: AvatarAccessibility()
            )
        case .iconButton:
            IconButton(
                iconAttributes: .init(image: Image.image("buttonIcon"), alignment: .leading),
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image.image("spinner"),
                layoutMode: .fixedWidth(.packed),
                action: {}
            )
        case .switch:
            SDDSSwitch(
                title: "",
                subtitle: "",
                isOn: Binding(get: { self.viewModel.isOn }, set: { newValue in self.viewModel.isOn = newValue }),
                isEnabled: true,
                switchAccessibility: SwitchAccessibility()
            )
        case .radiobox:
            SDDSRadiobox(
                isSelected: Binding(get: { self.viewModel.isSelected }, set: { newValue in self.viewModel.isSelected = newValue }),
                title: "",
                subtitle: nil,
                isEnabled: true,
                images: .init(
                    selectedImage: Image.image("radioboxOn", bundle: Bundle(for: CheckboxViewModel.self)),
                    deselectedImage: Image.image("radioboxIconOff", bundle: Bundle(for: CheckboxViewModel.self))
                )
            )
        case .checkbox:
            SDDSCheckbox(
                state: Binding(get: { self.viewModel.state }, set: { newValue in self.viewModel.state = newValue }),
                title: "",
                subtitle: nil,
                isEnabled: true,
                images:  .init(
                    selectedImage: Image.image("checkboxOn", bundle: Bundle(for: CheckboxViewModel.self)),
                    deselectedImage: Image.image("checkboxIconOff", bundle: Bundle(for: CheckboxViewModel.self)),
                    indeterminateImage: Image.image("checkboxMulti", bundle: Bundle(for: CheckboxViewModel.self))
                )
            )
        case .none:
            EmptyView()
        }
    }
}

#Preview {
    CellView(viewModel: CellViewModel())
}
