import Foundation
import SwiftUI
import SDDSComponents

public enum SDDSCheckboxSize: String, SelectionControlSizeConfiguration, CaseIterable {
    case large
    case medium
    case small
    
    public var debugDescription: String {
        rawValue
    }
    
    public var imageSize: CGSize {
        switch self {
        case .large:
                .init(width: 24, height: 24)
        case .medium:
                .init(width: 24, height: 24)
        case .small:
                .init(width: 16, height: 16)
        }
    }
    
    public var verticalGap: CGFloat {
        0.0
    }
    
    public var horizontalGap: CGFloat {
        switch self {
        case .large:
            12.0
        case .medium:
            12.0
        case .small:
            8.0
        }
    }
}
