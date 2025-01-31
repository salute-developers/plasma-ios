import Foundation
import SwiftUI
import SDDSComponents

public struct SDDSChipGroupSize: ChipGroupSizeConfiguration, Hashable {
    public func insets(for gap: ChipGroupGap) -> EdgeInsets {
        switch gap {
        case .dense:
            return EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        case .wide:
            return EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        }
    }
    
    public var maxColumns: Int {
        8
    }
    
    public var alignment: ChipGroupAlignment {
        return .left
    }
    
    public init() {}

    public func hash(into hasher: inout Hasher) {
        hasher.combine(alignment)
    }
    
    public var debugDescription: String {
        "SDDSChipGroupSize"
    }
}
