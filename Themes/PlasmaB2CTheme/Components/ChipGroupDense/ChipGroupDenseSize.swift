import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ChipGroupDenseSize {
    static let l = ChipGroupDenseSizeL()
    static let m = ChipGroupDenseSizeM()
    static let s = ChipGroupDenseSizeS()
    static let xs = ChipGroupDenseSizeXs()

    static let all: [ChipGroupSizeConfiguration] = [
        ChipGroupDenseSize.l,
        ChipGroupDenseSize.m,
        ChipGroupDenseSize.s,
        ChipGroupDenseSize.xs,
    ] 
}
struct ChipGroupDenseSizeL: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupDenseSize"
    }
}
struct ChipGroupDenseSizeM: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupDenseSize"
    }
}
struct ChipGroupDenseSizeS: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupDenseSize"
    }
}
struct ChipGroupDenseSizeXs: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "ChipGroupDenseSize"
    }
}

struct ChipGroupDenseAnySize: ChipGroupSizeConfiguration {
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
        return "ChipGroupDenseAnySize"
    }
}
