import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ModalSize {
    static let `default` = ModalSizeDefault()

    static let all: [ModalSizeConfiguration] = [
        ModalSize.`default`,
    ] 
}
struct ModalSizeDefault: ModalSizeConfiguration {
    var closeSize = CGFloat(24.0)
    var paddingBottom = CGFloat(32.0)
    var paddingEnd = CGFloat(32.0)
    var paddingStart = CGFloat(32.0)
    var paddingTop = CGFloat(32.0)
    var shadow = ShadowToken.downSoftL
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ModalSize"
    }
}

struct ModalAnySize: ModalSizeConfiguration {
    var closeSize = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shadow = ShadowToken()
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: ModalSizeConfiguration) {
        self.closeSize = size.closeSize
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shadow = size.shadow
        self.shape = size.shape
    }
    var debugDescription: String {
        return "ModalAnySize"
    }
}
