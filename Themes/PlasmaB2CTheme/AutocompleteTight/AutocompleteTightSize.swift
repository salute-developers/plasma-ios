import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AutocompleteTightSize {
    static let l = AutocompleteTightSizeL()
    static let m = AutocompleteTightSizeM()
    static let s = AutocompleteTightSizeS()
    static let xl = AutocompleteTightSizeXl()
    static let xs = AutocompleteTightSizeXs()

    static let all: [AutocompleteSizeConfiguration] = [
        AutocompleteTightSize.l,
        AutocompleteTightSize.m,
        AutocompleteTightSize.s,
        AutocompleteTightSize.xl,
        AutocompleteTightSize.xs,
    ] 
}
struct AutocompleteTightSizeL: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteTightSize"
    }
}
struct AutocompleteTightSizeM: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteTightSize"
    }
}
struct AutocompleteTightSizeS: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteTightSize"
    }
}
struct AutocompleteTightSizeXl: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteTightSize"
    }
}
struct AutocompleteTightSizeXs: AutocompleteSizeConfiguration {
    public var debugDescription: String {
        return "AutocompleteTightSize"
    }
}

struct AutocompleteTightAnySize: AutocompleteSizeConfiguration {

    init(size: AutocompleteSizeConfiguration) {
    }
    var debugDescription: String {
        return "AutocompleteTightAnySize"
    }
}
