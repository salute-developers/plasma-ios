import SwiftUI
import Combine
import SDDSServTheme
import StylesSaluteTheme
import PlasmaB2CTheme
import PlasmaHomeDSTheme

final class SDDSDemoAppViewModel: ObservableObject {
    @Published var isInitialized = false
    
    private var initializationCount = 0
    private let totalThemes = 4
    
    func initializeThemes() {
        guard !isInitialized else { return }
        
        // Инициализируем все темы параллельно
        SDDSServTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
        }
        
        StylesSaluteTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
        }
        
        PlasmaB2CTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
        }
        
        PlasmaHomeDSTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
        }
    }
    
    private func themeDidInitialize() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.initializationCount += 1
            
            if self.initializationCount >= self.totalThemes {
                self.isInitialized = true
            }
        }
    }
}
