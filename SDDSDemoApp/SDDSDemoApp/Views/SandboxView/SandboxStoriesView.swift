import SandboxCore
import SandboxSwiftUI
import SwiftUI

struct SandboxStoriesView: View {
    private let profile: SandboxDesignSystemProfile
    @State private var storyItems: [SandboxStoryItem] = []

    init(profile: SandboxDesignSystemProfile = .all) {
        self.profile = profile
    }

    var body: some View {
        SandboxStoriesContainerView(
            title: profile.title,
            themeManager: .shared,
            storyItems: storyItems
        )
        .onAppear {
            SandboxBootstrap.registerTheme(profile: profile)
            SandboxBootstrap.registerCoreStories()
            SandboxBootstrap.registerStories(profile: profile)
            storyItems = SandboxBootstrap.makeStoryItems(profile: profile)
        }
    }
}

#Preview {
    NavigationView {
        SandboxStoriesView(profile: .all)
    }
}
