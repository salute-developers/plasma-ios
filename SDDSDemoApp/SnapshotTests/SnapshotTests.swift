//
//  SnapshotTests.swift
//  SnapshotTests
//
//  Created by Vladimir Kaltyrin on 17.03.2025.
//

import XCTest
import SwiftUI
import UIKit
import SDDSServTheme
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDSnapshots

final class Snapshot_tests: XCTestCase {
    private let deviceGroup: SnapshotDeviceGroup = (.phone + .tablet).universal

    func test_cellView() async {
        await Xct.snapshotAsync(mode: .record, deviceGroup: deviceGroup) { device in
            let viewModel = CellViewModel()
            viewModel.label = "Hello, World!"
            let view = CellView(viewModel: viewModel)
            
            let sut = UIHostingController(rootView: view)
            return sut
        }
    }
    
    func test_button_component() async {
        await Xct.snapshotAsync(mode: .record, deviceGroup: deviceGroup) { device in
            let view = SDDSButton(
                title: "title",
                subtitle: "subtitle",
                appearance: BasicButton.m.default.appearance,
                action: {}
            )
            view.environment(\.colorScheme, .dark)
            
            let sut = UIHostingController(rootView: view)
            return sut
        }
    }

}
