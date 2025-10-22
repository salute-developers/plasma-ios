import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NavigationBarInternalPageSizeConfiguration` определяет размеры и отступы компонента NavigationBarInternalPage.
 */
public protocol NavigationBarInternalPageSizeConfiguration {
    var backIconMargin: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var horizontalSpacing: CGFloat { get }
    var textBlockTopMargin: CGFloat { get }
    var bottomShape: PathDrawer { get }
}

/**
 Базовая реализация `NavigationBarInternalPageSizeConfiguration`.
 */
public struct NavigationBarInternalPageSize: NavigationBarInternalPageSizeConfiguration {
    public let backIconMargin: CGFloat
    public let paddingStart: CGFloat
    public let paddingEnd: CGFloat
    public let paddingTop: CGFloat
    public let paddingBottom: CGFloat
    public let horizontalSpacing: CGFloat
    public let textBlockTopMargin: CGFloat
    public let bottomShape: PathDrawer
    
    public init(
        backIconMargin: CGFloat = 0,
        paddingStart: CGFloat = 0,
        paddingEnd: CGFloat = 0,
        paddingTop: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        horizontalSpacing: CGFloat = 0,
        textBlockTopMargin: CGFloat = 0,
        bottomShape: PathDrawer = DefaultPathDrawer()
    ) {
        self.backIconMargin = backIconMargin
        self.paddingStart = paddingStart
        self.paddingEnd = paddingEnd
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.horizontalSpacing = horizontalSpacing
        self.textBlockTopMargin = textBlockTopMargin
        self.bottomShape = bottomShape
    }
}

