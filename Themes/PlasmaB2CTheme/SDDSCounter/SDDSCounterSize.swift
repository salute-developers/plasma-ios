import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SDDSCounterSize {
    static let l = SDDSCounterSizeL()
    static let m = SDDSCounterSizeM()
    static let s = SDDSCounterSizeS()
    static let xs = SDDSCounterSizeXs()
    static let xxs = SDDSCounterSizeXxs()

    static let all: [CounterSizeConfiguration] = [
        SDDSCounterSize.l,
        SDDSCounterSize.m,
        SDDSCounterSize.s,
        SDDSCounterSize.xs,
        SDDSCounterSize.xxs,
    ] 
}
struct SDDSCounterSizeL: CounterSizeConfiguration {
    var height = CGFloat(28.0)
    var paddings = EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0)
    var width = CGFloat(28.0)
    public var debugDescription: String {
        return "SDDSCounterSize"
    }
}
struct SDDSCounterSizeM: CounterSizeConfiguration {
    var height = CGFloat(24.0)
    var paddings = EdgeInsets(top: 5.0, leading: 8.0, bottom: 5.0, trailing: 8.0)
    var width = CGFloat(24.0)
    public var debugDescription: String {
        return "SDDSCounterSize"
    }
}
struct SDDSCounterSizeS: CounterSizeConfiguration {
    var height = CGFloat(20.0)
    var paddings = EdgeInsets(top: 4.0, leading: 6.0, bottom: 4.0, trailing: 6.0)
    var width = CGFloat(20.0)
    public var debugDescription: String {
        return "SDDSCounterSize"
    }
}
struct SDDSCounterSizeXs: CounterSizeConfiguration {
    var height = CGFloat(16.0)
    var paddings = EdgeInsets(top: 1.5, leading: 4.0, bottom: 2.5, trailing: 4.0)
    var width = CGFloat(16.0)
    public var debugDescription: String {
        return "SDDSCounterSize"
    }
}
struct SDDSCounterSizeXxs: CounterSizeConfiguration {
    var height = CGFloat(12.0)
    var paddings = EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0)
    var width = CGFloat(12.0)
    public var debugDescription: String {
        return "SDDSCounterSize"
    }
}

struct SDDSCounterAnySize: CounterSizeConfiguration {
    var height = CGFloat(0)
    var paddings = EdgeInsets()
    var width = CGFloat(0)

    init(size: CounterSizeConfiguration) {
        self.height = size.height
        self.paddings = size.paddings
        self.width = size.width
    }
    var debugDescription: String {
        return "SDDSCounterAnySize"
    }
}
