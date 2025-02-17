import SwiftUI

public extension EnvironmentValues {
    var counterAppearance: CounterAppearance {
        get { self[CounterAppearance.self] }
        set { self[CounterAppearance.self] = newValue }
    }
    
    public var buttonAppearance: ButtonAppearance {
        get { self[ButtonAppearance.self] }
        set { self[ButtonAppearance.self] = newValue }
    }
    
    public var segmentItemAppearance: SegmentItemAppearance {
        get { self[SegmentItemAppearance.self] }
        set { self[SegmentItemAppearance.self] = newValue }
    }
    
    public var segmentAppearance: SegmentAppearance {
        get { self[SegmentAppearance.self] }
        set { self[SegmentAppearance.self] = newValue }
    }
    
    public var avatarAppearance: AvatarAppearance {
        get { self[AvatarAppearance.self] }
        set { self[AvatarAppearance.self] = newValue }
    }
    
    public var chipAppearance: ChipAppearance {
        get { self[ChipAppearance.self] }
        set { self[ChipAppearance.self] = newValue }
    }
    
    public var switchAppearance: SwitchAppearance {
        get { self[SwitchAppearance.self] }
        set { self[SwitchAppearance.self] = newValue }
    }
    
    public var checkboxAppearance: CheckboxAppearance {
        get { self[CheckboxAppearance.self] }
        set { self[CheckboxAppearance.self] = newValue }
    }
    
    public var radioboxAppearance: RadioboxAppearance {
        get { self[RadioboxAppearance.self] }
        set { self[RadioboxAppearance.self] = newValue }
    }
    
    var badgeAppearance: BadgeAppearance {
        get { self[BadgeAppearance.self] }
        set { self[BadgeAppearance.self] = newValue }
    }
    
    var indicatorAppearance: IndicatorAppearance {
        get { self[IndicatorAppearance.self] }
        set { self[IndicatorAppearance.self] = newValue }
    }
}
