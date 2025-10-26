import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NoteSizeConfiguration` определяет размеры и отступы компонента Note.
 */
public protocol NoteSizeConfiguration {
    var shape: PathDrawer { get }
    var titlePaddingEnd: CGFloat { get }
    var iconSize: CGFloat { get }
    var contentBeforeEndMargin: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var textTopMargin: CGFloat { get }
    var actionTopMargin: CGFloat { get }
    var closeTopMargin: CGFloat { get }
    var closeEndMargin: CGFloat { get }
    var closeSize: CGFloat { get }
    var contentBeforeArrangement: NoteContentBeforeArrangement { get }
}

/**
 Базовая реализация `NoteSizeConfiguration`.
 */
public struct NoteSize: NoteSizeConfiguration {
    public let shape: PathDrawer
    public let titlePaddingEnd: CGFloat
    public let iconSize: CGFloat
    public let contentBeforeEndMargin: CGFloat
    public let paddingStart: CGFloat
    public let paddingTop: CGFloat
    public let paddingEnd: CGFloat
    public let paddingBottom: CGFloat
    public let textTopMargin: CGFloat
    public let actionTopMargin: CGFloat
    public let closeTopMargin: CGFloat
    public let closeEndMargin: CGFloat
    public let closeSize: CGFloat
    public let contentBeforeArrangement: NoteContentBeforeArrangement
    
    public init(
        shape: PathDrawer = DefaultPathDrawer(),
        titlePaddingEnd: CGFloat = 0,
        iconSize: CGFloat = 0,
        contentBeforeEndMargin: CGFloat = 0,
        paddingStart: CGFloat = 0,
        paddingTop: CGFloat = 0,
        paddingEnd: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        textTopMargin: CGFloat = 0,
        actionTopMargin: CGFloat = 0,
        closeTopMargin: CGFloat = 0,
        closeEndMargin: CGFloat = 0,
        closeSize: CGFloat = 0,
        contentBeforeArrangement: NoteContentBeforeArrangement = .top
    ) {
        self.shape = shape
        self.titlePaddingEnd = titlePaddingEnd
        self.iconSize = iconSize
        self.contentBeforeEndMargin = contentBeforeEndMargin
        self.paddingStart = paddingStart
        self.paddingTop = paddingTop
        self.paddingEnd = paddingEnd
        self.paddingBottom = paddingBottom
        self.textTopMargin = textTopMargin
        self.actionTopMargin = actionTopMargin
        self.closeTopMargin = closeTopMargin
        self.closeEndMargin = closeEndMargin
        self.closeSize = closeSize
        self.contentBeforeArrangement = contentBeforeArrangement
    }
}
