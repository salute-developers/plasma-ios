import SwiftUI

extension EnvironmentValues {
    var counterAppearance: CounterAppearance {
        get { self[CounterAppearance.self] }
        set { self[CounterAppearance.self] = newValue }
    }
    
    var buttonAppearance: ButtonAppearance {
        get { self[ButtonAppearance.self] }
        set { self[ButtonAppearance.self] = newValue }
    }
    
    var segmentItemAppearance: SegmentItemAppearance {
        get { self[SegmentItemAppearance.self] }
        set { self[SegmentItemAppearance.self] = newValue }
    }
    
    var segmentAppearance: SegmentAppearance {
        get { self[SegmentAppearance.self] }
        set { self[SegmentAppearance.self] = newValue }
    }
    
    var avatarAppearance: AvatarAppearance {
        get { self[AvatarAppearance.self] }
        set { self[AvatarAppearance.self] = newValue }
    }
    
    var chipAppearance: ChipAppearance {
        get { self[ChipAppearance.self] }
        set { self[ChipAppearance.self] = newValue }
    }
    
    var switchAppearance: SwitchAppearance {
        get { self[SwitchAppearance.self] }
        set { self[SwitchAppearance.self] = newValue }
    }
    
    var checkboxAppearance: CheckboxAppearance {
        get { self[CheckboxAppearance.self] }
        set { self[CheckboxAppearance.self] = newValue }
    }
    
    var radioboxAppearance: RadioboxAppearance {
        get { self[RadioboxAppearance.self] }
        set { self[RadioboxAppearance.self] = newValue }
    }
}
