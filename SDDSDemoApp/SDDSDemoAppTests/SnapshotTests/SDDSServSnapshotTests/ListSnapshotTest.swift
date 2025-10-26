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

final class ListSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testListNormalSizeXlHasDisclosure() async throws {
        let appearance = ListNormal.xl.appearance
        try await runSnapshotTest(view: ListNormalSizeXlHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeL() async throws {
        let appearance = ListNormal.l.appearance
        try await runSnapshotTest(view: ListNormalSizeL(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeM() async throws {
        let appearance = ListNormal.m.appearance
        try await runSnapshotTest(view: ListNormalSizeM(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeS() async throws {
        let appearance = ListNormal.s.appearance
        try await runSnapshotTest(view: ListNormalSizeS(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeXsAmountTwenty() async throws {
        let appearance = ListNormal.xs.appearance
        try await runSnapshotTest(view: ListNormalSizeXsAmountTwenty(appearance: appearance))
    }
    
    @MainActor
    func testListTightSizeXsHasDisclosure() async throws {
        let appearance = ListTight.xs.appearance
        try await runSnapshotTest(view: ListTightSizeXsHasDisclosure(appearance: appearance))
    }
}
