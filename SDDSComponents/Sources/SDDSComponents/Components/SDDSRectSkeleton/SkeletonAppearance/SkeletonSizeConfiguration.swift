import Foundation

/**
 Протокол для конфигурации размеров скелетона.

 Определяет базовые требования для настройки размеров скелетона.
 */
public protocol SkeletonSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {}

/**
 Конфигурация размеров скелетона с нулевыми значениями.

 Используется как значение по умолчанию для создания пустых конфигураций.
 */
public struct ZeroSkeletonSizeConfiguration: SkeletonSizeConfiguration {
    public var debugDescription: String {
        "ZeroSkeletonSizeConfiguration"
    }
    public init() {}
} 