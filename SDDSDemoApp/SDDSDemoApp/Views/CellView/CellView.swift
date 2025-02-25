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
        Cell(
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
        viewModel.addContent(type: viewModel.leftContentType)
    }
    
    private var rightContent: some View {
        viewModel.addContent(type: viewModel.rightContentType)
    }
}

#Preview {
    CellView(viewModel: CellViewModel())
}
