import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSIcons
import SDDSServTheme

struct CollapsingNavigationView: View {
    @ObservedObject private var viewModel: CollapsingNavigationBarViewModel
    @Environment(\.colorScheme) private var colorScheme
    @State private var barState = CollapsingNavigationBarState()
    @State private var barInstanceID = UUID()

    init(viewModel: CollapsingNavigationBarViewModel = CollapsingNavigationBarViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                collapsingNavigationBarBlock
                    .frame(height: geometry.size.height * 2 / 3)
                settingsList
            }
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .onAppear {
            recreateSandboxBar()
        }
    }

    // MARK: - Collapsing Navigation Bar

    private var collapsingNavigationBarBlock: some View {
        VStack(spacing: 0) {
            SDDSCollapsingNavigationBar(
                appearance: viewModel.collapsingNavigationBarAppearance,
                expandedTitle: {
                    Group {
                        if viewModel.expandedTitle.isEmpty {
                            EmptyView()
                        } else {
                            Text(viewModel.expandedTitle)
                        }
                    }
                },
                expandedDescription: {
                    Group {
                        if viewModel.expandedDescription.isEmpty {
                            EmptyView()
                        } else {
                            Text(viewModel.expandedDescription)
                        }
                    }
                },
                collapsedTitle: {
                    Group {
                        if viewModel.collapsedTitle.isEmpty {
                            EmptyView()
                        } else {
                            Text(viewModel.collapsedTitle)
                        }
                    }
                },
                collapsedDescription: {
                    Group {
                        if viewModel.collapsedDescription.isEmpty {
                            EmptyView()
                        } else {
                            Text(viewModel.collapsedDescription)
                        }
                    }
                },
                expandedTextAlign: viewModel.expandedTextAlign,
                collapsedTextAlign: viewModel.collapsedTextAlign,
                centerAlignmentStrategy: viewModel.centerAlignmentStrategy,
                actionStart: { actionStartView },
                actionEnd: { actionEndView },
                backgroundContent: nil,
                middleContent: { AnyView(contentBlock) },
                state: barState,
                scrollBehavior: .exitUntilCollapsed,
                onBackPressed: { print("Back button tapped") },
                content: { scrollListContent }
            )
            .id(barInstanceID)
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .environment(\.subthemeBackgroundColor, viewModel.subtheme == .none ? nil : viewModel.theme.subthemeBackgroundColor(viewModel.subtheme, colorScheme: colorScheme))
    }

    private func recreateSandboxBar() {
        viewModel.resetToDefaults()
        barState = CollapsingNavigationBarState()
        barInstanceID = UUID()
    }

    /// Блок «Content» между баром и скроллом (не скроллится), текст по центру.
    private var contentBlock: some View {
        Text(viewModel.contentText)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(Colors.textDefaultPrimary.token.color(for: colorScheme))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .background(Colors.backgroundLightPrimary.token.color(for: colorScheme))
    }

    /// Только скролл-список (под баром и под Content).
    private var scrollListContent: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<100, id: \.self) { i in
                Text("Label text \(i)")
                    .foregroundStyle(labelTextColor)
                    .padding(32)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var labelTextColor: Color {
        Colors.textDefaultPrimary.token.color(for: colorScheme, subtheme: viewModel.theme.subtheme(viewModel.subtheme))
    }

    @ViewBuilder
    private var actionStartView: some View {
        if viewModel.hasActionStart {
            HStack(spacing: 12) {
                Button(action: {}) {
                    Asset.search24.image
                        .renderingMode(.template)
                        .foregroundStyle(labelTextColor)
                }
                .buttonStyle(.plain)
                Button(action: {}) {
                    Asset.plus24.image
                        .renderingMode(.template)
                        .foregroundStyle(labelTextColor)
                }
                .buttonStyle(.plain)
            }
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private var actionEndView: some View {
        if viewModel.hasActionEnd {
            Button(action: {}) {
                Asset.dotsVerticalOutline24.image
                    .renderingMode(.template)
                    .foregroundStyle(labelTextColor)
            }
            .buttonStyle(.plain)
        } else {
            EmptyView()
        }
    }

    // MARK: - Settings List

    private var settingsList: some View {
        List {
            Section {
                pageTypeRow
                variationsView
                collapsedTitleRow
                expandedTitleRow
                collapsedDescriptionRow
                expandedDescriptionRow
                contentTextRow
                Toggle("Has Action Start", isOn: $viewModel.hasActionStart)
                Toggle("Has Action End", isOn: $viewModel.hasActionEnd)
                collapsedTextAlignRow
                expandedTextAlignRow
                centerAlignmentStrategyRow
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
    }

    // MARK: - Settings Rows

    private var pageTypeRow: some View {
        HStack {
            Text("Page Type")
            Spacer()
            Menu {
                Button("Main Page") {
                    viewModel.pageType = .mainPage
                }
                Button("Internal Page") {
                    viewModel.pageType = .internalPage
                }
            } label: {
                Text(pageTypeText(viewModel.pageType))
            }
        }
    }

    @ViewBuilder
    private var variationsView: some View {
        switch viewModel.pageType {
        case .mainPage:
            VariationsView(viewModel: viewModel)
        case .internalPage:
            if let internalPageViewModel = viewModel.internalPageViewModel {
                VariationsView(viewModel: internalPageViewModel)
            }
        }
    }

    private var collapsedTitleRow: some View {
        HStack {
            Text("Collapsed Title")
            Spacer()
            TextField("Title", text: $viewModel.collapsedTitle)
                .multilineTextAlignment(.trailing)
        }
    }

    private var expandedTitleRow: some View {
        HStack {
            Text("Expanded Title")
            Spacer()
            TextField("Title", text: $viewModel.expandedTitle)
                .multilineTextAlignment(.trailing)
        }
    }

    private var collapsedDescriptionRow: some View {
        HStack {
            Text("Collapsed Description")
            Spacer()
            TextField("Description", text: $viewModel.collapsedDescription)
                .multilineTextAlignment(.trailing)
        }
    }

    private var expandedDescriptionRow: some View {
        HStack {
            Text("Expanded Description")
            Spacer()
            TextField("Description", text: $viewModel.expandedDescription)
                .multilineTextAlignment(.trailing)
        }
    }

    private var contentTextRow: some View {
        HStack {
            Text("Content Text")
            Spacer()
            TextField("Content", text: $viewModel.contentText)
                .multilineTextAlignment(.trailing)
        }
    }

    private var collapsedTextAlignRow: some View {
        HStack {
            Text("Collapsed Text Align")
            Spacer()
            Menu {
                Button("Left") { viewModel.collapsedTextAlign = .left }
                Button("Center") { viewModel.collapsedTextAlign = .center }
                Button("Right") { viewModel.collapsedTextAlign = .right }
            } label: {
                Text(textAlignText(viewModel.collapsedTextAlign))
            }
        }
    }

    private var expandedTextAlignRow: some View {
        HStack {
            Text("Expanded Text Align")
            Spacer()
            Menu {
                Button("Left") { viewModel.expandedTextAlign = .left }
                Button("Center") { viewModel.expandedTextAlign = .center }
                Button("Right") { viewModel.expandedTextAlign = .right }
            } label: {
                Text(textAlignText(viewModel.expandedTextAlign))
            }
        }
    }

    private var centerAlignmentStrategyRow: some View {
        HStack {
            Text("Center Alignment (collapsed)")
            Spacer()
            Menu {
                Button("Relative") { viewModel.centerAlignmentStrategy = .relative }
                Button("Absolute") { viewModel.centerAlignmentStrategy = .absolute }
            } label: {
                Text(centerAlignmentStrategyText(viewModel.centerAlignmentStrategy))
            }
        }
    }

    // MARK: - Helper Methods

    private func pageTypeText(_ type: CollapsingNavigationBarPageType) -> String {
        switch type {
        case .mainPage: return "Main Page"
        case .internalPage: return "Internal Page"
        }
    }

    private func textAlignText(_ align: NavigationBarTextAlign) -> String {
        switch align {
        case .center: return "Center"
        case .left: return "Left"
        case .right: return "Right"
        }
    }

    private func centerAlignmentStrategyText(_ strategy: CollapsingNavigationBarCenterAlignmentStrategy) -> String {
        switch strategy {
        case .relative: return "Relative"
        case .absolute: return "Absolute"
        }
    }
}

#Preview {
    CollapsingNavigationView()
}
