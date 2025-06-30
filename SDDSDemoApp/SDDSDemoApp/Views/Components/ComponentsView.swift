import SwiftUI

struct ComponentsView: View {
    private let components: [(name: String, view: AnyView)] = [
        ("Avatar", AnyView(AvatarView())),
        ("AvatarGroup", AnyView(AvatarGroupView())),
        ("Button", AnyView(ButtonView())),
        ("Chip", AnyView(ChipView())),
        ("ChipGroup", AnyView(ChipGroupView())),
        ("Checkbox", AnyView(CheckboxView())),
        ("CheckboxGroup", AnyView(CheckboxGroupView())),
        ("ProgressBar", AnyView(ProgressBarView())),
        ("Radiobox", AnyView(RadioboxView())),
        ("RadioboxGroup", AnyView(RadioboxGroupView())),
        ("Switch", AnyView(SwitchView())),
        ("TextArea", AnyView(TextAreaView())),
        ("TextField", AnyView(TextFieldView())),
        ("Counter", AnyView(CounterView())),
        ("SegmentElement", AnyView(SegmentItemView())),
        ("Segment", AnyView(SegmentView())),
        ("Badge", AnyView(BadgeView())),
        ("Indicator", AnyView(IndicatorView())),
        ("Cell", AnyView(CellView())),
        ("Card", AnyView(CardView())),
        ("BottomSheet", AnyView(BottomSheetView())),
        ("CircularProgressBar", AnyView(CircularProgressBarView())),
        ("Divider", AnyView(DividerView())),
        ("List", AnyView(ListView())),
        ("ListItem", AnyView(ListItemView())),
        ("Overlay", AnyView(OverlayView())),
        ("Popover", AnyView(PopoverView())),
        ("Tooltip", AnyView(TooltipView())),
        ("Toast", AnyView(ToastView())),
        ("Modal", AnyView(ModalView())),
        ("Notification", AnyView(NotificationView())),
        ("RectSkeleton", AnyView(RectSkeletonView())),
        ("TextSkeleton", AnyView(TextSkeletonView()))
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(components.sorted(by: { $0.name < $1.name }), id: \.name) { component in
                    NavigationLink {
                        component.view
                    } label: {
                        Text(component.name)
                    }
                }
            }
            .navigationTitle("Components")
        }
    }
}

#Preview {
    ComponentsView()
}
