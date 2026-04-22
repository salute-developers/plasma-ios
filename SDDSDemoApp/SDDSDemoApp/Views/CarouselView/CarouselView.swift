import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SandboxSwiftUI

struct CarouselView: View {
    @ObservedObject private var viewModel: CarouselViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: CarouselViewModel = CarouselViewModel()) {
        self.viewModel = viewModel
    }

    private enum DemoLayout {
        static let pageWidth: CGFloat = 230
        static let itemHeight: CGFloat = 250
        static let itemCornerRadius: CGFloat = 16
        static let carouselHeight: CGFloat = 310
    }

    var body: some View {
        let resolvedAppearance = viewModel.resolvedAppearance()
        let usesOuterControls = resolvedAppearance.size.buttonsPlacement == .outer && viewModel.controlsEnabled
        let demoPageWidth: CGFloat? = usesOuterControls ? nil : DemoLayout.pageWidth

        List {
            Section {
                HStack {
                    Spacer()
                    SDDSCarousel(
                        selection: $viewModel.selectedIndex,
                        pageCount: viewModel.itemCount,
                        hasIndicator: viewModel.indicatorEnabled,
                        hasControls: viewModel.controlsEnabled,
                        indicatorVisibleCount: viewModel.indicatorVisibleItemCount,
                        pageWidth: demoPageWidth,
                        pageAlignment: carouselPageAlignment,
                        appearance: resolvedAppearance
                    ) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: DemoLayout.itemCornerRadius, style: .continuous)
                            .fill(Color(red: 0.83, green: 0.90, blue: 0.95))
                            Text("\(index)")
                                .font(.title.weight(.medium))
                                .foregroundStyle(Color.white)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: DemoLayout.itemHeight)
                    }
                    .frame(height: DemoLayout.carouselHeight)
                    .frame(maxWidth: 500)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)

            Section {
                VariationsView(viewModel: viewModel)

                valueMenuRow(title: "itemCount", value: "\(viewModel.itemCount)") {
                    ForEach(0...30, id: \.self) { count in
                        Button("\(count)") {
                            viewModel.itemCount = count
                        }
                    }
                }

                valueMenuRow(
                    title: "alignment",
                    value: viewModel.alignment.rawValue.capitalized
                ) {
                    ForEach(CarouselPageAlignment.allCases, id: \.self) { alignment in
                        Button(alignment.rawValue.capitalized) {
                            viewModel.alignment = alignment
                        }
                    }
                }

                Toggle("controlsEnabled", isOn: $viewModel.controlsEnabled)
                Toggle("indicatorEnabled", isOn: $viewModel.indicatorEnabled)

                valueMenuRow(
                    title: "indicatorVisibleItemCount",
                    value: "\(viewModel.indicatorVisibleItemCount)"
                ) {
                    ForEach(1...max(viewModel.itemCount, 1), id: \.self) { count in
                        Button("\(count)") {
                            viewModel.indicatorVisibleItemCount = count
                        }
                    }
                }

                Toggle("withGap", isOn: $viewModel.withGap)
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("Carousel")
    }

    private func valueMenuRow(
        title: String,
        value: String,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        HStack {
            Text(title)
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                content()
            } label: {
                Text(value)
            }
        }
    }

    private var carouselPageAlignment: CarouselSlideAlignment {
        switch viewModel.alignment {
        case .start:
            return .start
        case .center:
            return .center
        case .end:
            return .end
        }
    }
}

#Preview {
    NavigationView {
        CarouselView()
    }
}
