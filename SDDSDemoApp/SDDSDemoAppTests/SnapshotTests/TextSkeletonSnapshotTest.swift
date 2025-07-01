//
//  TextSkeletonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class TextSkeletonSnapshotTest: XCTestCase {
    
    @MainActor
    func testTextSkeletonTestNoTextRandom() async throws {
        try await runSnapshotTest(view: TextSkeletonTestNoTextRandom())
    }
    
    @MainActor
    func testTextSkeletonTestFullWidth() async throws {
        try await runSnapshotTest(view: TextSkeletonTestFullWidth())
    }
}
