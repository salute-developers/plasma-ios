import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuTightSize {
    static let l = DropdownMenuTightSizeL()
    static let m = DropdownMenuTightSizeM()
    static let s = DropdownMenuTightSizeS()
    static let xl = DropdownMenuTightSizeXl()
    static let xs = DropdownMenuTightSizeXs()

    static let all: [DropdownMenuSizeConfiguration] = [
        DropdownMenuTightSize.l,
        DropdownMenuTightSize.m,
        DropdownMenuTightSize.s,
        DropdownMenuTightSize.xl,
        DropdownMenuTightSize.xs,
    ] 
}
struct DropdownMenuTightSizeL: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    var width = CGFloat(200.0)
    public var debugDescription: String {
        return "DropdownMenuTightSize"
    }
}
struct DropdownMenuTightSizeM: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var width = CGFloat(200.0)
    public var debugDescription: String {
        return "DropdownMenuTightSize"
    }
}
struct DropdownMenuTightSizeS: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    var width = CGFloat(160.0)
    public var debugDescription: String {
        return "DropdownMenuTightSize"
    }
}
struct DropdownMenuTightSizeXl: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    var width = CGFloat(200.0)
    public var debugDescription: String {
        return "DropdownMenuTightSize"
    }
}
struct DropdownMenuTightSizeXs: DropdownMenuSizeConfiguration {
    var offset = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    var width = CGFloat(160.0)
    public var debugDescription: String {
        return "DropdownMenuTightSize"
    }
}

struct DropdownMenuTightAnySize: DropdownMenuSizeConfiguration {
    var offset = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer
    var width = CGFloat(0)

    init(size: DropdownMenuSizeConfiguration) {
        self.offset = size.offset
        self.shape = size.shape
        self.width = size.width
    }
    var debugDescription: String {
        return "DropdownMenuTightAnySize"
    }
}
