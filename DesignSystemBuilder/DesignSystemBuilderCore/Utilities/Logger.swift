import Foundation

final class Logger {
    class func printLine() {
        print(String(Array(repeating: "-", count: Constants.outputLinesCount )))
    }
    
    class func printText(_ text: String) {
        print(String(Array(repeating: " ", count: Constants.outputLinesCount / 4 )) + text)
    }
    
    /// Прерывает выполнение с кодом 1 и диагностикой в stderr.
    ///
    /// Раньше здесь был `fatalError`: CLI падал с трейсом и кодом сигнала, из-за чего
    /// вызывающая сторона не могла отличить ошибку генерации от краха. Контракт
    /// платформенного инструмента DS Builder требует 1 на ошибке выполнения.
    class func terminate(_ text: String) -> Never {
        printText(text)
        FileHandle.standardError.write(Data((text + "\n").utf8))
        exit(1)
    }
    
    class func terminate(with error: Error) -> Never {
        terminate(error.localizedDescription)
    }
}
