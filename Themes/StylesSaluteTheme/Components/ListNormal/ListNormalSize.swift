import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNormalSize {
    static let l = ListNormalSizeL()
    static let m = ListNormalSizeM()
    static let s = ListNormalSizeS()
    static let xl = ListNormalSizeXl()
    static let xs = ListNormalSizeXs()

    static let all: [ListSizeConfiguration] = [
        ListNormalSize.l,
        ListNormalSize.m,
        ListNormalSize.s,
        ListNormalSize.xl,
        ListNormalSize.xs,
    ] 
}
struct ListNormalSizeL: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeM: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeS: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeXl: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeXs: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListNormalSize"
    }
}

struct ListNormalAnySize: ListSizeConfiguration {

    init(size: ListSizeConfiguration) {
    }
    var debugDescription: String {
        return "ListNormalAnySize"
    }
}
