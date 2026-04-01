import Foundation
import SandboxCore

/// Placeholder for codegen output. Code generators should append `StoryRegistry`/`SandboxStoryRenderRegistry`
/// registrations into a generated sibling type (see ``IntegrationCore/SandboxCodegenContract/README.md``).
enum GeneratedStoriesRegistration {
    static func registerDesignSystemStoriesIfPresent(profile _: SandboxDesignSystemProfile) {
        GeneratedStoriesAutogen.registerAll()
    }
}
