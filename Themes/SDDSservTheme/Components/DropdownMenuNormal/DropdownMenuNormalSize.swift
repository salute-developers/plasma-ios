import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuNormalSize {
    static let l = DropdownMenuNormalSizeL()
    static let m = DropdownMenuNormalSizeM()
    static let s = DropdownMenuNormalSizeS()
    static let xl = DropdownMenuNormalSizeXl()
    static let xs = DropdownMenuNormalSizeXs()

    static let all: [DropdownMenuSizeConfiguration] = [
        DropdownMenuNormalSize.l,
        DropdownMenuNormalSize.m,
        DropdownMenuNormalSize.s,
        DropdownMenuNormalSize.xl,
        DropdownMenuNormalSize.xs,
    ] 
}
struct DropdownMenuNormalSizeL: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    var width = CGFloat(200.0)
    public var debugDescription: String {
        return "DropdownMenuNormalSize"
    }
}
struct DropdownMenuNormalSizeM: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var width = CGFloat(200.0)
    public var debugDescription: String {
        return "DropdownMenuNormalSize"
    }
}
struct DropdownMenuNormalSizeS: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    var width = CGFloat(160.0)
    public var debugDescription: String {
        return "DropdownMenuNormalSize"
    }
}
struct DropdownMenuNormalSizeXl: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    var width = CGFloat(200.0)
    public var debugDescription: String {
        return "DropdownMenuNormalSize"
    }
}
struct DropdownMenuNormalSizeXs: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    var width = CGFloat(160.0)
    public var debugDescription: String {
        return "DropdownMenuNormalSize"
    }
}

struct DropdownMenuNormalAnySize: DropdownMenuSizeConfiguration {
    var offset = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer
    var width = CGFloat(0)

    init(size: DropdownMenuSizeConfiguration) {
        self.offset = size.offset
        self.shape = size.shape
        self.width = size.width
    }
    var debugDescription: String {
        return "DropdownMenuNormalAnySize"
    }
}
