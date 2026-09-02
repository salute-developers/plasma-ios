import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSSwitch_Simple: View {
    @State private var isOn = true

    var body: some View {
        SDDSSwitch(
            title: "Label",
            subtitle: "Description",
            isOn: $isOn,
            isEnabled: true,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
