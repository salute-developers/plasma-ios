import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CellSize {
    static let l = CellSizeL()
    static let m = CellSizeM()
    static let s = CellSizeS()
    static let xs = CellSizeXs()

    static let all: [CellSizeConfiguration] = [
        CellSize.l,
        CellSize.m,
        CellSize.s,
        CellSize.xs,
    ] 
}
struct CellSizeL: CellSizeConfiguration {
    public var contentPaddingEnd = CGFloat(8.0)
    public var contentPaddingStart = CGFloat(8.0)
    public var debugDescription: String {
        return "CellSize"
    }
}
struct CellSizeM: CellSizeConfiguration {
    public var contentPaddingEnd = CGFloat(8.0)
    public var contentPaddingStart = CGFloat(8.0)
    public var debugDescription: String {
        return "CellSize"
    }
}
struct CellSizeS: CellSizeConfiguration {
    public var contentPaddingEnd = CGFloat(6.0)
    public var contentPaddingStart = CGFloat(6.0)
    public var debugDescription: String {
        return "CellSize"
    }
}
struct CellSizeXs: CellSizeConfiguration {
    public var contentPaddingEnd = CGFloat(6.0)
    public var contentPaddingStart = CGFloat(6.0)
    public var debugDescription: String {
        return "CellSize"
    }
}

struct CellAnySize: CellSizeConfiguration {
    public var contentPaddingEnd = CGFloat(0)
    public var contentPaddingStart = CGFloat(0)

    init(size: CellSizeConfiguration) {
        self.contentPaddingEnd = size.contentPaddingEnd
        self.contentPaddingStart = size.contentPaddingStart
    }
    var debugDescription: String {
        return "CellAnySize"
    }
}
