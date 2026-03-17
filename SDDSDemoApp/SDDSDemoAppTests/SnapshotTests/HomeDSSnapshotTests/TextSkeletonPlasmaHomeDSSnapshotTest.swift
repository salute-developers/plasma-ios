//
//  TextSkeletonPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.03.2026.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class TextSkeletonPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testTextSkeletonBodyLHomeDS() async throws {
        let appearance = TextSkeletonBody.l.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonBodyMHomeDS() async throws {
        let appearance = TextSkeletonBody.m.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonBodySHomeDS() async throws {
        let appearance = TextSkeletonBody.s.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonBodyXsHomeDS() async throws {
        let appearance = TextSkeletonBody.xs.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonBodyXxsHomeDS() async throws {
        let appearance = TextSkeletonBody.xxs.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonDisplayLHomeDS() async throws {
        let appearance = TextSkeletonDisplay.l.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonDisplayMHomeDS() async throws {
        let appearance = TextSkeletonDisplay.m.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonDisplaySHomeDS() async throws {
        let appearance = TextSkeletonDisplay.s.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonH1HomeDS() async throws {
        let appearance = TextSkeletonHeader.h1.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonH2HomeDS() async throws {
        let appearance = TextSkeletonHeader.h2.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonH3HomeDS() async throws {
        let appearance = TextSkeletonHeader.h3.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonH4HomeDS() async throws {
        let appearance = TextSkeletonHeader.h4.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonH5HomeDS() async throws {
        let appearance = TextSkeletonHeader.h5.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonH6HomeDS() async throws {
        let appearance = TextSkeletonHeader.h6.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonTextLHomeDS() async throws {
        let appearance = TextSkeletonText.l.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonTextMHomeDS() async throws {
        let appearance = TextSkeletonText.m.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonTextSHomeDS() async throws {
        let appearance = TextSkeletonText.s.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
    
    @MainActor
    func testTextSkeletonTextHomeDS() async throws {
        let appearance = TextSkeletonText.xs.appearance
        
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom(appearance: appearance))
    }
}
