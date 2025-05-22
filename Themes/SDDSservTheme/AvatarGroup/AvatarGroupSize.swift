import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AvatarGroupSize {
    static let s = AvatarGroupSizeS()

    static let all: [AvatarGroupSizeConfiguration] = [
        AvatarGroupSize.s,
    ] 
}
struct AvatarGroupSizeS: AvatarGroupSizeConfiguration {
    var borderWidth = CGFloat(2.0)
    var maxDisplayingAvatarCount = Int(0)
    var spacing = CGFloat(16.0)
    public var debugDescription: String {
        return "AvatarGroupSize"
    }
}

struct AvatarGroupAnySize: AvatarGroupSizeConfiguration {
    var borderWidth = CGFloat(0)
    var maxDisplayingAvatarCount = Int(0)
    var spacing = CGFloat(0)

    init(size: AvatarGroupSizeConfiguration) {
        self.borderWidth = size.borderWidth
        self.maxDisplayingAvatarCount = size.maxDisplayingAvatarCount
        self.spacing = size.spacing
    }
    var debugDescription: String {
        return "AvatarGroupAnySize"
    }
}
