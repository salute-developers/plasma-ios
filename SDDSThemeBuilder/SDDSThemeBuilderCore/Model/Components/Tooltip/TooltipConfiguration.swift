import Foundation

struct TooltipConfiguration: CodeGenerationConfiguration {
    struct Variation: Codable, Hashable {
        var id: String?
        var props: TooltipProps?
    }
    typealias Props = TooltipProps
    typealias Appearance = TooltipAppearance
    typealias Size = TooltipSize
    typealias VariationType = Variation
} 