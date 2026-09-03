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

    /// Инициализация один раз на класс: XCTest создаёт новый экземпляр тест-кейса
    /// на каждый тест-метод, поэтому instance-флаг не спасает от повторных вызовов.
    private static let themeInitialized: Void = {
        PlasmaB2CTheme.Theme.initialize()
    }()

    override func setUp() {
        super.setUp()
        _ = Self.themeInitialized
    }
}
