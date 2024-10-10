import Foundation
import SDDSThemeCore
import SwiftUI
import SDDSComponents

public enum SDDSTextAreaChipGroupSize: ChipGroupSizeConfiguration {
    case large(ChipGroupAlignment)
    case medium(ChipGroupAlignment)
    case small(ChipGroupAlignment)
    case extraSmall(ChipGroupAlignment)
    
    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var insets: EdgeInsets {
        EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4)
    }
    
    public var maxColumns: Int {
        8
    }
    
    public var alignment: ChipGroupAlignment {
        switch self {
        case .large(let value):
            return value
        case .medium(let value):
            return value
        case .small(let value):
            return value
        case .extraSmall(let value):
            return value
        }
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
