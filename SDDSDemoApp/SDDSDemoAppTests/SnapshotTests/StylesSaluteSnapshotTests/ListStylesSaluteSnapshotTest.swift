//
//  ListStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class ListStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testListNormalSizeXlHasDisclosureStylesSalute() async throws {
        let appearance = ListNormal.xl.appearance
        try await runSnapshotTest(view: ListNormalSizeXlHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeLStylesSalute() async throws {
        let appearance = ListNormal.l.appearance
        try await runSnapshotTest(view: ListNormalSizeL(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeMStylesSalute() async throws {
        let appearance = ListNormal.m.appearance
        try await runSnapshotTest(view: ListNormalSizeM(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeSStylesSalute() async throws {
        let appearance = ListNormal.s.appearance
        try await runSnapshotTest(view: ListNormalSizeS(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeXsAmountTwentyStylesSalute() async throws {
        let appearance = ListNormal.xs.appearance
        try await runSnapshotTest(view: ListNormalSizeXsAmountTwenty(appearance: appearance))
    }
    
    @MainActor
    func testListTightSizeXsHasDisclosureStylesSalute() async throws {
        let appearance = ListTight.xs.appearance
        try await runSnapshotTest(view: ListTightSizeXsHasDisclosure(appearance: appearance))
    }
}
