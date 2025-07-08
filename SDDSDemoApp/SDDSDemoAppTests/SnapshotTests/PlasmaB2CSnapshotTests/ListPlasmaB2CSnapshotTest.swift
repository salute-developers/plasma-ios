//
//  ListPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 08.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class ListPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testListNormalSizeXlHasDisclosurePlasmaB2C() async throws {
        let appearance = ListNormal.xl.appearance
        try await runSnapshotTest(view: ListNormalSizeXlHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeLPlasmaB2C() async throws {
        let appearance = ListNormal.l.appearance
        try await runSnapshotTest(view: ListNormalSizeL(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeMPlasmaB2C() async throws {
        let appearance = ListNormal.m.appearance
        try await runSnapshotTest(view: ListNormalSizeM(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeSPlasmaB2C() async throws {
        let appearance = ListNormal.s.appearance
        try await runSnapshotTest(view: ListNormalSizeS(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeXsAmountTwentyPlasmaB2C() async throws {
        let appearance = ListNormal.xs.appearance
        try await runSnapshotTest(view: ListNormalSizeXsAmountTwenty(appearance: appearance))
    }
    
    @MainActor
    func testListTightSizeXsHasDisclosurePlasmaB2C() async throws {
        let appearance = ListTight.xs.appearance
        try await runSnapshotTest(view: ListTightSizeXsHasDisclosure(appearance: appearance))
    }
}
