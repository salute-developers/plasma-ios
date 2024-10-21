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
        ("SDDSTextField", AnyView(TextFieldView()))
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(components, id: \.name) { component in
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
