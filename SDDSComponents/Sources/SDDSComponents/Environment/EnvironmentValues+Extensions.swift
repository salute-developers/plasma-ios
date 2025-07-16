import SwiftUI

// MARK: - Appearance
public extension EnvironmentValues {
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
    
    var avatarGroupAppearance: AvatarGroupAppearance {
        get { self[AvatarGroupAppearance.self] }
        set { self[AvatarGroupAppearance.self] = newValue }
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
    
    var checkboxGroupAppearance: CheckboxGroupAppearance {
        get { self[CheckboxGroupAppearance.self] }
        set { self[CheckboxGroupAppearance.self] = newValue }
    }
    
    var radioboxAppearance: RadioboxAppearance {
        get { self[RadioboxAppearance.self] }
        set { self[RadioboxAppearance.self] = newValue }
    }
    
    var radioboxGroupAppearance: RadioboxGroupAppearance {
        get { self[RadioboxGroupAppearance.self] }
        set { self[RadioboxGroupAppearance.self] = newValue }
    }
    
    var badgeAppearance: BadgeAppearance {
        get { self[BadgeAppearance.self] }
        set { self[BadgeAppearance.self] = newValue }
    }
    
    var indicatorAppearance: IndicatorAppearance {
        get { self[IndicatorAppearance.self] }
        set { self[IndicatorAppearance.self] = newValue }
    }
    
    var cellAppearance: CellAppearance {
        get { self[CellAppearance.self] }
        set { self[CellAppearance.self] = newValue }
    }
    
    var textAreaAppearance: TextAreaAppearance {
        get { self[TextAreaAppearance.self] }
        set { self[TextAreaAppearance.self] = newValue }
    }
    
    var textFieldAppearance: TextFieldAppearance {
        get { self[TextFieldAppearance.self] }
        set { self[TextFieldAppearance.self] = newValue }
    }
    
    var chipGroupAppearance: ChipGroupAppearance {
        get { self[ChipGroupAppearance.self] }
        set { self[ChipGroupAppearance.self] = newValue }
    }
    
    var progressBarAppearance: ProgressBarAppearance {
        get { self[ProgressBarAppearance.self] }
        set { self[ProgressBarAppearance.self] = newValue }
    }

    var cardAppearance: CardAppearance {
        get { self[CardAppearance.self] }
        set { self[CardAppearance.self] = newValue }
    }
    
    var bottomSheetAppearance: BottomSheetAppearance {
        get { self[BottomSheetAppearance.self] }
        set { self[BottomSheetAppearance.self] = newValue }
    }
    
    var circularProgressBarAppearance: CircularProgressBarAppearance {
        get { self[CircularProgressBarAppearance.self] }
        set { self[CircularProgressBarAppearance.self] = newValue }
    }
    
    var dividerAppearance: DividerAppearance {
        get { self[DividerAppearance.self] }
        set { self[DividerAppearance.self] = newValue }
    }
    
    var overlayAppearance: OverlayAppearance {
        get { self[OverlayAppearance.self] }
        set { self[OverlayAppearance.self] = newValue }
    }

    var popoverAppearance: PopoverAppearance {
        get { self[PopoverAppearance.self] }
        set { self[PopoverAppearance.self] = newValue }
    }
    
    var toastAppearance: ToastAppearance {
        get { self[ToastAppearance.self] }
        set { self[ToastAppearance.self] = newValue }
    }
    
    var listAppearance: ListAppearance {
        get { self[ListAppearance.self] }
        set { self[ListAppearance.self] = newValue }
    }
    
    var listItemAppearance: ListItemAppearance {
        get { self[ListItemAppearance.self] }
        set { self[ListItemAppearance.self] = newValue }
    }

    var scrollbarAppearance: ScrollbarAppearance {
        get { self[ScrollbarAppearance.self] }
        set { self[ScrollbarAppearance.self] = newValue }
    }
    
    var dropDownMenuAppearance: DropdownMenuAppearance {
        get { self[DropdownMenuAppearance.self] }
        set { self[DropdownMenuAppearance.self] = newValue }
    }
    
    var accordionItemAppearance: AccordionItemAppearance {
        get { self[AccordionItemAppearance.self] }
        set { self[AccordionItemAppearance.self] = newValue }
    }
    
    var accordionAppearance: AccordionAppearance {
        get { self[AccordionAppearance.self] }
        set { self[AccordionAppearance.self] = newValue }
    }

    var spinnerAppearance: SpinnerAppearance {
        get { self[SpinnerAppearance.self] }
        set { self[SpinnerAppearance.self] = newValue }
    }
}