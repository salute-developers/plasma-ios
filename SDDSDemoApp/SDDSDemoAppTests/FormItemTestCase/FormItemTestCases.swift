import SwiftUI
import SDDSComponents
import SDDSIcons

struct FormItemSnapshotCase: View {
    let appearance: FormItemAppearance
    let content: String
    let title: String?
    let titleCaption: String?
    let caption: String?
    let counter: String?
    let optional: String?
    let hasHint: Bool
    let hasCaptionIcon: Bool
    let enabled: Bool

    init(
        appearance: FormItemAppearance,
        content: String = "Form item text content.\nSecond line text.",
        title: String? = "Title",
        titleCaption: String? = "",
        caption: String? = "Caption",
        counter: String? = "",
        optional: String? = "Optional",
        hasHint: Bool = false,
        hasCaptionIcon: Bool = true,
        enabled: Bool = true
    ) {
        self.appearance = appearance
        self.content = content
        self.title = title
        self.titleCaption = titleCaption
        self.caption = caption
        self.counter = counter
        self.optional = optional
        self.hasHint = hasHint
        self.hasCaptionIcon = hasCaptionIcon
        self.enabled = enabled
    }

    var body: some View {
        VStack {
            SDDSFormItem(
                appearance: appearance,
                title: textOrNil(title),
                optional: textOrNil(optional),
                titleCaption: textOrNil(titleCaption),
                caption: captionOrNil(caption),
                counter: textOrNil(counter),
                hasHint: hasHint,
                enabled: enabled
            ) {
                Text(content)
            }
            .padding(16)
        }
        .frame(width: 360)
    }

    private func textOrNil(_ value: String?) -> (() -> AnyView)? {
        guard let value, !value.isEmpty else { return nil }
        return { AnyView(Text(value)) }
    }

    private func captionOrNil(_ value: String?) -> (() -> AnyView)? {
        guard let value, !value.isEmpty else { return nil }
        if hasCaptionIcon {
            return {
                AnyView(
                    HStack(spacing: 4) {
                        Asset.shazam24.image
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: ContentMode.fit)
                            .frame(width: 16, height: 16)
                        Text(value)
                    }
                )
            }
        }
        return { AnyView(Text(value)) }
    }
}
