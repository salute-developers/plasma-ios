import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct RadioboxGroupSize {
    static let m = RadioboxGroupSizeM()
    static let s = RadioboxGroupSizeS()

    static let all: [RadioboxGroupSizeConfiguration] = [
        RadioboxGroupSize.m,
        RadioboxGroupSize.s,
    ] 
}
struct RadioboxGroupSizeM: RadioboxGroupSizeConfiguration {
    var verticalSpacing = CGFloat(12.0)
    public var debugDescription: String {
        return "RadioboxGroupSize"
    }
}
struct RadioboxGroupSizeS: RadioboxGroupSizeConfiguration {
    var verticalSpacing = CGFloat(10.0)
    public var debugDescription: String {
        return "RadioboxGroupSize"
    }
}

struct RadioboxGroupAnySize: RadioboxGroupSizeConfiguration {
    var verticalSpacing = CGFloat(0)

    init(size: RadioboxGroupSizeConfiguration) {
        self.verticalSpacing = size.verticalSpacing
    }
    var debugDescription: String {
        return "RadioboxGroupAnySize"
    }
}
