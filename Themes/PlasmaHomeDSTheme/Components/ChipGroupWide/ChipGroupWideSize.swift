import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ChipGroupWideSize {
    static let l = ChipGroupWideSizeL()
    static let m = ChipGroupWideSizeM()
    static let s = ChipGroupWideSizeS()
    static let xs = ChipGroupWideSizeXs()
    static let xxs = ChipGroupWideSizeXxs()

    static let all: [ChipGroupSizeConfiguration] = [
        ChipGroupWideSize.l,
        ChipGroupWideSize.m,
        ChipGroupWideSize.s,
        ChipGroupWideSize.xs,
        ChipGroupWideSize.xxs,
    ] 
}
struct ChipGroupWideSizeL: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupWideSize"
    }
}
struct ChipGroupWideSizeM: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupWideSize"
    }
}
struct ChipGroupWideSizeS: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupWideSize"
    }
}
struct ChipGroupWideSizeXs: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupWideSize"
    }
}
struct ChipGroupWideSizeXxs: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupWideSize"
    }
}

struct ChipGroupWideAnySize: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(0)
    var lineSpacing = CGFloat(0)
    var maxColumns = Int(0)

    init(size: ChipGroupSizeConfiguration) {
        self.alignment = size.alignment
        self.gap = size.gap
        self.lineSpacing = size.lineSpacing
        self.maxColumns = size.maxColumns
    }
    var debugDescription: String {
        return "ChipGroupWideAnySize"
    }
}
