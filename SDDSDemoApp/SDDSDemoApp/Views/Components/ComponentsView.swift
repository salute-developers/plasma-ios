import SwiftUI
import SDDSServTheme
import SDDSComponents

struct ComponentsView: View {
    private let components: [(name: String, view: AnyView)] = [
        ("Accordion", AnyView(AccordionView())),
        ("AccordionItem", AnyView(AccordionItemView())),
        ("Avatar", AnyView(AvatarView())),
        ("AvatarGroup", AnyView(AvatarGroupView())),
        ("Button", AnyView(ButtonView())),
        ("ButtonGroup", AnyView(ButtonGroupView())),
        ("Chip", AnyView(ChipView())),
        ("ChipGroup", AnyView(ChipGroupView())),
        ("Checkbox", AnyView(CheckboxView())),
        ("CheckboxGroup", AnyView(CheckboxGroupView())),
        ("ProgressBar", AnyView(ProgressBarView())),
        ("Radiobox", AnyView(RadioboxView())),
        ("RadioboxGroup", AnyView(RadioboxGroupView())),
        ("Scrollbar", AnyView(ScrollbarView())),
        ("Spinner", AnyView(SpinnerView())),
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
        ("TabBar", AnyView(TabBarView())),
        ("TabBarIsland", AnyView(TabBarIslandView())),
        ("Popover", AnyView(PopoverView())),
        ("Tooltip", AnyView(TooltipView())),
        ("Toast", AnyView(ToastView())),
        ("Modal", AnyView(ModalView())),
        ("Notification", AnyView(NotificationView())),
        ("RectSkeleton", AnyView(RectSkeletonView())),
        ("TextSkeleton", AnyView(TextSkeletonView())),
        ("DropDownMenu", AnyView(DropdownMenuView())),
        ("CodeField", AnyView(CodeFieldView())),
        ("CodeInput", AnyView(CodeInputView())),
        ("Loader", AnyView(LoaderView())),
        ("Wheel", AnyView(WheelView())),
        ("NavigationBar", AnyView(NavigationBarView())),
        ("Note", AnyView(NoteView())),
        ("NoteCompact", AnyView(NoteCompactView())),
        ("Tabs", AnyView(TabsView())),
        ("TabItem", AnyView(TabItemView()))
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
