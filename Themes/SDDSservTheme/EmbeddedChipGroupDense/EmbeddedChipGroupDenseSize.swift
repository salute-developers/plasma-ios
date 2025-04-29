import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipGroupDenseSize {
    static let l = EmbeddedChipGroupDenseSizeL()
    static let m = EmbeddedChipGroupDenseSizeM()
    static let s = EmbeddedChipGroupDenseSizeS()
    static let xs = EmbeddedChipGroupDenseSizeXs()

    static let all: [ChipGroupSizeConfiguration] = [
        EmbeddedChipGroupDenseSize.l,
        EmbeddedChipGroupDenseSize.m,
        EmbeddedChipGroupDenseSize.s,
        EmbeddedChipGroupDenseSize.xs,
    ] 
}
struct EmbeddedChipGroupDenseSizeL: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupDenseSize"
    }
}
struct EmbeddedChipGroupDenseSizeM: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupDenseSize"
    }
}
struct EmbeddedChipGroupDenseSizeS: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupDenseSize"
    }
}
struct EmbeddedChipGroupDenseSizeXs: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(2.0)
    var lineSpacing = CGFloat(2.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupDenseSize"
    }
}

struct EmbeddedChipGroupDenseAnySize: ChipGroupSizeConfiguration {
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
        return "EmbeddedChipGroupDenseAnySize"
    }
}
