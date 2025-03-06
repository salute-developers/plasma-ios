import SwiftUI
import Foundation
import SDDSThemeCore

public protocol IndicatorSizeConfiguration {
    var height: CGFloat { get }
    var width: CGFloat { get }
    var pathDrawer: PathDrawer { get }
}

struct DefaultIndicatorSize: IndicatorSizeConfiguration {
    var height: CGFloat = 0
    var width: CGFloat = 0
    var pathDrawer: PathDrawer = DefaultPathDrawer()
    
    init() {}
}
