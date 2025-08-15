//
//  CodeFieldPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 15.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class CodeFieldPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testCodeFieldLCaptionLeftLengthFourPlasmaB2C() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLCaptionLeftLengthFour(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldMSegmentedLengthFivePlasmaB2C() async throws {
        let appearance = CodeField.m.segmented.appearance
        
        try await runSnapshotTest(view: CodeFieldMSegmentedLengthFive(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLLengthSixNoCaptionPlasmaB2C() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLLengthSixNoCaption(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldMSegmentedLengthSixPlasmaB2C() async throws {
        let appearance = CodeField.m.segmented.appearance
        
        try await runSnapshotTest(view: CodeFieldMSegmentedLengthSix(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLInputWrongCodePlasmaB2C() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLInputWrongCode(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLInputLetterErrorPlasmaB2C() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLInputLetterError(appearance: appearance))
    }
}
