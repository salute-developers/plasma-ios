import SwiftUI

/// Maps story ids to SwiftUI factories using app ``Theme`` (demo aggregate theme).
final class SandboxStoryRenderRegistry {
    static let shared = SandboxStoryRenderRegistry()

    private var renderers: [String: (Theme) -> AnyView] = [:]

    private init() {}

    func reset() {
        renderers.removeAll()
    }

    func register(id: String, render: @escaping (Theme) -> AnyView) {
        renderers[id] = render
    }

    func renderer(for id: String) -> ((Theme) -> AnyView)? {
        renderers[id]
    }
}
