import SandboxCore
import SwiftUI

public struct SandboxStoriesContainerView: View {
    @ObservedObject private var themeManager: ThemeManager
    private let storyItems: [SandboxStoryItem]
    private let title: String

    public init(
        title: String = "Components",
        themeManager: ThemeManager = .shared,
        storyItems: [SandboxStoryItem]
    ) {
        self.title = title
        self.themeManager = themeManager
        self.storyItems = storyItems
    }

    private var sortedStories: [SandboxStoryItem] {
        storyItems.sorted(by: { $0.descriptor.title < $1.descriptor.title })
    }

    public var body: some View {
        List {
            Section(header: Text("Theme")) {
                HStack {
                    Text("Current Theme")
                    Spacer()
                    Menu {
                        ForEach(themeManager.themes) { theme in
                            Button(theme.title) {
                                themeManager.selectTheme(withId: theme.id)
                            }
                        }
                    } label: {
                        Text(themeManager.currentTheme?.title ?? "Not selected")
                    }
                }
            }

            Section(header: Text("Stories")) {
                ForEach(sortedStories) { item in
                    NavigationLink {
                        if let theme = themeManager.currentTheme {
                            SandboxStoryDetailView(
                                descriptor: item.descriptor,
                                theme: theme,
                                render: item.render
                            )
                        } else {
                            Text("Theme is not selected")
                        }
                    } label: {
                        Text(item.descriptor.title)
                    }
                }
            }
        }
        .navigationTitle(title)
    }
}
