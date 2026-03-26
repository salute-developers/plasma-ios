import SandboxCore
import SwiftUI

public struct SandboxStoryItem: Identifiable {
    public let descriptor: StoryDescriptor
    public let render: (AnySandboxTheme) -> AnyView

    public init(
        descriptor: StoryDescriptor,
        render: @escaping (AnySandboxTheme) -> AnyView
    ) {
        self.descriptor = descriptor
        self.render = render
    }

    public var id: String { descriptor.id }
}
