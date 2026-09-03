import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSFormItem_Simple: View {
    var body: some View {
        SDDSFormItem(
            title: { Text("Title") },
            optional: { EmptyView() },
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
            title: { Text("Title") },
            optional: { EmptyView() },
            titleCaption: { EmptyView() },
            caption: { EmptyView() },
            counter: { EmptyView() },
            hasHint: true,
            onHintPressed: { isTooltipPresented = true }
        ) {
            Text("Form Item Content")
        }
        .tooltip(
            isPresented: $isTooltipPresented,
            appearance: Tooltip.m.appearance,
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
        SDDSFormVertical {
            SDDSFormItem(
                title: { Text("First") },
                optional: { EmptyView() },
                titleCaption: { EmptyView() },
                caption: { EmptyView() },
                counter: { EmptyView() }
            ) {
                Text("Value 1")
            }
            SDDSFormItem(
                title: { Text("Second") },
                optional: { EmptyView() },
                titleCaption: { EmptyView() },
                caption: { EmptyView() },
                counter: { EmptyView() }
            ) {
                Text("Value 2")
            }
        }
    }
}

// @DocSample
struct SDDSFormHorizontal_Simple: View {
    var body: some View {
        SDDSFormHorizontal {
            SDDSFormItem(
                title: { Text("Left") },
                optional: { EmptyView() },
                titleCaption: { EmptyView() },
                caption: { EmptyView() },
                counter: { EmptyView() }
            ) {
                Text("Value 1")
            }
            SDDSFormItem(
                title: { Text("Right") },
                optional: { EmptyView() },
                titleCaption: { EmptyView() },
                caption: { EmptyView() },
                counter: { EmptyView() }
            ) {
                Text("Value 2")
            }
        }
    }
}
