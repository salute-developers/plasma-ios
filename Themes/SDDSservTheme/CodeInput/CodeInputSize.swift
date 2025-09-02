import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CodeInputSize {
    static let l = CodeInputSizeL()
    static let m = CodeInputSizeM()
    static let s = CodeInputSizeS()

    static let all: [CodeInputSizeConfiguration] = [
        CodeInputSize.l,
        CodeInputSize.m,
        CodeInputSize.s,
    ] 
}
struct CodeInputSizeL: CodeInputSizeConfiguration {
    var captionPadding = CGFloat(40.0)
    var dotSize = CGFloat(24.0)
    var groupSpacing = CGFloat(36.0)
    var itemHeight = CGFloat(92.0)
    var itemSpacing = CGFloat(12.0)
    var itemWidth = CGFloat(56.0)
    var strokeWidth = CGFloat(2.0)
    public var debugDescription: String {
        return "CodeInputSize"
    }
}
struct CodeInputSizeM: CodeInputSizeConfiguration {
    var captionPadding = CGFloat(28.0)
    var dotSize = CGFloat(16.0)
    var groupSpacing = CGFloat(28.0)
    var itemHeight = CGFloat(60.0)
    var itemSpacing = CGFloat(8.0)
    var itemWidth = CGFloat(36.0)
    var strokeWidth = CGFloat(1.5)
    public var debugDescription: String {
        return "CodeInputSize"
    }
}
struct CodeInputSizeS: CodeInputSizeConfiguration {
    var captionPadding = CGFloat(24.0)
    var dotSize = CGFloat(12.0)
    var groupSpacing = CGFloat(16.0)
    var itemHeight = CGFloat(44.0)
    var itemSpacing = CGFloat(4.0)
    var itemWidth = CGFloat(26.0)
    var strokeWidth = CGFloat(1.0)
    public var debugDescription: String {
        return "CodeInputSize"
    }
}

struct CodeInputAnySize: CodeInputSizeConfiguration {
    var captionPadding = CGFloat(0)
    var dotSize = CGFloat(0)
    var groupSpacing = CGFloat(0)
    var itemHeight = CGFloat(0)
    var itemSpacing = CGFloat(0)
    var itemWidth = CGFloat(0)
    var strokeWidth = CGFloat(0)

    init(size: CodeInputSizeConfiguration) {
        self.captionPadding = size.captionPadding
        self.dotSize = size.dotSize
        self.groupSpacing = size.groupSpacing
        self.itemHeight = size.itemHeight
        self.itemSpacing = size.itemSpacing
        self.itemWidth = size.itemWidth
        self.strokeWidth = size.strokeWidth
    }
    var debugDescription: String {
        return "CodeInputAnySize"
    }
}
