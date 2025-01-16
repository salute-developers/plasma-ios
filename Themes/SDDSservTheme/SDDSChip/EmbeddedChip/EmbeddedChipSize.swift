import Foundation
import SwiftUI
import SDDSComponents

public enum EmbeddedChipSize: String, ChipSizeConfiguration {
    case l
    case m
    case s
    case xs
    
    public var debugDescription: String {
        String(reflecting: self.rawValue)
    }
    
    public var iconImageSize: CGSize? {
        switch self {
        case .l:
            return CGSize(width: 24, height: 24)
        case .m:
            return CGSize(width: 24, height: 24)
        case .s:
            return CGSize(width: 16, height: 16)
        case .xs:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var buttonImageSize: CGSize? {
        switch self {
        case .l:
            return CGSize(width: 24, height: 24)
        case .m:
            return CGSize(width: 20, height: 20)
        case .s:
            return CGSize(width: 16, height: 16)
        case .xs:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var leadingInset: CGFloat {
        switch self {
        case .l:
            return 14
        case .m:
            return 12
        case .s:
            return 10
        case .xs:
            return 6
        }
    }
    
    public var trailingInset: CGFloat {
        switch self {
        case .l:
            return 12
        case .m:
            return 10
        case .s:
            return 8
        case .xs:
            return 6
        }
    }
    
    public var spacing: CGFloat {
        switch self {
        case .l:
            return 8
        case .m:
            return 6
        case .s:
            return 4
        case .xs:
            return 2
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .l:
            return 44
        case .m:
            return 36
        case .s:
            return 28
        case .xs:
            return 20
        }
    }
    
    public func cornerRadius(style: SDDSComponents.ComponentShapeStyle) -> CGFloat {
        switch style {
        case .cornered:
            switch self {
            case .l:
                return 8
            case .m:
                return 6
            case .s:
                return 4
            case .xs:
                return 2
            }
        case .pilled:
            return height / 2
        }
    }
}
