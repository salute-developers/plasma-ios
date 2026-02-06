import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct BasicButton_Simple: View {
    var body: some View {
        BasicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: BasicButton.l.accent.appearance,
            layoutMode: .wrapContent,
            action: { print("Button did tap") }
        )
    }
}

// @DocSample
struct BasicButton_Snippet: View {
    var body: some View {
        swiftCodeSnippet {
            BasicButton(
                title: "Label",
                subtitle: "Value",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image.image("spinner"),
                appearance: BasicButton.l.accent.appearance,
                layoutMode: .wrapContent,
                action: { print("Button did tap") }
            )
        }
    }
}

// @DocSample
struct BasicButton_WithPlaceholder: View {
    var body: some View {
        BasicButton(
            title: placeholder("Label", "Основной текст"),
            subtitle: "",
            appearance: BasicButton.l.accent.appearance,
            layoutMode: .wrapContent,
            action: {}
        )
    }
}
