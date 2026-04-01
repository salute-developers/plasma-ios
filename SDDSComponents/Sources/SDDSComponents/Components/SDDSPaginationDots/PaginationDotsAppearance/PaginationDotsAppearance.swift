import Foundation
import SwiftUI
import SDDSThemeCore

public struct PaginationDotsAppearance {
    public var size: PaginationDotsSizeConfiguration = DefaultPaginationDotsSize()
    public var dotBackgroundColor: ColorToken = .clearColor
    public var dotBackgroundColorActivated: ColorToken = .clearColor
    
    public init() {}
}

extension PaginationDotsAppearance: EnvironmentKey {
    public static var defaultValue: PaginationDotsAppearance {
        EnvironmentValueProvider.shared.value(forKey: PaginationDotsAppearance.self, fallback: PaginationDotsAppearance())
    }
}
