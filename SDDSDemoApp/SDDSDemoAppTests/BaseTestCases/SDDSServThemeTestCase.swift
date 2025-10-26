//
//  SDDSServThemeTestCase.swift
//  SDDSDemoApp
//
//  Base test case for SDDSServ theme with proper theme initialization
//

import XCTest
import SDDSServTheme

/// Базовый класс для тестов SDDSServ темы
/// Автоматически инициализирует тему перед каждым тестом
class SDDSServThemeTestCase: XCTestCase {
    
    private var themeInitialized = false
    
    override func setUp() {
        super.setUp()
        
        guard !themeInitialized else { return }
        
        let expectation = self.expectation(description: "Theme initialization")
        
        SDDSServTheme.Theme.initialize { [weak self] in
            self?.themeDidInitialize()
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60.0)
    }
    
    private func themeDidInitialize() {
        themeInitialized = true
    }
}

