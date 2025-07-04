//
//  ListSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 04.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class ListSnapshotTest: XCTestCase {
    
    @MainActor
    func testListNormalSizeXlHasDisclosure() async throws {
        try await runSnapshotTest(view: ListNormalSizeXlHasDisclosure())
    }
    
    @MainActor
    func testListNormalSizeL() async throws {
        try await runSnapshotTest(view: ListNormalSizeL())
    }
    
    @MainActor
    func testListNormalSizeM() async throws {
        try await runSnapshotTest(view: ListNormalSizeM())
    }
    
    @MainActor
    func testListNormalSizeS() async throws {
        try await runSnapshotTest(view: ListNormalSizeS())
    }
    
    @MainActor
    func testListNormalSizeXsAmountTwenty() async throws {
        try await runSnapshotTest(view: ListNormalSizeXsAmountTwenty())
    }
    
    @MainActor
    func testListTightSizeXsHasDisclosure() async throws {
        try await runSnapshotTest(view: ListTightSizeXsHasDisclosure())
    }
}
