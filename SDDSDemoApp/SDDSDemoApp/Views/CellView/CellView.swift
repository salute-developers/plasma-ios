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
                contentRight
            }
        }
    }
    
    private var cell: some View {
        SDDSCell(
            leftContent: viewModel.contentLeft,
            centerContent: viewModel.contentCenter,
            rightContent: viewModel.contentRight,
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
    
    private var contentCenter: some View {
        HStack {
            Text("Content Center")
            Spacer()
            
        }
    }
}

#Preview {
    CellView(viewModel: CellViewModel())
}
