import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CheckboxGroupSize {
    static let m = CheckboxGroupSizeM()
    static let s = CheckboxGroupSizeS()

    static let all: [CheckboxGroupSizeConfiguration] = [
        CheckboxGroupSize.m,
        CheckboxGroupSize.s,
    ] 
}
struct CheckboxGroupSizeM: CheckboxGroupSizeConfiguration {
    var horizontalIndent = CGFloat(36.0)
    var verticalSpacing = CGFloat(12.0)
    public var debugDescription: String {
        return "CheckboxGroupSize"
    }
}
struct CheckboxGroupSizeS: CheckboxGroupSizeConfiguration {
    var horizontalIndent = CGFloat(24.0)
    var verticalSpacing = CGFloat(10.0)
    public var debugDescription: String {
        return "CheckboxGroupSize"
    }
}

struct CheckboxGroupAnySize: CheckboxGroupSizeConfiguration {
    var horizontalIndent = CGFloat(0)
    var verticalSpacing = CGFloat(0)

    init(size: CheckboxGroupSizeConfiguration) {
        self.horizontalIndent = size.horizontalIndent
        self.verticalSpacing = size.verticalSpacing
    }
    var debugDescription: String {
        return "CheckboxGroupAnySize"
    }
}
