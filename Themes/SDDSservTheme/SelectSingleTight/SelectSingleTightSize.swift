import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectSingleTightSize {
    static let l = SelectSingleTightSizeL()
    static let m = SelectSingleTightSizeM()
    static let s = SelectSingleTightSizeS()
    static let xl = SelectSingleTightSizeXl()
    static let xs = SelectSingleTightSizeXs()

    static let all: [SelectSizeConfiguration] = [
        SelectSingleTightSize.l,
        SelectSingleTightSize.m,
        SelectSingleTightSize.s,
        SelectSingleTightSize.xl,
        SelectSingleTightSize.xs,
    ] 
}
struct SelectSingleTightSizeL: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleTightSize"
    }
}
struct SelectSingleTightSizeM: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleTightSize"
    }
}
struct SelectSingleTightSizeS: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleTightSize"
    }
}
struct SelectSingleTightSizeXl: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleTightSize"
    }
}
struct SelectSingleTightSizeXs: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleTightSize"
    }
}

struct SelectSingleTightAnySize: SelectSizeConfiguration {

    init(size: SelectSizeConfiguration) {
    }
    var debugDescription: String {
        return "SelectSingleTightAnySize"
    }
}
