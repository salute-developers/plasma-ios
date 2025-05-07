import SwiftUI

struct ComponentsView: View {
    private let components: [(name: String, view: AnyView)] = [
        ("SDDSAvatar", AnyView(AvatarView())),
        ("SDDSAvatarGroup", AnyView(AvatarGroupView())),
        ("SDDSButton", AnyView(ButtonView())),
        ("SDDSChip", AnyView(ChipView())),
        ("SDDSChipGroup", AnyView(ChipGroupView())),
        ("SDDSCheckbox", AnyView(CheckboxView())),
        ("SDDSCheckboxGroup", AnyView(CheckboxGroupView())),
        ("SDDSProgressBar", AnyView(ProgressBarView())),
        ("SDDSRadiobox", AnyView(RadioboxView())),
        ("SDDSRadioboxGroup", AnyView(RadioboxGroupView())),
        ("SDDSSwitch", AnyView(SwitchView())),
        ("SDDSTextArea", AnyView(TextAreaView())),
        ("SDDSTextField", AnyView(TextFieldView())),
        ("SDDSCounter", AnyView(CounterView())),
        ("SDDSSegmentElement", AnyView(SegmentItemView())),
        ("SDDSSegment", AnyView(SegmentView())),
        ("SDDSBadge", AnyView(BadgeView())),
        ("SDDSIndicator", AnyView(IndicatorView())),
        ("SDDSCell", AnyView(CellView())),
        ("SDDSCard", AnyView(CardView())),
        ("SDDSBottomSheet", AnyView(BottomSheetView())),
        ("SDDSCircularProgressBar", AnyView(CircularProgressBarView()))
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
