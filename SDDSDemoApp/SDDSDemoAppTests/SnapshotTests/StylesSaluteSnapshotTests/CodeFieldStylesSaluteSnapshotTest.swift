//
//  CodeFieldStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class CodeFieldStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testCodeFieldLCaptionLeftLengthFourStylesSalute() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLCaptionLeftLengthFour(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldMSegmentedLengthFiveStylesSalute() async throws {
        let appearance = CodeField.m.segmented.appearance
        
        try await runSnapshotTest(view: CodeFieldMSegmentedLengthFive(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLLengthSixNoCaptionStylesSalute() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLLengthSixNoCaption(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldMSegmentedLengthSixStylesSalute() async throws {
        let appearance = CodeField.m.segmented.appearance
        
        try await runSnapshotTest(view: CodeFieldMSegmentedLengthSix(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLInputWrongCodeStylesSalute() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLInputWrongCode(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLInputLetterErrorStylesSalute() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLInputLetterError(appearance: appearance))
    }
}
