import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSFormItem_Simple: View {
    var body: some View {
        SDDSFormItem(
            appearance: FormItem.xs.default.appearance,
            title: { Text("Title") },
            titleCaption: { Text("TitleCaption") },
            caption: { Text("Caption") },
            counter: { Text("Counter") }
        ) {
            Text("Form Item Content")
        }
    }
}

// @DocSample
struct SDDSFormItem_WithHint: View {
    @State private var isTooltipPresented = false

    var body: some View {
        SDDSFormItem(
            appearance: FormItem.xs.default.appearance,
            title: { Text("Title") },
            hasHint: true,
            onHintPressed: { isTooltipPresented = true }
        ) {
            Text("Form Item Content")
        }
        .tooltip(
            isPresented: $isTooltipPresented,
            appearance: Tooltip.default.appearance,
            width: nil,
            text: "Tooltip text"
        ) {
            EmptyView()
        }
    }
}

// @DocSample
struct SDDSFormVertical_Simple: View {
    var body: some View {
        SDDSFormVertical(appearance: FormItem.xs.default.appearance) {
            SDDSFormItem(
                title: { Text("First") }
            ) {
                Text("Value 1")
            }
            SDDSFormItem(
                title: { Text("Second") }
            ) {
                Text("Value 2")
            }
        }
    }
}

// @DocSample
struct SDDSFormHorizontal_Simple: View {
    var body: some View {
        SDDSFormHorizontal(appearance: FormItem.xs.default.appearance) {
            SDDSFormItem(
                title: { Text("Left") }
            ) {
                Text("Value 1")
            }
            SDDSFormItem(
                title: { Text("Right") }
            ) {
                Text("Value 2")
            }
        }
    }
}
