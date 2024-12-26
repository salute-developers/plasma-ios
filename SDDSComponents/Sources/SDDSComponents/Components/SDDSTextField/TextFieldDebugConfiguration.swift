import Foundation
import SwiftUI

struct TextFieldDebugConfiguration {
    let isEnabled: Bool
    let textField: Bool
    let title: Bool
    let titleBottomPadding: Bool
    let innerTitle: Bool
    let innerTitleBottomPadding: Bool
    let caption: Bool
    let captionTopPadding: Bool
    let fieldView: Bool
    let boxLeadingPadding: Bool
    let boxTrailingPadding: Bool
    let placeholder: Bool
    let icon: Bool
    let iconPadding: Bool
    let iconAction: Bool
    let iconActionPadding: Bool
    let indicatorView: Bool
    let indicatorPadding: Bool
    let indicatorYOffset: Bool
    let fieldHeight: Bool

    init(
        isEnabled: Bool = false,
        textField: Bool = false,
        title: Bool = false,
        titleBottomPadding: Bool = false,
        innerTitle: Bool = false,
        innerTitleBottomPadding: Bool = false,
        caption: Bool = false,
        captionTopPadding: Bool = false,
        fieldView: Bool = false,
        boxLeadingPadding: Bool = false,
        boxTrailingPadding: Bool = false,
        placeholder: Bool = false,
        icon: Bool = false,
        iconPadding: Bool = false,
        iconAction: Bool = false,
        iconActionPadding: Bool = false,
        indicatorView: Bool = false,
        indicatorPadding: Bool = false,
        indicatorYOffset: Bool = false,
        fieldHeight: Bool = false
    ) {
        self.isEnabled = isEnabled
        self.textField = textField
        self.title = title
        self.titleBottomPadding = titleBottomPadding
        self.innerTitle = innerTitle
        self.innerTitleBottomPadding = innerTitleBottomPadding
        self.caption = caption
        self.captionTopPadding = captionTopPadding
        self.fieldView = fieldView
        self.boxLeadingPadding = boxLeadingPadding
        self.boxTrailingPadding = boxTrailingPadding
        self.placeholder = placeholder
        self.icon = icon
        self.iconPadding = iconPadding
        self.iconAction = iconAction
        self.iconActionPadding = iconActionPadding
        self.indicatorView = indicatorView
        self.indicatorPadding = indicatorPadding
        self.indicatorYOffset = indicatorYOffset
        self.fieldHeight = fieldHeight
    }
}
