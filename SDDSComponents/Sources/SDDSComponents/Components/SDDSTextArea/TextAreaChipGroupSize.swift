import Foundation
import SDDSThemeCore
import SwiftUI

struct TextAreaChipGroupSize: ChipGroupSizeConfiguration {
    var debugDescription: String {
        String(reflecting: self)
    }
    
    var insets: EdgeInsets {
        EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
    }
    
    var maxColumns: Int {
        8
    }
    
    var alignment: ChipGroupAlignment
    
    init(alignment: ChipGroupAlignment = .left) {
        self.alignment = alignment
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
