import Foundation
import Stencil
import PathKit

final class GenerateTokensCommand: Command, FileWriter {
    private let schemeURL: URL
    private let themeURL: URL
    private let templates: [StencilTemplate]
    private let generatedOutputURL: URL
    private let templateRender: Renderable
    private let contextBuilder: ContexBuilder
    
    init(name: String,
         schemeURL: URL,
         themeURL: URL,
         templates: [StencilTemplate],
         generatedOutputURL: URL,
         templateRender: Renderable,
         contextBuilder: ContexBuilder
    ) {
        self.schemeURL = schemeURL
        self.themeURL = themeURL
        self.templates = templates
        self.generatedOutputURL = generatedOutputURL
        self.templateRender = templateRender
        self.contextBuilder = contextBuilder
        
        super.init(name: name)
    }
    
    private func createThemeDirectory() -> CommandResult {
        let fileManager = FileManager.default
        
        do {
            if !fileManager.fileExists(atPath: themeURL.path()) {
                try fileManager.createDirectory(at: themeURL, withIntermediateDirectories: false)
            }
            return .success
        } catch {
            return .error(GeneralError.invalidThemeDirectory)
        }
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        var result = createThemeDirectory()
        guard !result.isError else {
            return result
        }
        
        guard let jsonData = try? Data(contentsOf: schemeURL) else {
            return .error(GeneralError.invalidFilename)
        }
        
        result = contextBuilder.buildContext(from: jsonData)
        guard let context = result.asDictionary else {
            return result
        }
        
        for template in templates {
            result = templateRender.render(context: context, template: template, removeLines: true)
            guard let generatedContent = result.asGenerated else {
                return result
            }
            
            result = saveFile(
                content: generatedContent,
                outputURL: generatedOutputURL,
                filename: template.filename
            )
        }
        
        return result
    }
}
