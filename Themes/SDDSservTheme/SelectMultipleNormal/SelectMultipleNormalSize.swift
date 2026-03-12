import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectMultipleNormalSize {
    static let l = SelectMultipleNormalSizeL()
    static let m = SelectMultipleNormalSizeM()
    static let s = SelectMultipleNormalSizeS()
    static let xl = SelectMultipleNormalSizeXl()
    static let xs = SelectMultipleNormalSizeXs()

    static let all: [SelectSizeConfiguration] = [
        SelectMultipleNormalSize.l,
        SelectMultipleNormalSize.m,
        SelectMultipleNormalSize.s,
        SelectMultipleNormalSize.xl,
        SelectMultipleNormalSize.xs,
    ] 
}
struct SelectMultipleNormalSizeL: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleNormalSize"
    }
}
struct SelectMultipleNormalSizeM: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleNormalSize"
    }
}
struct SelectMultipleNormalSizeS: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleNormalSize"
    }
}
struct SelectMultipleNormalSizeXl: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleNormalSize"
    }
}
struct SelectMultipleNormalSizeXs: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleNormalSize"
    }
}

struct SelectMultipleNormalAnySize: SelectSizeConfiguration {

    init(size: SelectSizeConfiguration) {
    }
    var debugDescription: String {
        return "SelectMultipleNormalAnySize"
    }
}
