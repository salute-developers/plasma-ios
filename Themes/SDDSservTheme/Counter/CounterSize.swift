import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CounterSize {
    static let l = CounterSizeL()
    static let m = CounterSizeM()
    static let s = CounterSizeS()
    static let xs = CounterSizeXs()
    static let xxs = CounterSizeXxs()

    static let all: [CounterSizeConfiguration] = [
        CounterSize.l,
        CounterSize.m,
        CounterSize.s,
        CounterSize.xs,
        CounterSize.xxs,
    ] 
}
struct CounterSizeL: CounterSizeConfiguration {
    var height = CGFloat(28.0)
    var paddings = EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0)
    var width = CGFloat(28.0)
    public var debugDescription: String {
        return "CounterSize"
    }
}
struct CounterSizeM: CounterSizeConfiguration {
    var height = CGFloat(24.0)
    var paddings = EdgeInsets(top: 5.0, leading: 8.0, bottom: 5.0, trailing: 8.0)
    var width = CGFloat(24.0)
    public var debugDescription: String {
        return "CounterSize"
    }
}
struct CounterSizeS: CounterSizeConfiguration {
    var height = CGFloat(20.0)
    var paddings = EdgeInsets(top: 4.0, leading: 6.0, bottom: 4.0, trailing: 6.0)
    var width = CGFloat(20.0)
    public var debugDescription: String {
        return "CounterSize"
    }
}
struct CounterSizeXs: CounterSizeConfiguration {
    var height = CGFloat(16.0)
    var paddings = EdgeInsets(top: 1.5, leading: 4.0, bottom: 2.5, trailing: 4.0)
    var width = CGFloat(16.0)
    public var debugDescription: String {
        return "CounterSize"
    }
}
struct CounterSizeXxs: CounterSizeConfiguration {
    var height = CGFloat(12.0)
    var paddings = EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 2.0)
    var width = CGFloat(12.0)
    public var debugDescription: String {
        return "CounterSize"
    }
}

struct CounterAnySize: CounterSizeConfiguration {
    var height = CGFloat(0)
    var paddings = EdgeInsets()
    var width = CGFloat(0)

    init(size: CounterSizeConfiguration) {
        self.height = size.height
        self.paddings = size.paddings
        self.width = size.width
    }
    var debugDescription: String {
        return "CounterAnySize"
    }
}
