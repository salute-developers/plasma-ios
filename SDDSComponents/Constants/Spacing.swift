import Foundation
import SwiftUI

enum Spacing {
    static let four: CGFloat = 4
    static let eight: CGFloat = 8
    static let ten: CGFloat = 10
    static let eleven: CGFloat = 11
    static let twelve: CGFloat = 12
    static let sixteen: CGFloat = 16
    static let twenty: CGFloat = 20
    static let twentyTwo: CGFloat = 22
    static let twentyFour: CGFloat = 24
    static let five: CGFloat = 5
    static let fourty: CGFloat = 40

    enum Button {
        enum Height {
            static let large: CGFloat = 56
            static let medium: CGFloat = 48
            static let small: CGFloat = 40
            static let xs: CGFloat = 32
            static let xxs: CGFloat = 24
        }

        enum CornerRadius {
            static let large: CGFloat = 14
            static let medium: CGFloat = 12
            static let small: CGFloat = 10
            static let xs: CGFloat = 8
            static let xxs: CGFloat = 6
        }
        
        enum Padding {
            static let large = EdgeInsets(top: Spacing.eleven, leading: Spacing.twentyTwo, bottom: Spacing.eleven, trailing: Spacing.twentyFour)
            static let medium = EdgeInsets(top: Spacing.eleven, leading: Spacing.twenty, bottom: Spacing.eleven, trailing: Spacing.twenty)
            static let small = EdgeInsets(top: Spacing.eleven, leading: Spacing.sixteen, bottom: Spacing.eleven, trailing: Spacing.sixteen)
            static let xs = EdgeInsets(top: Spacing.eleven, leading: Spacing.twelve, bottom: Spacing.eleven, trailing: Spacing.twelve)
            static let xxs = EdgeInsets(top: Spacing.five, leading: Spacing.ten, bottom: Spacing.five, trailing: Spacing.ten)
        }
        
        enum IconSize {
            static let large = CGSize(width: 24, height: 24)
            static let medium = CGSize(width: 24, height: 24)
            static let small = CGSize(width: 24, height: 24)
            static let xs = CGSize(width: 16, height: 16)
            static let xxs = CGSize(width: 16, height: 16)
        }
        
        enum SpinnerSize {
            static let large = CGSize(width: 22, height: 22)
            static let medium = CGSize(width: 22, height: 22)
            static let small = CGSize(width: 22, height: 22)
            static let xs = CGSize(width: 16, height: 16)
            static let xxs = CGSize(width: 12, height: 12)
        }
    }
}
