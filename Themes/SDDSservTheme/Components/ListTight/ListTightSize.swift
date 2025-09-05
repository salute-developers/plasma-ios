import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListTightSize {
    static let l = ListTightSizeL()
    static let m = ListTightSizeM()
    static let s = ListTightSizeS()
    static let xl = ListTightSizeXl()
    static let xs = ListTightSizeXs()

    static let all: [ListSizeConfiguration] = [
        ListTightSize.l,
        ListTightSize.m,
        ListTightSize.s,
        ListTightSize.xl,
        ListTightSize.xs,
    ] 
}
struct ListTightSizeL: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeM: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeS: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeXl: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeXs: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListTightSize"
    }
}

struct ListTightAnySize: ListSizeConfiguration {

    init(size: ListSizeConfiguration) {
    }
    var debugDescription: String {
        return "ListTightAnySize"
    }
}
