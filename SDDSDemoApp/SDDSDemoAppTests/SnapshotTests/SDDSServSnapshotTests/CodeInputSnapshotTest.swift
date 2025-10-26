//
//  CodeInputSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 11.09.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CodeInputSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testCodeInputLCodeLengthFourCaptionLeft() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(view: CodeInputLCodeLengthFourCaptionLeft(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputMCodeLengthFiveCaptionCenter() async throws {
        let appearance = CodeInput.m.appearance
        try await runSnapshotTest(view: CodeInputMCodeLengthFiveCaptionCenter(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputSCodeLengthSix() async throws {
        let appearance = CodeInput.s.appearance
        try await runSnapshotTest(view: CodeInputSCodeLengthSix(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputSCodeLengthSixNoCaption() async throws {
        let appearance = CodeInput.s.appearance
        try await runSnapshotTest(view: CodeInputSCodeLengthSixNoCaption(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputMCodeLengthSixHidden() async throws {
        let appearance = CodeInput.m.appearance
        try await runSnapshotTest(view: CodeInputMCodeLengthSixHidden(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputLInputLetterError() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(
            view: CodeInputLInputLetterError(appearance: appearance),
            landscape: true
        )
    }
    
    @MainActor
    func testCodeInputLInputWrongCode() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(
            view: CodeInputLInputWrongCode(appearance: appearance),
            landscape: true
        )
    }
    
    @MainActor
    func testCodeInputCorrectCode() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(view: CodeInputCorrectCode(appearance: appearance))
    }
    
    @MainActor
    func testCodeInputCaptionLongText() async throws {
        let appearance = CodeInput.l.appearance
        try await runSnapshotTest(view: CodeInputCaptionLongText(appearance: appearance))
    }
}
