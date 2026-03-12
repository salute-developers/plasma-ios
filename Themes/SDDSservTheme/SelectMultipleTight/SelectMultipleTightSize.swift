import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectMultipleTightSize {
    static let l = SelectMultipleTightSizeL()
    static let m = SelectMultipleTightSizeM()
    static let s = SelectMultipleTightSizeS()
    static let xl = SelectMultipleTightSizeXl()
    static let xs = SelectMultipleTightSizeXs()

    static let all: [SelectSizeConfiguration] = [
        SelectMultipleTightSize.l,
        SelectMultipleTightSize.m,
        SelectMultipleTightSize.s,
        SelectMultipleTightSize.xl,
        SelectMultipleTightSize.xs,
    ] 
}
struct SelectMultipleTightSizeL: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleTightSize"
    }
}
struct SelectMultipleTightSizeM: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleTightSize"
    }
}
struct SelectMultipleTightSizeS: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleTightSize"
    }
}
struct SelectMultipleTightSizeXl: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleTightSize"
    }
}
struct SelectMultipleTightSizeXs: SelectSizeConfiguration {
    public var debugDescription: String {
        return "SelectMultipleTightSize"
    }
}

struct SelectMultipleTightAnySize: SelectSizeConfiguration {

    init(size: SelectSizeConfiguration) {
    }
    var debugDescription: String {
        return "SelectMultipleTightAnySize"
    }
}
