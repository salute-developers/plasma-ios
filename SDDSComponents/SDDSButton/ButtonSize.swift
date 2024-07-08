import Foundation
import SwiftUI

public protocol ButtonSizeConfiguration: CustomDebugStringConvertible {
    var height: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var paddings: EdgeInsets { get }
    var iconSize: CGSize { get }
    var spinnerSize: CGSize { get }
}
