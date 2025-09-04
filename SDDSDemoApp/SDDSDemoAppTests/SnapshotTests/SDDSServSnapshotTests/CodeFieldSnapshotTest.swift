//
//  CodeFieldSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 15.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CodeFieldSnapshotTest: XCTestCase {
    
    @MainActor
    func testCodeFieldLCaptionLeftLengthFour() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLCaptionLeftLengthFour(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldMSegmentedLengthFive() async throws {
        let appearance = CodeField.m.segmented.appearance
        
        try await runSnapshotTest(view: CodeFieldMSegmentedLengthFive(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLLengthSixNoCaption() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLLengthSixNoCaption(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldMSegmentedLengthSix() async throws {
        let appearance = CodeField.m.segmented.appearance
        
        try await runSnapshotTest(view: CodeFieldMSegmentedLengthSix(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLInputWrongCode() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLInputWrongCode(appearance: appearance))
    }
    
    @MainActor
    func testCodeFieldLInputLetterError() async throws {
        let appearance = CodeField.l.variation.appearance
        
        try await runSnapshotTest(view: CodeFieldLInputLetterError(appearance: appearance))
    }
}
