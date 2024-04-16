import Foundation
import Stencil
import PathKit

final class GenerateColorTokensCommand: Command, FileWriter {
    private let templatesURL: URL
    private let generatedOutputURL: URL
    private let downloadSchemeCommand: Runnable
    private let templateRender: Renderable
    
    init(name: String = "Generate color tokens", 
         templatesURL: URL,
         generatedOutputURL: URL,
         downloadSchemeCommand: Runnable,
         templateRender: Renderable
    ) {
        self.templatesURL = templatesURL
        self.generatedOutputURL = generatedOutputURL
        self.downloadSchemeCommand = downloadSchemeCommand
        self.templateRender = templateRender
        
        super.init(name: name)
    }
    
    override func run() -> CommandResult {
        super.run()
        
        var result: CommandResult = downloadSchemeCommand.run()
        if result.isError {
            return result
        }
        
        guard let jsonData = result.asData else {
            return result
        }
        
        result = buildContext(from: jsonData)
        guard let context = result.asDictionary else {
            return result
        }
        
        result = templateRender.render(context: context, template: .color, templatesURL: templatesURL)
        guard let generatedContent = result.asGenerated else {
            return result
        }
        
        return saveFile(
            content: generatedContent,
            outputURL: generatedOutputURL,
            filename: StencilTemplate.color.filename
        )
    }
    
    /// Создание контекста для запуска дальнешей кодогенерации.
    /// Контекст создается на основе шаблона ColorToken.stencil
    private func buildContext(from data: Data) -> CommandResult {
        do {
            if var dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // Готовим структуру данных для кодогенерации
                dictionary.replaceKeys(transform: { $0.camelCase })
                
                // Создаем контекст
                var context: [String: Any] = [:]
                context["colors"] = dictionary
                return .dictionary(context)
            } else {
                return .error(GeneralError.decoding)
            }
        } catch {
            return .error(error)
        }
    }
}
