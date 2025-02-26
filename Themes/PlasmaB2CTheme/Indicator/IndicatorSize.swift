import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IndicatorSize {
    static let l = IndicatorSizeL()
    static let m = IndicatorSizeM()
    static let s = IndicatorSizeS()

    static let all: [IndicatorSizeConfiguration] = [
        IndicatorSize.l,
        IndicatorSize.m,
        IndicatorSize.s,
    ] 
}
struct IndicatorSizeL: IndicatorSizeConfiguration {
    func path(in rect: CGRect) -> Path {
        PathDrawer.circle(in: rect)
    }  
    var height = CGFloat(12.0)
    var width = CGFloat(12.0)
    public var debugDescription: String {
        return "IndicatorSize"
    }
}
struct IndicatorSizeM: IndicatorSizeConfiguration {
    func path(in rect: CGRect) -> Path {
        PathDrawer.circle(in: rect)
    }  
    var height = CGFloat(8.0)
    var width = CGFloat(8.0)
    public var debugDescription: String {
        return "IndicatorSize"
    }
}
struct IndicatorSizeS: IndicatorSizeConfiguration {
    func path(in rect: CGRect) -> Path {
        PathDrawer.circle(in: rect)
    }  
    var height = CGFloat(6.0)
    var width = CGFloat(6.0)
    public var debugDescription: String {
        return "IndicatorSize"
    }
}

struct IndicatorAnySize: IndicatorSizeConfiguration {
    func path(in rect: CGRect) -> Path {
        return Path()
    }
    var height = CGFloat(0)
    var width = CGFloat(0)

    init(size: IndicatorSizeConfiguration) {
        self.height = size.height
        self.width = size.width
    }
    var debugDescription: String {
        return "IndicatorAnySize"
    }
}
