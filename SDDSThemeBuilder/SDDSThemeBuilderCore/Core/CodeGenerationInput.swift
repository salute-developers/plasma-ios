import Foundation

struct CodeGenerationInput {
    let template: StencilTemplate
    let component: GeneratedComponent?
    let configuration: Codable
    
    init(template: StencilTemplate, component: GeneratedComponent? = nil, configuration: Codable) {
        self.template = template
        self.component = component
        self.configuration = configuration
    }
}
