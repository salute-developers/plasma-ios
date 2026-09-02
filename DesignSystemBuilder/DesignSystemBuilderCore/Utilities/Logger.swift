import Foundation

final class Logger {
    class func printLine() {
        print(String(Array(repeating: "-", count: Constants.outputLinesCount )))
    }
    
    class func printText(_ text: String) {
        print(String(Array(repeating: " ", count: Constants.outputLinesCount / 4 )) + text)
    }
    
    class func terminate(_ text: String) -> Never {
        printText(text)
        fatalError(text)
    }
    
    class func terminate(with error: Error) -> Never {
        terminate(error.localizedDescription)
    }
}
