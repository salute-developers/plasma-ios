import Foundation
import SwiftUI

public enum Spacing {
    public static let two: CGFloat = 2
    public static let four: CGFloat = 4
    public static let five: CGFloat = 5
    public static let six: CGFloat = 6
    public static let eight: CGFloat = 8
    public static let ten: CGFloat = 10
    public static let eleven: CGFloat = 11
    public static let twelve: CGFloat = 12
    public static let fourteen: CGFloat = 14
    public static let sixteen: CGFloat = 16
    public static let twenty: CGFloat = 20
    public static let twentyTwo: CGFloat = 22
    public static let twentyFour: CGFloat = 24
    public static let thirtyTwo: CGFloat = 32
    public static let fourty: CGFloat = 40
    public static let fourtyEight: CGFloat = 48
    public static let fiftySix: CGFloat = 56

    public enum Button {
        public static let previewWidth: CGFloat = 200
        
        public enum Height {
            public static let large: CGFloat = Spacing.fiftySix
            public static let medium: CGFloat = Spacing.fourtyEight
            public static let small: CGFloat = Spacing.fourty
            public static let extraSmall: CGFloat = Spacing.thirtyTwo
            public static let extraExtraSmall: CGFloat = Spacing.twentyFour
        }

        public enum CornerRadius {
            public static let large: CGFloat = Spacing.fourteen
            public static let medium: CGFloat = Spacing.twelve
            public static let small: CGFloat = Spacing.ten
            public static let extraSmall: CGFloat = Spacing.eight
            public static let extraExtraSmall: CGFloat = Spacing.six
        }
        
        public enum Padding {
            public static let large = EdgeInsets(top: Spacing.eleven, leading: Spacing.twentyTwo, bottom: Spacing.eleven, trailing: Spacing.twentyFour)
            public static let medium = EdgeInsets(top: Spacing.eleven, leading: Spacing.twenty, bottom: Spacing.eleven, trailing: Spacing.twenty)
            public static let small = EdgeInsets(top: Spacing.eleven, leading: Spacing.sixteen, bottom: Spacing.eleven, trailing: Spacing.sixteen)
            public static let extraSmall = EdgeInsets(top: Spacing.eleven, leading: Spacing.twelve, bottom: Spacing.eleven, trailing: Spacing.twelve)
            public static let extraExtraSmall = EdgeInsets(top: Spacing.five, leading: Spacing.ten, bottom: Spacing.five, trailing: Spacing.ten)
        }
        
        public enum IconSize {
            public static let large = CGSize(width: Spacing.twentyFour, height: Spacing.twentyFour)
            public static let medium = CGSize(width: Spacing.twentyFour, height: Spacing.twentyFour)
            public static let small = CGSize(width: Spacing.twentyFour, height: Spacing.twentyFour)
            public static let extraSmall = CGSize(width: Spacing.sixteen, height: Spacing.sixteen)
            public static let extraExtraSmall = CGSize(width: Spacing.sixteen, height: Spacing.sixteen)
        }
        
        public enum SpinnerSize {
            public static let large = CGSize(width: Spacing.twentyTwo, height: Spacing.twentyTwo)
            public static let medium = CGSize(width: Spacing.twentyTwo, height: Spacing.twentyTwo)
            public static let small = CGSize(width: Spacing.twentyTwo, height: Spacing.twentyTwo)
            public static let extraSmall = CGSize(width: Spacing.sixteen, height: Spacing.sixteen)
            public static let extraExtraSmall = CGSize(width: Spacing.twelve, height: Spacing.twelve)
        }
        
        public enum Gap {
            public static let large: CGFloat = Spacing.eight
            public static let medium: CGFloat = Spacing.six
            public static let small: CGFloat = Spacing.four
            public static let extraSmall: CGFloat = Spacing.two
        }
    }
}

public extension EdgeInsets {
    var zeroLateral: EdgeInsets {
        return EdgeInsets(top: top, leading: 0, bottom: bottom, trailing: 0)
    }
}
