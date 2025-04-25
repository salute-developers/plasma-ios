import Foundation
import SDDSComponents
import SwiftUI

extension EnvironmentValueProvider {
    func setDefaultValues() {
        self.set(value: Avatar.m.appearance, forKey: AvatarAppearance.self)
        self.set(value: Counter.m.default.appearance, forKey: CounterAppearance.self)
        self.set(value: Badge.m.default.appearance, forKey: BadgeAppearance.self)
        self.set(value: BasicButton.m.default.appearance, forKey: ButtonAppearance.self)
        self.set(value: Cell.m.appearance, forKey: CellAppearance.self)
        self.set(value: Checkbox.m.default.appearance, forKey: CheckboxAppearance.self)
        self.set(value: CheckboxGroup.m.appearance, forKey: CheckboxGroupAppearance.self)
        self.set(value: Chip.m.default.appearance, forKey: ChipAppearance.self)
        self.set(value: ChipGroup.dense.appearance, forKey: ChipGroupAppearance.self)
        self.set(value: Indicator.m.default.appearance, forKey: IndicatorAppearance.self)
        self.set(value: ProgressBar.default.appearance, forKey: ProgressBarAppearance.self)
        self.set(value: Radiobox.m.appearance, forKey: RadioboxAppearance.self)
        self.set(value: RadioboxGroup.m.appearance, forKey: RadioboxGroupAppearance.self)
        self.set(value: Segment.m.appearance, forKey: SegmentAppearance.self)
        self.set(value: SegmentItem.m.primary.appearance, forKey: SegmentItemAppearance.self)
        self.set(value: Switch.m.appearance, forKey: SwitchAppearance.self)
        self.set(value: TextArea.m.default.appearance, forKey: TextAreaAppearance.self)
        self.set(value: TextField.m.default.appearance, forKey: TextFieldAppearance.self)
    }
}
