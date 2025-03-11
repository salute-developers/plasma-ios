import Foundation

protocol CodeGenerationAppearance: Codable {
    associatedtype Props: MergeableConfiguration
    
    init(variation: ComponentConfiguration<Props>.Variation, component: CodeGenerationComponent)
    init(props: Props?, id: String?, component: CodeGenerationComponent)
}
