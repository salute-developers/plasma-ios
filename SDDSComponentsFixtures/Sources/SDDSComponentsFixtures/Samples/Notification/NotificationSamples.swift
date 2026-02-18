import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSNotification_Simple: View {
    @State private var isPresented = true

    var body: some View {
        Text("Trigger")
            .notification(
                isPresented: $isPresented,
                appearance: NotificationLoose.m.appearance,
                position: .topCenter,
                duration: 3.0
            ) {
                Text("Текст уведомления")
            }
    }
}
