import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CodeFieldSize {
    static let l = CodeFieldSizeL()
    static let m = CodeFieldSizeM()

    static let all: [CodeFieldSizeConfiguration] = [
        CodeFieldSize.l,
        CodeFieldSize.m,
    ] 
}
struct CodeFieldSizeL: CodeFieldSizeConfiguration {
    var captionSpacing = CGFloat(14.0)
    var groupShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var groupSpacing = CGFloat(4.0)
    var height = CGFloat(56.0)
    var itemShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius+2.0) as PathDrawer
    var itemSpacing = CGFloat(2.0)
    var width = CGFloat(44.0)
    public var debugDescription: String {
        return "CodeFieldSize"
    }
}
struct CodeFieldSizeM: CodeFieldSizeConfiguration {
    var captionSpacing = CGFloat(12.0)
    var groupShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var groupSpacing = CGFloat(4.0)
    var height = CGFloat(48.0)
    var itemShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var itemSpacing = CGFloat(2.0)
    var width = CGFloat(38.0)
    public var debugDescription: String {
        return "CodeFieldSize"
    }
}

struct CodeFieldAnySize: CodeFieldSizeConfiguration {
    var captionSpacing = CGFloat(0)
    var groupShape = DefaultPathDrawer() as PathDrawer
    var groupSpacing = CGFloat(0)
    var height = CGFloat(0)
    var itemShape = DefaultPathDrawer() as PathDrawer
    var itemSpacing = CGFloat(0)
    var width = CGFloat(0)

    init(size: CodeFieldSizeConfiguration) {
        self.captionSpacing = size.captionSpacing
        self.groupShape = size.groupShape
        self.groupSpacing = size.groupSpacing
        self.height = size.height
        self.itemShape = size.itemShape
        self.itemSpacing = size.itemSpacing
        self.width = size.width
    }
    var debugDescription: String {
        return "CodeFieldAnySize"
    }
}
