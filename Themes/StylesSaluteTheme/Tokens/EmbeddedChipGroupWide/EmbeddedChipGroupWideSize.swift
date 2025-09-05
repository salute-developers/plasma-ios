import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EmbeddedChipGroupWideSize {
    static let l = EmbeddedChipGroupWideSizeL()
    static let m = EmbeddedChipGroupWideSizeM()
    static let s = EmbeddedChipGroupWideSizeS()
    static let xs = EmbeddedChipGroupWideSizeXs()

    static let all: [ChipGroupSizeConfiguration] = [
        EmbeddedChipGroupWideSize.l,
        EmbeddedChipGroupWideSize.m,
        EmbeddedChipGroupWideSize.s,
        EmbeddedChipGroupWideSize.xs,
    ] 
}
struct EmbeddedChipGroupWideSizeL: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupWideSize"
    }
}
struct EmbeddedChipGroupWideSizeM: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupWideSize"
    }
}
struct EmbeddedChipGroupWideSizeS: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupWideSize"
    }
}
struct EmbeddedChipGroupWideSizeXs: ChipGroupSizeConfiguration {
    var alignment = ChipGroupAlignment.left
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
    var gap = CGFloat(8.0)
    var lineSpacing = CGFloat(8.0)
    var maxColumns = Int(0)
    public var debugDescription: String {
        return "EmbeddedChipGroupWideSize"
    }
}

struct EmbeddedChipGroupWideAnySize: ChipGroupSizeConfiguration {
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
        return "EmbeddedChipGroupWideAnySize"
    }
}
