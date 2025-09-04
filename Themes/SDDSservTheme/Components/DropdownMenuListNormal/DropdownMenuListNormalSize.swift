import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuListNormalSize {
    static let l = DropdownMenuListNormalSizeL()
    static let m = DropdownMenuListNormalSizeM()
    static let s = DropdownMenuListNormalSizeS()
    static let xl = DropdownMenuListNormalSizeXl()
    static let xs = DropdownMenuListNormalSizeXs()

    static let all: [ListSizeConfiguration] = [
        DropdownMenuListNormalSize.l,
        DropdownMenuListNormalSize.m,
        DropdownMenuListNormalSize.s,
        DropdownMenuListNormalSize.xl,
        DropdownMenuListNormalSize.xs,
    ] 
}
struct DropdownMenuListNormalSizeL: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}
struct DropdownMenuListNormalSizeM: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}
struct DropdownMenuListNormalSizeS: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}
struct DropdownMenuListNormalSizeXl: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}
struct DropdownMenuListNormalSizeXs: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}

struct DropdownMenuListNormalAnySize: ListSizeConfiguration {

    init(size: ListSizeConfiguration) {
    }
    var debugDescription: String {
        return "DropdownMenuListNormalAnySize"
    }
}
