import Foundation

public final class StoryRegistry {
    public static let shared = StoryRegistry()

    public private(set) var stories: [StoryDescriptor] = []

    public init() {}

    public func register(_ story: StoryDescriptor) {
        guard !stories.contains(where: { $0.id == story.id }) else {
            return
        }

        stories.append(story)
    }

    public func register<S: Story>(_ story: S.Type) {
        register(StoryDescriptor(story))
    }

    public func allStories() -> [StoryDescriptor] {
        stories
    }

    public func reset() {
        stories.removeAll()
    }
}
