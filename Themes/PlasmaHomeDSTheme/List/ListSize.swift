import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListSize {
    static let s = ListSizeS()

    static let all: [ListSizeConfiguration] = [
        ListSize.s,
    ] 
}
struct ListSizeS: ListSizeConfiguration {
    public var debugDescription: String {
        return "ListSize"
    }
}

struct ListAnySize: ListSizeConfiguration {

    init(size: ListSizeConfiguration) {
    }
    var debugDescription: String {
        return "ListAnySize"
    }
}
