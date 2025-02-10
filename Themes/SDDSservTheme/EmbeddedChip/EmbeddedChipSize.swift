import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipSize {
    static let l = EmbeddedChipSizeL()
    static let m = EmbeddedChipSizeM()
    static let s = EmbeddedChipSizeS()
    static let xs = EmbeddedChipSizeXs()

    static let all: [ChipSizeConfiguration] = [
        EmbeddedChipSize.l,
        EmbeddedChipSize.m,
        EmbeddedChipSize.s,
        EmbeddedChipSize.xs,
    ] 
}
struct EmbeddedChipSizeL: ChipSizeConfiguration {
    public var spacing: CGFloat { 0 }
    public func cornerRadius(style: SDDSComponents.ComponentShapeStyle) -> CGFloat {
        0
    }
    public var buttonImageSize: CGSize? = CGSize(width:24.0, height:24.0)
    public var contentEndPadding = CGFloat(8.0)
    public var contentStartPadding = CGFloat(8.0)
    public var cornerRadius = ShapeToken.roundS.cornerRadius
    public var height = CGFloat(44.0)
    public var iconImageSize: CGSize? = CGSize(width:24.0, height:24.0)
    public var leadingInset = CGFloat(14.0)
    public var trailingInset = CGFloat(12.0)
    public var debugDescription: String {
        return "EmbeddedChipSize"
    }
}
struct EmbeddedChipSizeM: ChipSizeConfiguration {
    public var spacing: CGFloat { 0 }
    public func cornerRadius(style: SDDSComponents.ComponentShapeStyle) -> CGFloat {
        0
    }
    public var buttonImageSize: CGSize? = CGSize(width:24.0, height:24.0)
    public var contentEndPadding = CGFloat(6.0)
    public var contentStartPadding = CGFloat(6.0)
    public var cornerRadius = ShapeToken.roundXs.cornerRadius
    public var height = CGFloat(36.0)
    public var iconImageSize: CGSize? = CGSize(width:24.0, height:24.0)
    public var leadingInset = CGFloat(12.0)
    public var trailingInset = CGFloat(10.0)
    public var debugDescription: String {
        return "EmbeddedChipSize"
    }
}
struct EmbeddedChipSizeS: ChipSizeConfiguration {
    public var spacing: CGFloat { 0 }
    public func cornerRadius(style: SDDSComponents.ComponentShapeStyle) -> CGFloat {
        0
    }
    public var buttonImageSize: CGSize? = CGSize(width:16.0, height:16.0)
    public var contentEndPadding = CGFloat(4.0)
    public var contentStartPadding = CGFloat(4.0)
    public var cornerRadius = ShapeToken.roundXxs.cornerRadius
    public var height = CGFloat(28.0)
    public var iconImageSize: CGSize? = CGSize(width:16.0, height:16.0)
    public var leadingInset = CGFloat(10.0)
    public var trailingInset = CGFloat(8.0)
    public var debugDescription: String {
        return "EmbeddedChipSize"
    }
}
struct EmbeddedChipSizeXs: ChipSizeConfiguration {
    public var spacing: CGFloat { 0 }
    public func cornerRadius(style: SDDSComponents.ComponentShapeStyle) -> CGFloat {
        0
    }
    public var buttonImageSize: CGSize? = CGSize(width:12.0, height:12.0)
    public var contentEndPadding = CGFloat(2.0)
    public var contentStartPadding = CGFloat(2.0)
    public var cornerRadius = ShapeToken.roundXxs.cornerRadius
    public var height = CGFloat(20.0)
    public var iconImageSize: CGSize? = CGSize(width:12.0, height:12.0)
    public var leadingInset = CGFloat(6.0)
    public var trailingInset = CGFloat(6.0)
    public var debugDescription: String {
        return "EmbeddedChipSize"
    }
}

struct EmbeddedChipAnySize: ChipSizeConfiguration {
    public func cornerRadius(style: SDDSComponents.ComponentShapeStyle) -> CGFloat {
        0
    }
    public var buttonImageSize: CGSize? = CGSize.zero
    public var contentEndPadding = CGFloat(0)
    public var contentStartPadding = CGFloat(0)
    public var cornerRadius = CGFloat(0)
    public var height = CGFloat(0)
    public var iconImageSize: CGSize? = CGSize.zero
    public var leadingInset = CGFloat(0)
    public var spacing = CGFloat(0)
    public var trailingInset = CGFloat(0)

    init(size: ChipSizeConfiguration) {
        self.buttonImageSize = size.buttonImageSize
        self.contentEndPadding = size.contentEndPadding
        self.contentStartPadding = size.contentStartPadding
        self.cornerRadius = size.cornerRadius
        self.height = size.height
        self.iconImageSize = size.iconImageSize
        self.leadingInset = size.leadingInset
        self.spacing = size.spacing
        self.trailingInset = size.trailingInset
    }
    var debugDescription: String {
        return "EmbeddedChipAnySize"
    }
}
