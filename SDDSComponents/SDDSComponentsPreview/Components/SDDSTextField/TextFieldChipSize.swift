import Foundation
import SwiftUI
import SDDSComponents

public enum TextFieldChipSize: ChipSizeConfiguration {
    case large
    case medium
    case small
    case extraSmall
    
    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var iconImageSize: CGSize? {
        switch self {
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 20, height: 20)
        case .small:
            return CGSize(width: 16, height: 16)
        case .extraSmall:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var buttonImageSize: CGSize? {
        switch self {
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 20, height: 20)
        case .small:
            return CGSize(width: 16, height: 16)
        case .extraSmall:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var leadingInset: CGFloat {
        switch self {
        case .large:
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        case .extraSmall:
            return 10
        }
    }
    
    public var trailingInset: CGFloat {
        switch self {
        case .large:
            return 8
        case .medium:
            return 6
        case .small:
            return 4
        case .extraSmall:
            return 2
        }
    }
    
    public var spacing: CGFloat {
        switch self {
        case .large:
            return 6
        case .medium:
            return 4
        case .small:
            return 2
        case .extraSmall:
            return 2
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .large:
            return 44
        case .medium:
            return 40
        case .small:
            return 32
        case .extraSmall:
            return 24
        }
    }
    
    public var borderStyle: ChipBorderStyle {
        switch self {
        case .large:
            return .default(8)
        case .medium:
            return .default(6)
        case .small:
            return .default(4)
        case .extraSmall:
            return .default(2)
        }
    }

}

#Preview {
    SDDSTextFieldPreview.previews
}
