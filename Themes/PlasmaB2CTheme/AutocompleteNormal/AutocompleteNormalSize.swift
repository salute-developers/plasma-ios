import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AutocompleteNormalSize {
    static let l = AutocompleteNormalSizeL()
    static let m = AutocompleteNormalSizeM()
    static let s = AutocompleteNormalSizeS()
    static let xl = AutocompleteNormalSizeXl()
    static let xs = AutocompleteNormalSizeXs()

    static let all: [AutocompleteSizeConfiguration] = [
        AutocompleteNormalSize.l,
        AutocompleteNormalSize.m,
        AutocompleteNormalSize.s,
        AutocompleteNormalSize.xl,
        AutocompleteNormalSize.xs,
    ] 
}
struct AutocompleteNormalSizeL: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteNormalSize"
    }
}
struct AutocompleteNormalSizeM: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteNormalSize"
    }
}
struct AutocompleteNormalSizeS: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteNormalSize"
    }
}
struct AutocompleteNormalSizeXl: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteNormalSize"
    }
}
struct AutocompleteNormalSizeXs: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteNormalSize"
    }
}

struct AutocompleteNormalAnySize: AutocompleteSizeConfiguration {

    init(size: AutocompleteSizeConfiguration) {
    }
    var debugDescription: String {
        return "AutocompleteNormalAnySize"
    }
}
