import Foundation

/**
 Протокол для определения ширины строк в текстовом скелетоне.

 Определяет, как рассчитывается ширина каждой строки относительно общей ширины контейнера.
 */
public protocol SkeletonLineWidthProvider {
    /**
     Возвращает коэффициент ширины для конкретной строки.
     
     - Parameters:
        - lineIndex: Индекс строки (начиная с 0).
        - lineCount: Общее количество строк.
     - Returns: Коэффициент ширины от 0.0 до 1.0.
     */
    func widthFactor(lineIndex: Int, lineCount: Int) -> CGFloat
}

/**
 Провайдер для строк с полной шириной.

 Все строки имеют 100% ширину контейнера.
 */
public struct FullWidthLineProvider: SkeletonLineWidthProvider {
    public init() {}
    
    public func widthFactor(lineIndex: Int, lineCount: Int) -> CGFloat {
        1.0
    }
}

/**
 Провайдер для строк с переменной шириной.

 Создает более реалистичный вид текста, где последняя строка короче остальных.
 */
public struct VariedWidthLineProvider: SkeletonLineWidthProvider {
    public init() {}
    
    public func widthFactor(lineIndex: Int, lineCount: Int) -> CGFloat {
        if lineIndex == lineCount - 1 {
            // Последняя строка: 50% ± 15%
            return 0.5 + CGFloat.random(in: -0.15...0.15)
        } else {
            // Остальные строки: 90% ± 5%
            return 0.9 + CGFloat.random(in: -0.05...0.05)
        }
    }
} 