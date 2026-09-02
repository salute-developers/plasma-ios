//
//  WheelPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class WheelPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {

    /// h4 — единственная вариация HomeDS с включённым индикатором выбранного элемента.
    @MainActor
    func testWheelH4PlasmaHomeDS() async throws {
        let appearance = Wheel.h4.appearance
        try await runSnapshotTest(view: WheelH4(appearance: appearance))
    }

    /// Выравнивание по центру: колонки растянуты, текст по центру своей колонки.
    @MainActor
    func testWheelH4CenterAlignPlasmaHomeDS() async throws {
        let appearance = Wheel.h4.centerAlign.appearance
        try await runSnapshotTest(view: WheelH4CenterAlign(appearance: appearance))
    }

    /// h1 — индикатор выключен, страхует от регресса на вариациях без него.
    @MainActor
    func testWheelH1PlasmaHomeDS() async throws {
        let appearance = Wheel.h1.appearance
        try await runSnapshotTest(view: WheelH1(appearance: appearance))
    }
}
