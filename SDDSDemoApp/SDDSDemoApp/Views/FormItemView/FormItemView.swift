import SwiftUI
import SDDSComponents
import SDDSIcons
import SandboxSwiftUI

struct FormItemView: View {
    @ObservedObject private var viewModel: FormItemViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: FormItemViewModel = FormItemViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            Section {
                SDDSFormItem(
                    appearance: viewModel.appearance,
                    hint: hintOrNil(),
                    title: textOrNil(viewModel.title),
                    optional: textOrNil(viewModel.optional),
                    titleCaption: textOrNil(viewModel.titleCaption),
                    caption: captionOrNil(),
                    counter: textOrNil(viewModel.counter),
                    enabled: viewModel.enabled
                ) {
                    Text(viewModel.content)
                }
                .padding(.vertical, 16)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)

            Section {
                VariationsView(viewModel: viewModel)

                TextField("content", text: $viewModel.content, axis: .vertical)
                    .lineLimit(2...4)
                TextField("title", text: $viewModel.title)
                TextField("titleCaption", text: $viewModel.titleCaption)
                TextField("caption", text: $viewModel.caption)
                TextField("counter", text: $viewModel.counter)
                TextField("optional", text: $viewModel.optional)

                Toggle("hasHint", isOn: $viewModel.hasHint)
                Toggle("hasCaptionIcon", isOn: $viewModel.hasCaptionIcon)
                Toggle("enabled", isOn: $viewModel.enabled)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("FormItem")
    }

    private func textOrNil(_ value: String) -> (() -> AnyView)? {
        guard !value.isEmpty else { return nil }
        return { AnyView(Text(value)) }
    }

    private func captionOrNil() -> (() -> AnyView)? {
        if viewModel.hasCaptionIcon {
            return {
                AnyView(
                    HStack(spacing: viewModel.caption.isEmpty ? 0 : 4) {
                        Asset.shazam24.image
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: ContentMode.fit)
                            .frame(width: 16, height: 16)
                        if !viewModel.caption.isEmpty {
                            Text(viewModel.caption)
                        }
                    }
                )
            }
        }
        guard !viewModel.caption.isEmpty else { return nil }
        return { AnyView(Text(viewModel.caption)) }
    }

    private func hintOrNil() -> (() -> AnyView)? {
        guard viewModel.hasHint else { return nil }
        let tooltipAppearance = viewModel.theme.tooltipVariations.first?.appearance ?? TooltipAppearance()
        let subtheme = viewModel.theme.subtheme(viewModel.subtheme)

        return {
            AnyView(
                (viewModel.appearance.hintIcon ?? Asset.infoCircleOutline16.image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: viewModel.appearance.size.hintWidth,
                        height: viewModel.appearance.size.hintHeight
                    )
                    .onTapGesture { viewModel.showHintTooltip = true }
                    .tooltip(
                        isPresented: $viewModel.showHintTooltip,
                        appearance: tooltipAppearance,
                        width: nil,
                        text: "Tooltip text",
                        placement: .top,
                        alignment: .center,
                        triggerCentered: true,
                        subtheme: subtheme
                    ) {
                        EmptyView()
                    }
            )
        }
    }
}

#Preview {
    NavigationView {
        FormItemView()
    }
}
