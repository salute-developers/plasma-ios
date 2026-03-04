import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EditableSize {
    static let bodyL = EditableSizeBodyl()
    static let bodyM = EditableSizeBodym()
    static let bodyS = EditableSizeBodys()
    static let bodyXs = EditableSizeBodyxs()
    static let bodyXxs = EditableSizeBodyxxs()
    static let h1 = EditableSizeH1()
    static let h2 = EditableSizeH2()
    static let h3 = EditableSizeH3()
    static let h4 = EditableSizeH4()
    static let h5 = EditableSizeH5()

    static let all: [EditableSizeConfiguration] = [
        EditableSize.bodyL,
        EditableSize.bodyM,
        EditableSize.bodyS,
        EditableSize.bodyXs,
        EditableSize.bodyXxs,
        EditableSize.h1,
        EditableSize.h2,
        EditableSize.h3,
        EditableSize.h4,
        EditableSize.h5,
    ] 
}
struct EditableSizeBodyl: EditableSizeConfiguration {
    var iconMargin = CGFloat(6.0)
    var iconSize = CGFloat(22.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeBodym: EditableSizeConfiguration {
    var iconMargin = CGFloat(6.0)
    var iconSize = CGFloat(20.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeBodys: EditableSizeConfiguration {
    var iconMargin = CGFloat(2.0)
    var iconSize = CGFloat(18.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeBodyxs: EditableSizeConfiguration {
    var iconMargin = CGFloat(2.0)
    var iconSize = CGFloat(14.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeBodyxxs: EditableSizeConfiguration {
    var iconMargin = CGFloat(2.0)
    var iconSize = CGFloat(12.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeH1: EditableSizeConfiguration {
    var iconMargin = CGFloat(8.0)
    var iconSize = CGFloat(52.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeH2: EditableSizeConfiguration {
    var iconMargin = CGFloat(8.0)
    var iconSize = CGFloat(36.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeH3: EditableSizeConfiguration {
    var iconMargin = CGFloat(6.0)
    var iconSize = CGFloat(30.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeH4: EditableSizeConfiguration {
    var iconMargin = CGFloat(6.0)
    var iconSize = CGFloat(26.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}
struct EditableSizeH5: EditableSizeConfiguration {
    var iconMargin = CGFloat(6.0)
    var iconSize = CGFloat(24.0)
    public var debugDescription: String {
        return "EditableSize"
    }
}

struct EditableAnySize: EditableSizeConfiguration {
    var iconMargin = CGFloat(0)
    var iconSize = CGFloat(0)

    init(size: EditableSizeConfiguration) {
        self.iconMargin = size.iconMargin
        self.iconSize = size.iconSize
    }
    var debugDescription: String {
        return "EditableAnySize"
    }
}
