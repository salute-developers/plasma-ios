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

    /// Инициализация один раз на класс: XCTest создаёт новый экземпляр тест-кейса
    /// на каждый тест-метод, поэтому instance-флаг не спасает от повторных вызовов.
    private static let themeInitialized: Void = {
        SDDSServTheme.Theme.initialize()
    }()

    override func setUp() {
        super.setUp()
        _ = Self.themeInitialized
    }
}
