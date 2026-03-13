import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectSingleNormalSize {
    static let l = SelectSingleNormalSizeL()
    static let m = SelectSingleNormalSizeM()
    static let s = SelectSingleNormalSizeS()
    static let xl = SelectSingleNormalSizeXl()
    static let xs = SelectSingleNormalSizeXs()

    static let all: [SelectSizeConfiguration] = [
        SelectSingleNormalSize.l,
        SelectSingleNormalSize.m,
        SelectSingleNormalSize.s,
        SelectSingleNormalSize.xl,
        SelectSingleNormalSize.xs,
    ] 
}
struct SelectSingleNormalSizeL: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleNormalSize"
    }
}
struct SelectSingleNormalSizeM: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleNormalSize"
    }
}
struct SelectSingleNormalSizeS: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleNormalSize"
    }
}
struct SelectSingleNormalSizeXl: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleNormalSize"
    }
}
struct SelectSingleNormalSizeXs: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectSingleNormalSize"
    }
}

struct SelectSingleNormalAnySize: SelectSizeConfiguration {

    init(size: SelectSizeConfiguration) {
    }
    var debugDescription: String {
        return "SelectSingleNormalAnySize"
    }
}
