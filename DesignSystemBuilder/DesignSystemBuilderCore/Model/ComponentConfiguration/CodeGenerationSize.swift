import Foundation

protocol CodeGenerationSize: Codable {
    associatedtype Props: MergeableConfiguration
    
    init(variation: ComponentConfiguration<Props>.Variation, nullify: Bool)
    init(props: Props, id: String?, nullify: Bool)
    init()
}
