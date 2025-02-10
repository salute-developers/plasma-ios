import Foundation

struct CodeGenerationInput {
    let template: StencilTemplate
    let component: CodeGenerationComponent?
    let configuration: Codable
    
    init(template: StencilTemplate, component: CodeGenerationComponent? = nil, configuration: Codable) {
        self.template = template
        self.component = component
        self.configuration = configuration
    }
}
