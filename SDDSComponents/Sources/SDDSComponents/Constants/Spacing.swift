import Foundation
import SwiftUI

enum Spacing {
    static let two: CGFloat = 2
    static let four: CGFloat = 4
    static let five: CGFloat = 5
    static let six: CGFloat = 6
    static let eight: CGFloat = 8
    static let ten: CGFloat = 10
    static let eleven: CGFloat = 11
    static let twelve: CGFloat = 12
    static let fourteen: CGFloat = 14
    static let sixteen: CGFloat = 16
    static let twenty: CGFloat = 20
    static let twentyTwo: CGFloat = 22
    static let twentyFour: CGFloat = 24
    static let thirtyTwo: CGFloat = 32
    static let fourty: CGFloat = 40
    static let fourtyEight: CGFloat = 48
    static let fiftySix: CGFloat = 56

    enum Button {
        static let previewWidth: CGFloat = 200
        
        enum Height {
            static let large: CGFloat = Spacing.fiftySix
            static let medium: CGFloat = Spacing.fourtyEight
            static let small: CGFloat = Spacing.fourty
            static let extraSmall: CGFloat = Spacing.thirtyTwo
            static let extraExtraSmall: CGFloat = Spacing.twentyFour
        }

        enum CornerRadius {
            static let large: CGFloat = Spacing.fourteen
            static let medium: CGFloat = Spacing.twelve
            static let small: CGFloat = Spacing.ten
            static let extraSmall: CGFloat = Spacing.eight
            static let extraExtraSmall: CGFloat = Spacing.six
        }
        
        enum Padding {
            static let large = EdgeInsets(top: Spacing.eleven, leading: Spacing.twentyTwo, bottom: Spacing.eleven, trailing: Spacing.twentyFour)
            static let medium = EdgeInsets(top: Spacing.eleven, leading: Spacing.twenty, bottom: Spacing.eleven, trailing: Spacing.twenty)
            static let small = EdgeInsets(top: Spacing.eleven, leading: Spacing.sixteen, bottom: Spacing.eleven, trailing: Spacing.sixteen)
            static let extraSmall = EdgeInsets(top: Spacing.eleven, leading: Spacing.twelve, bottom: Spacing.eleven, trailing: Spacing.twelve)
            static let extraExtraSmall = EdgeInsets(top: Spacing.five, leading: Spacing.ten, bottom: Spacing.five, trailing: Spacing.ten)
        }
        
        enum IconSize {
            static let large = CGSize(width: Spacing.twentyFour, height: Spacing.twentyFour)
            static let medium = CGSize(width: Spacing.twentyFour, height: Spacing.twentyFour)
            static let small = CGSize(width: Spacing.twentyFour, height: Spacing.twentyFour)
            static let extraSmall = CGSize(width: Spacing.sixteen, height: Spacing.sixteen)
            static let extraExtraSmall = CGSize(width: Spacing.sixteen, height: Spacing.sixteen)
        }
        
        enum SpinnerSize {
            static let large = CGSize(width: Spacing.twentyTwo, height: Spacing.twentyTwo)
            static let medium = CGSize(width: Spacing.twentyTwo, height: Spacing.twentyTwo)
            static let small = CGSize(width: Spacing.twentyTwo, height: Spacing.twentyTwo)
            static let extraSmall = CGSize(width: Spacing.sixteen, height: Spacing.sixteen)
            static let extraExtraSmall = CGSize(width: Spacing.twelve, height: Spacing.twelve)
        }
        
        enum Gap {
            static let large: CGFloat = Spacing.eight
            static let medium: CGFloat = Spacing.six
            static let small: CGFloat = Spacing.four
            static let extraSmall: CGFloat = Spacing.two
        }
    }
}

extension EdgeInsets {
    var zeroLateral: EdgeInsets {
        return EdgeInsets(top: top, leading: 0, bottom: bottom, trailing: 0)
    }
}
