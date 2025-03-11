import Foundation
import SDDSComponents
import SwiftUI

extension EnvironmentValueProvider {
    func initialize() {
        print("Values Avatar and Counter initialized...")
        self.set(value: Avatar.m.default.appearance, forKey: AvatarAppearance.self)
        self.set(value: Counter.m.default.appearance, forKey: CounterAppearance.self)
    }
}
