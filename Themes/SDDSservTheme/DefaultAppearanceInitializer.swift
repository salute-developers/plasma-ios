import Foundation
import SDDSComponents
import SwiftUI

extension EnvironmentValueProvider {
    func initialize() {
        self.set(value: Avatar.m.default.appearance, forKey: AvatarAppearance.self)
        self.set(value: Counter.m.default.appearance, forKey: CounterAppearance.self)
        self.set(value: Badge.m.default.appearance, forKey: BadgeAppearance.self)
        self.set(value: BasicButton.m.default.appearance, forKey: ButtonAppearance.self)
        self.set(value: Cell.m.appearance, forKey: CellAppearance.self)
        self.set(value: Checkbox.m.default.appearance, forKey: CheckboxAppearance.self)
        self.set(value: Chip.m.default.appearance, forKey: ChipAppearance.self)
        self.set(value: ChipGroup.dense.appearance, forKey: ChipGroupAppearance.self)
        self.set(value: Indicator.m.default.appearance, forKey: IndicatorAppearance.self)
        self.set(value: ProgressBar.default.appearance, forKey: ProgressBarAppearance.self)
    }
}
