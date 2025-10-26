//
//  PlasmaHomeDSThemeTestCase.swift
//  SDDSDemoApp
//
//  Base test case for PlasmaHomeDS theme with proper theme initialization
//

import XCTest
import PlasmaHomeDSTheme

/// Базовый класс для тестов PlasmaHomeDS темы
/// Автоматически инициализирует тему перед каждым тестом
class PlasmaHomeDSThemeTestCase: XCTestCase {
    
    private var themeInitialized = false
    
    override func setUp() {
        super.setUp()
        
        guard !themeInitialized else { return }
        
        let expectation = self.expectation(description: "Theme initialization")
        
        PlasmaHomeDSTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60.0)
    }
    
    private func themeDidInitialize() {
        themeInitialized = true
    }
}

