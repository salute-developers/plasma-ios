import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ChipSize {
    static let l = ChipSizeL()
    static let m = ChipSizeM()
    static let s = ChipSizeS()
    static let xs = ChipSizeXs()

    static let all: [ChipSizeConfiguration] = [
        ChipSize.l,
        ChipSize.m,
        ChipSize.s,
        ChipSize.xs,
    ] 
}
struct ChipSizeL: ChipSizeConfiguration {
    var buttonImageSize = CGSize(width:24.0, height:24.0)
    var contentEndPadding = CGFloat(8.0)
    var contentStartPadding = CGFloat(8.0)
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var height = CGFloat(48.0)
    var iconImageSize = CGSize(width:24.0, height:24.0)
    var leadingInset = CGFloat(16.0)
    var trailingInset = CGFloat(16.0)
    public var debugDescription: String {
        return "ChipSize"
    }
}
struct ChipSizeM: ChipSizeConfiguration {
    var buttonImageSize = CGSize(width:24.0, height:24.0)
    var contentEndPadding = CGFloat(6.0)
    var contentStartPadding = CGFloat(6.0)
    var cornerRadius = ShapeToken.roundM.cornerRadius-2.0
    var height = CGFloat(40.0)
    var iconImageSize = CGSize(width:24.0, height:24.0)
    var leadingInset = CGFloat(14.0)
    var trailingInset = CGFloat(14.0)
    public var debugDescription: String {
        return "ChipSize"
    }
}
struct ChipSizeS: ChipSizeConfiguration {
    var buttonImageSize = CGSize(width:16.0, height:16.0)
    var contentEndPadding = CGFloat(4.0)
    var contentStartPadding = CGFloat(4.0)
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var height = CGFloat(32.0)
    var iconImageSize = CGSize(width:16.0, height:16.0)
    var leadingInset = CGFloat(12.0)
    var trailingInset = CGFloat(12.0)
    public var debugDescription: String {
        return "ChipSize"
    }
}
struct ChipSizeXs: ChipSizeConfiguration {
    var buttonImageSize = CGSize(width:12.0, height:12.0)
    var contentEndPadding = CGFloat(2.0)
    var contentStartPadding = CGFloat(2.0)
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var height = CGFloat(24.0)
    var iconImageSize = CGSize(width:12.0, height:12.0)
    var leadingInset = CGFloat(10.0)
    var trailingInset = CGFloat(10.0)
    public var debugDescription: String {
        return "ChipSize"
    }
}

struct ChipAnySize: ChipSizeConfiguration {
    var buttonImageSize = CGSize.zero
    var contentEndPadding = CGFloat(0)
    var contentStartPadding = CGFloat(0)
    var cornerRadius = CGFloat(0)
    var height = CGFloat(0)
    var iconImageSize = CGSize.zero
    var leadingInset = CGFloat(0)
    var trailingInset = CGFloat(0)

    init(size: ChipSizeConfiguration) {
        self.buttonImageSize = size.buttonImageSize
        self.contentEndPadding = size.contentEndPadding
        self.contentStartPadding = size.contentStartPadding
        self.cornerRadius = size.cornerRadius
        self.height = size.height
        self.iconImageSize = size.iconImageSize
        self.leadingInset = size.leadingInset
        self.trailingInset = size.trailingInset
    }
    var debugDescription: String {
        return "ChipAnySize"
    }
}
