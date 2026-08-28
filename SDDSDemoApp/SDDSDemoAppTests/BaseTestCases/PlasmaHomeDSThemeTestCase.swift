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
/// HomeDS использует системный SF Pro и ничего не скачивает, поэтому тема
/// инициализируется синхронно: ни `XCTestExpectation`, ни 60-секундного
/// `wait(for:)` здесь больше нет. Инициализация делается один раз на класс —
/// XCTest создаёт новый экземпляр тест-кейса на каждый тест-метод, поэтому
/// instance-флаг не помогал и `setUp` отрабатывал заново для каждого теста.
class PlasmaHomeDSThemeTestCase: XCTestCase {

    private static let themeInitialized: Void = {
        PlasmaHomeDSTheme.Theme.initialize()
    }()

    override func setUp() {
        super.setUp()
        _ = Self.themeInitialized
    }
}
