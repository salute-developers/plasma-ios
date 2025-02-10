import Foundation
import SwiftUI
import SDDSComponents

struct SDDSChipGroupSize: ChipGroupSizeConfiguration, Hashable {
    func insets(for gap: ChipGroupGap) -> EdgeInsets {
        switch gap {
        case .dense:
            return EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        case .wide:
            return EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        }
    }
    
    var maxColumns: Int {
        8
    }
    
    var alignment: ChipGroupAlignment {
        return .left
    }
    
    init() {}

    func hash(into hasher: inout Hasher) {
        hasher.combine(alignment)
    }
    
    var debugDescription: String {
        "SDDSChipGroupSize"
    }
}
