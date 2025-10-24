import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NavigationBarMainPageSizeConfiguration` определяет размеры и отступы компонента NavigationBarMainPage.
 */
public protocol NavigationBarMainPageSizeConfiguration {
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var horizontalSpacing: CGFloat { get }
    var textBlockTopMargin: CGFloat { get }
    var bottomShape: PathDrawer { get }
}

/**
 Базовая реализация `NavigationBarMainPageSizeConfiguration`.
 */
public struct NavigationBarMainPageSize: NavigationBarMainPageSizeConfiguration {
    public let paddingStart: CGFloat
    public let paddingEnd: CGFloat
    public let paddingTop: CGFloat
    public let paddingBottom: CGFloat
    public let horizontalSpacing: CGFloat
    public let textBlockTopMargin: CGFloat
    public let bottomShape: PathDrawer
    
    public init(
        paddingStart: CGFloat = 0,
        paddingEnd: CGFloat = 0,
        paddingTop: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        horizontalSpacing: CGFloat = 0,
        textBlockTopMargin: CGFloat = 0,
        bottomShape: PathDrawer = DefaultPathDrawer()
    ) {
        self.paddingStart = paddingStart
        self.paddingEnd = paddingEnd
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.horizontalSpacing = horizontalSpacing
        self.textBlockTopMargin = textBlockTopMargin
        self.bottomShape = bottomShape
    }
}

