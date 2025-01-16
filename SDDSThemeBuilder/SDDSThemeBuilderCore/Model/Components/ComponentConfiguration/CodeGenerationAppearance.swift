import Foundation

protocol CodeGenerationAppearance: Codable {
    associatedtype Props: MergeableConfiguration
    
    init(variation: ComponentConfiguration<Props>.Variation)
    init(props: Props, id: String?)
}
