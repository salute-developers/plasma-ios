import Foundation

/**
 `CodeFieldGroup` представляет собой группу полей для ввода кода.
 
 - Parameters:
   - count: Количество полей в группе
 */
public struct CodeFieldGroup {
    public let count: UInt
    
    public init(count: UInt) {
        self.count = count
    }
    
    // MARK: - Factory Methods
    
    /// Создает группу с 4 полями
    public static var four: [CodeFieldGroup] {
        [CodeFieldGroup(count: 4)]
    }
    
    /// Создает группу с 5 полями
    public static var five: [CodeFieldGroup] {
        [CodeFieldGroup(count: 5)]
    }
    
    /// Создает две группы по 3 поля каждая
    public static var six: [CodeFieldGroup] {
        [CodeFieldGroup(count: 3), CodeFieldGroup(count: 3)]
    }
}
