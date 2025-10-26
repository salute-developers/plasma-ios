import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NoteCompactSizeConfiguration` определяет размеры и отступы компонента NoteCompact.
 */
public protocol NoteCompactSizeConfiguration {
    var shape: PathDrawer { get }
    var iconSize: CGFloat { get }
    var contentBeforeEndMargin: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var textTopMargin: CGFloat { get }
    var actionStartMargin: CGFloat { get }
    var actionEndMargin: CGFloat { get }
    var closeStartMargin: CGFloat { get }
    var closeSize: CGFloat { get }
    var contentBeforeArrangement: NoteCompactContentBeforeArrangement { get }
}

/**
 Базовая реализация `NoteCompactSizeConfiguration`.
 */
public struct NoteCompactSize: NoteCompactSizeConfiguration {
    public let shape: PathDrawer
    public let iconSize: CGFloat
    public let contentBeforeEndMargin: CGFloat
    public let paddingStart: CGFloat
    public let paddingTop: CGFloat
    public let paddingEnd: CGFloat
    public let paddingBottom: CGFloat
    public let textTopMargin: CGFloat
    public let actionStartMargin: CGFloat
    public let actionEndMargin: CGFloat
    public let closeStartMargin: CGFloat
    public let closeSize: CGFloat
    public let contentBeforeArrangement: NoteCompactContentBeforeArrangement
    
    public init(
        shape: PathDrawer = DefaultPathDrawer(),
        iconSize: CGFloat = 0,
        contentBeforeEndMargin: CGFloat = 0,
        paddingStart: CGFloat = 0,
        paddingTop: CGFloat = 0,
        paddingEnd: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        textTopMargin: CGFloat = 0,
        actionStartMargin: CGFloat = 0,
        actionEndMargin: CGFloat = 0,
        closeStartMargin: CGFloat = 0,
        closeSize: CGFloat = 0,
        contentBeforeArrangement: NoteCompactContentBeforeArrangement = .top
    ) {
        self.shape = shape
        self.iconSize = iconSize
        self.contentBeforeEndMargin = contentBeforeEndMargin
        self.paddingStart = paddingStart
        self.paddingTop = paddingTop
        self.paddingEnd = paddingEnd
        self.paddingBottom = paddingBottom
        self.textTopMargin = textTopMargin
        self.actionStartMargin = actionStartMargin
        self.actionEndMargin = actionEndMargin
        self.closeStartMargin = closeStartMargin
        self.closeSize = closeSize
        self.contentBeforeArrangement = contentBeforeArrangement
    }
}
