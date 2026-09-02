import Foundation

final class SchemeValidationLogger {
    class func printText(_ text: String) throws {
        let line = "Meta Scheme Validation: \(text)"
        Logger.printText(line)
        throw TemplateRendererError(line)
    }
}
