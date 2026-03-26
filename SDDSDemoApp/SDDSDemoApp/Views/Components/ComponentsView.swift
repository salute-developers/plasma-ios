import SwiftUI

struct ComponentsView: View {
    private let profile: SandboxDesignSystemProfile

    init(profile: SandboxDesignSystemProfile = .all) {
        self.profile = profile
    }

    var body: some View {
        NavigationView {
            SandboxStoriesView(profile: profile)
        }
    }
}

#Preview {
    ComponentsView(profile: .all)
}
