//
//  PlasmaHomeDSThemeTestCase.swift
//  SDDSDemoApp
//
//  Base test case for PlasmaHomeDS theme with proper theme initialization
//

import XCTest
import PlasmaHomeDSTheme

/// Базовый класс для тестов PlasmaHomeDS темы.
///
/// Инициализация один раз на класс: XCTest создаёт новый экземпляр тест-кейса
/// на каждый тест-метод, поэтому instance-флаг не спасает от повторных вызовов.
class PlasmaHomeDSThemeTestCase: XCTestCase {

    private static let themeInitialized: Void = {
        PlasmaHomeDSTheme.Theme.initialize()
    }()

    override func setUp() {
        super.setUp()
        _ = Self.themeInitialized
    }
}
