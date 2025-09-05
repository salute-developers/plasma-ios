import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuListTightSize {
    static let l = DropdownMenuListTightSizeL()
    static let m = DropdownMenuListTightSizeM()
    static let s = DropdownMenuListTightSizeS()
    static let xs = DropdownMenuListTightSizeXs()

    static let all: [ListSizeConfiguration] = [
        DropdownMenuListTightSize.l,
        DropdownMenuListTightSize.m,
        DropdownMenuListTightSize.s,
        DropdownMenuListTightSize.xs,
    ] 
}
struct DropdownMenuListTightSizeL: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListTightSize"
    }
}
struct DropdownMenuListTightSizeM: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListTightSize"
    }
}
struct DropdownMenuListTightSizeS: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListTightSize"
    }
}
struct DropdownMenuListTightSizeXs: ListSizeConfiguration {
    public var debugDescription: String {
        return "DropdownMenuListTightSize"
    }
}

struct DropdownMenuListTightAnySize: ListSizeConfiguration {

    init(size: ListSizeConfiguration) {
    }
    var debugDescription: String {
        return "DropdownMenuListTightAnySize"
    }
}
