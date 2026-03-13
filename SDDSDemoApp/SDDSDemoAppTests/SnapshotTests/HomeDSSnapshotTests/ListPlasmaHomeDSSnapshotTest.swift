//
//  ListPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.10.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class ListPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testListNormalSizeSHasDisclosureHomeDS() async throws {
        let appearance = List.s.appearance
        try await runSnapshotTest(view: ListNormalSizeXlHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeSNoDisclosureHomeDS() async throws {
        let appearance = List.s.appearance
        try await runSnapshotTest(view: ListNormalSizeL(appearance: appearance))
    }
    
    @MainActor
    func testListNormalSizeSAmountTwentyHomeDS() async throws {
        let appearance = List.s.appearance
        try await runSnapshotTest(view: ListNormalSizeXsAmountTwenty(appearance: appearance))
    }
    @MainActor
    func testListSNoBackgroundHasItemBackgroundHomeDS() async throws {
        let appearance = List.s.noBackground.hasItemBackground.appearance
        try await runSnapshotTest(view: ListNormalSizeXlHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testListSHasBackgroundHomeDS() async throws {
        let appearance = List.s.hasBackground.appearance
        try await runSnapshotTest(view: ListNormalSizeXlHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testListNumberedHomeDS() async throws {
        let appearance = ListNumbered.s.appearance
        try await runSnapshotTest(view: ListCounter(appearance: appearance))
    }
}
