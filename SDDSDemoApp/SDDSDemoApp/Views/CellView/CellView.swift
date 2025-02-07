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
        
    }
}
