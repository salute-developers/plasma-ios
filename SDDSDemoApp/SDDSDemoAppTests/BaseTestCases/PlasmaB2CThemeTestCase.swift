//
//  PlasmaB2CThemeTestCase.swift
//  SDDSDemoApp
//
//  Base test case for PlasmaB2C theme with proper theme initialization
//

import XCTest
import PlasmaB2CTheme

/// Базовый класс для тестов PlasmaB2C темы
/// Автоматически инициализирует тему перед каждым тестом
class PlasmaB2CThemeTestCase: XCTestCase {
    
    private var themeInitialized = false
    
    override func setUp() {
        super.setUp()
        
        guard !themeInitialized else { return }
        
        let expectation = self.expectation(description: "Theme initialization")
        
        PlasmaB2CTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60.0)
    }
    
    private func themeDidInitialize() {
        themeInitialized = true
    }
}

