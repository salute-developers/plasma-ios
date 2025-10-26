//
//  StylesSaluteThemeTestCase.swift
//  SDDSDemoApp
//
//  Base test case for StylesSalute theme with proper theme initialization
//

import XCTest
import StylesSaluteTheme

/// Базовый класс для тестов StylesSalute темы
/// Автоматически инициализирует тему перед каждым тестом
class StylesSaluteThemeTestCase: XCTestCase {
    
    private var themeInitialized = false
    
    override func setUp() {
        super.setUp()
        
        guard !themeInitialized else { return }
        
        let expectation = self.expectation(description: "Theme initialization")
        
        StylesSaluteTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60.0)
    }
    
    private func themeDidInitialize() {
        themeInitialized = true
    }
}

