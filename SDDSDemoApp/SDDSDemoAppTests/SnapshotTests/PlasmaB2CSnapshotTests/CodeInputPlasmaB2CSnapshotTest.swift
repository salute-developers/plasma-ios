//
//  CodeInputPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 11.09.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class CodeInputPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testCodeInputLCodeLengthFourCaptionLeftPlasmaB2C() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(view: CodeInputLCodeLengthFourCaptionLeft(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputMCodeLengthFiveCaptionCenterPlasmaB2C() async throws {
        let appearance = CodeInput.m.appearance
        try await runSnapshotTest(view: CodeInputMCodeLengthFiveCaptionCenter(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputSCodeLengthSixPlasmaB2C() async throws {
        let appearance = CodeInput.s.appearance
        try await runSnapshotTest(view: CodeInputSCodeLengthSix(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputSCodeLengthSixNoCaptionPlasmaB2C() async throws {
        let appearance = CodeInput.s.appearance
        try await runSnapshotTest(view: CodeInputSCodeLengthSixNoCaption(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputMCodeLengthSixHiddenPlasmaB2C() async throws {
        let appearance = CodeInput.m.appearance
        try await runSnapshotTest(view: CodeInputMCodeLengthSixHidden(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputLInputLetterErrorPlasmaB2C() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(
            view: CodeInputLInputLetterError(appearance: appearance),
            landscape: true
        )
    }
    
    @MainActor
    func testCodeInputLInputWrongCodePlasmaB2C() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(
            view: CodeInputLInputWrongCode(appearance: appearance),
            landscape: true
        )
    }
    
    @MainActor
    func testCodeInputCorrectCodePlasmaB2C() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(view: CodeInputCorrectCode(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputCaptionLongText() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(view: CodeInputCaptionLongText(appearance: appearance))
    }
}
