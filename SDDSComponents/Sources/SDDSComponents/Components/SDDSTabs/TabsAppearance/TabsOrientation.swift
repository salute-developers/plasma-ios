import Foundation
import SDDSApiInfo

/**
 Ориентация контейнера вкладок.
 
 - Cases:
    - horizontal: Горизонтальное расположение
    - vertical: Вертикальное расположение
 */
public enum TabsOrientation: String, CaseIterable {
    @ApiDefault
    case horizontal
    case vertical
}
