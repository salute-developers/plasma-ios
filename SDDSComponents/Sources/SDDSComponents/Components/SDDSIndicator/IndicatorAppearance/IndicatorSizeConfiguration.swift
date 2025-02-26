import SwiftUI
import Foundation
import SDDSThemeCore

public protocol IndicatorSizeConfiguration {
    var height: CGFloat { get }
    var width: CGFloat { get }
    func path(in rect: CGRect) -> Path
}

struct DefaultIndicatorSize: IndicatorSizeConfiguration {
    var height: CGFloat = 0
    var width: CGFloat = 0
    func path(in rect: CGRect) -> Path {
        Path()
    }
    
    init() {}
}
