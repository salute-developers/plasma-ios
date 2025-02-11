import Foundation
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview
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
            }
        }
    }
    
    private var cell: some View {
        SDDSCell(
            leftContent: viewModel.leftContent,
            centerContent: viewModel.centerContent,
            rightContent: viewModel.rightContent,
            alignment: viewModel.alignment
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
                    TextField("Label", text: $viewModel.centerContent.label)
                }
                Divider()
                HStack {
                    TextField("Title", text: $viewModel.centerContent.title)
                }
                Divider()
                HStack {
                    TextField("Subtitle", text: $viewModel.centerContent.subtitle)
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
}

#Preview {
    CellView(viewModel: CellViewModel())
}
