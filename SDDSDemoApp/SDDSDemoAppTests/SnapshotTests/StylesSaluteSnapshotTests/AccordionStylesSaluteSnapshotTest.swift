//
//  AccordionStylesSaluteSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 18.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import StylesSaluteTheme
import UIKit
import SwiftUI

final class AccordionStylesSaluteSnapshotTest: StylesSaluteThemeTestCase {
    
    @MainActor
    func testAccordionSolidActionEndSizeLStylesSalute() async throws {
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
    func testAccordionSolidActionStartSizeMStylesSalute() async throws {
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
    func testAccordionClearActionEndSizeSHasDividerStylesSalute() async throws {
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
    func testAccordionClearActionStartSizeXsStylesSalute() async throws {
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
    func testAccordionSolidActionEndSizeLNoTextStylesSalute() async throws {
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
    func testAccordionSolidActionEndSizeLAmountTenStylesSalute() async throws {
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
    func testAccordionClearActionStartSizeH2StylesSalute() async throws {
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
    func testAccordionSolidActionEndSizeH2StylesSalute() async throws {
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
    func testAccordionSolidActionStartSizeH3StylesSalute() async throws {
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
    func testAccordionClearActionEndSizeH4StylesSalute() async throws {
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
    func testAccordionClearActionStartSizeH5StylesSalute() async throws {
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
    func testAccordionSolidActionEndLongTextSizeLStylesSalute() async throws {
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
