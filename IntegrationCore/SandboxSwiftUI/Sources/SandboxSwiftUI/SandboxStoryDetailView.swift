import SandboxCore
import SwiftUI

/// Shows the story ``render`` output (often a ``List``-based demo screen).
///
/// - Important: Do not wrap ``List``-based stories in an outer ``ScrollView`` — that collapses the inner list
///   and hides the component preview (see Button and other component demos).
public struct SandboxStoryDetailView: View {
    private let descriptor: StoryDescriptor
    private let theme: AnySandboxTheme
    private let render: (AnySandboxTheme) -> AnyView

    public init(
        descriptor: StoryDescriptor,
        theme: AnySandboxTheme,
        render: @escaping (AnySandboxTheme) -> AnyView
    ) {
        self.descriptor = descriptor
        self.theme = theme
        self.render = render
    }

    public var body: some View {
        render(theme)
            .navigationTitle(descriptor.title)
    }
}

