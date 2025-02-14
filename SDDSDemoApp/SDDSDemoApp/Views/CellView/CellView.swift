import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

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
            contentAlignment: viewModel.alignment,
            label: viewModel.label,
            title: viewModel.title,
            subtitle: viewModel.subtitle,
            disclosureIcon: viewModel.disclosureIcon,
            disclosureText: viewModel.disclosureText,
            leftContent: { viewModel.leftContent },
            centerContent: { viewModel.centerContent },
            rightContent: { viewModel.rightContent },
            disclosure: { viewModel.disclosure }
        )
    }
    
    private var contentLeft: some View {
        HStack {
            Text("Content Left")
            Spacer()
            Menu {
                ForEach(CellContentPreview.allCases, id: \.self) { content in
                    Button(content.rawValue) {
                        viewModel.contentLeftPreview = content
                    }
                }
            } label: {
                Text(viewModel.contentLeftPreview.rawValue.capitalized)
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
                ForEach(CellContentPreview.allCases, id: \.self) { content in
                    Button(content.rawValue) {
                        viewModel.contentRightPreview = content
                    }
                }
            } label: {
                Text(viewModel.contentRightPreview.rawValue.capitalized)
            }
        }
    }
    
    private var hasDisclosure: some View {
        Toggle("Disclosure", isOn: $viewModel.hasDisclosure)
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
}

#Preview {
    CellView(viewModel: CellViewModel())
}
