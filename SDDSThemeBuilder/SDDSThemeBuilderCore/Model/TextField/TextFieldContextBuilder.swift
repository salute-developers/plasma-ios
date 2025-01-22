import Foundation

final class TextFieldContextBuilder {
    let configuration: TextFieldConfiguration
    
    init(configuration: TextFieldConfiguration) {
        self.configuration = configuration
    }
    
    func build() -> TextFieldContext {
        return TextFieldContext(
            sizeConfiguration: sizeConfiguration(from: configuration),
            appearance: appearance(from: configuration),
            typography: typography(from: configuration)
        )
    }
    
    private func sizeConfiguration(from configuration: TextFieldConfiguration) -> TextFieldSizeConfiguration {
        fatalError()
    }
    
    private func appearance(from configuration: TextFieldConfiguration) -> TextFieldAppearance {
        fatalError()
    }
    
    private func typography(from configuration: TextFieldConfiguration) -> TextFieldTypography {
        fatalError()
    }
}
