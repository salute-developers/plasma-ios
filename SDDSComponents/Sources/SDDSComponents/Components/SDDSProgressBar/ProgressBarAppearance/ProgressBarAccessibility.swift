import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ProgressBarAccessibility` определяет параметры доступности для прогресс-бара.
 
 - Properties:
 - progressLabel: Метка доступности для прогресс-бара.
 - progressHint: Подсказка для прогресс-бара.
 */
public struct ProgressBarAccessibility {
    public let progressLabel: String
    public let progressHint: String
    
    /**
     Инициализатор для создания параметров доступности прогресс-бара.
     
     - Parameters:
     - progressLabel: Метка доступности для прогресс-бара.
     - progressHint: Подсказка для прогресс-бара.
     */
    public init(
        progressLabel: String = "Progress",
        progressHint: String = "Shows the current progress."
    ) {
        self.progressLabel = progressLabel
        self.progressHint = progressHint
    }
}
