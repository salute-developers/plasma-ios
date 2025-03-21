import Foundation
import SwiftUI

public protocol PathDrawer: AnyObject {
    func path(in rect: CGRect) -> Path
}
