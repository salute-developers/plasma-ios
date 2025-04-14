import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AvatarGroupSize {
    static let s = AvatarGroupSizeS()

    static let all: [AvatarSizeConfiguration] = [
        AvatarGroupSize.s,
    ] 
}
struct AvatarGroupSizeS: AvatarSizeConfiguration {
    var itemOffset = CGFloat(16.0)
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AvatarGroupSize"
    }
}

struct AvatarGroupAnySize: AvatarSizeConfiguration {
    var itemOffset = CGFloat(0)
    var itemSpacing = CGFloat(0)

    init(size: AvatarSizeConfiguration) {
        self.itemOffset = size.itemOffset
        self.itemSpacing = size.itemSpacing
    }
    var debugDescription: String {
        return "AvatarGroupAnySize"
    }
}
