//
//  AccordionSpapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 17.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class AccordionSnapshotTest: XCTestCase {
    
    @MainActor
    func testAccordionSolidActionEndSizeLSddsServ() async throws {
        let appearance = AccordionSolidActionEnd.l.appearance
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionCommonVariation(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionSolidActionStartSizeMSddsServ() async throws {
        let appearance = AccordionSolidActionStart.m.appearance
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionSolidActionStartSizeM(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionClearActionEndSizeSHasDividerSddsServ() async throws {
        let appearance = AccordionClearActionEnd.s.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionClearActionEndSizeSHasDivider(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionClearActionStartSizeXsSddsServ() async throws {
        let appearance = AccordionClearActionStart.xs.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionClearActionStartSizeXs(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionSolidActionEndSizeLNoTextSddsServ() async throws {
        let appearance = AccordionSolidActionEnd.l.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionSolidActionEndSizeLNoText(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionSolidActionEndSizeLAmountTenSddsServ() async throws {
        let appearance = AccordionSolidActionEnd.l.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionSolidActionEndSizeLAmountTen(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionClearActionStartSizeH2SddsServ() async throws {
        let appearance = AccordionClearActionStart.h2.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionClearActionStartSizeH2(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionSolidActionEndSizeH2SddsServ() async throws {
        let appearance = AccordionSolidActionEnd.h2.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionCommonVariation(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionSolidActionStartSizeH3SddsServ() async throws {
        let appearance = AccordionSolidActionStart.h3.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionCommonVariation(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionClearActionEndSizeH4SddsServ() async throws {
        let appearance = AccordionClearActionEnd.h4.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionClearActionEndSizeH4(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionClearActionStartSizeH5SddsServ() async throws {
        let appearance = AccordionClearActionStart.h5.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionCommonVariation(appearance: appearance)
                }
        )
    }
    
    @MainActor
    func testAccordionSolidActionEndLongTextSizeLSddsServ() async throws {
        let appearance = AccordionSolidActionEnd.l.appearance
        
        try await runSnapshotTest(
            view:
                ZStack {
                    Color(.secondarySystemBackground)
                    AccordionSolidActionEndLongTextSizeL(appearance: appearance)
                }
        )
    }
}
