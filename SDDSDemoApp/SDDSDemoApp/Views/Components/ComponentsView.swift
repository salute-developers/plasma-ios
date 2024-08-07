import SwiftUI

struct ComponentsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ButtonView()
                } label: {
                    Text("SDDSButton")
                }
                NavigationLink {
                    CheckboxView()
                } label: {
                    Text("SDDSCheckbox")
                }
                NavigationLink {
                    RadioboxView()
                } label: {
                    Text("SDDSRadiobox")
                }
                NavigationLink {
                    ProgressBarView()
                } label: {
                    Text("SDDSProgressBar")
                }
                NavigationLink {
                    SwitchView()
                } label: {
                    Text("SDDSSwitch")
                }
            }
            .navigationTitle("Components")
        }
    }
}

#Preview {
    ComponentsView()
}
