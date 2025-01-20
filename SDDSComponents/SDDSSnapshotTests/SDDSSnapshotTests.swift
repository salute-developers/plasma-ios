//
//  SDDSSnapshotTests.swift
//  SDDSSnapshotTests
//
//  Created by Булинов Ангрик Александрович on 17.01.2025.
//

import XCTest
import SnapshotTesting
import SwiftUI
import SDDSComponents
import SDDSServTheme
import Foundation
@_exported import SDDSThemeCore

extension SnapshotTestingConfiguration.DiffTool {
    static let compare = Self { old, new in
        "open -a Preview \(old) \(new)"
    }
}

class SDDSSnapshotTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Theme.initialize()
    }
    
    override func invokeTest() {
           withSnapshotTesting(
               record: .never,
               diffTool: .compare
           ) {
               super.invokeTest()
           }
       }
    
    struct BasicButtonView: View {
        var body: some View {
            BasicButton(
                title: "Label",
                subtitle: "Value",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image.image("spinner"),
                appearance: BasicButton.large.warning.appearance,
                layoutMode: .wrapContent,
                action: {}
            )
        }
    }
    
    struct BasicButtonisLoading: View {
        var body: some View {
            BasicButton(
                title: "Label",
                subtitle: "Value",
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                isDisabled: false,
                isLoading: true,
                spinnerImage: Image.image("spinner"),
                appearance: BasicButton.medium.default.appearance,
                layoutMode: .wrapContent,
                action: {}
            )
        }
    }
    
    struct IconButtonView: View {
        var body: some View {
            IconButton(
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image.image("spinner"),
                appearance: IconButton.large.default.appearance,
                layoutMode: .fixedWidth(.packed),
                action: {}
            )
        }
    }
    
    struct RadioboxView: View {
        var body: some View {
            SDDSRadiobox(
                isSelected: .constant(true),
                title: "Value",
                subtitle: "Description",
                isEnabled: true,
                images: .defaultImages,
                appearance: SDDSRadiobox.medium.default.appearance
            )
        }
    }
    
    struct SwitchView: View {
        var body: some View {
            SDDSSwitch(
                title: "Label",
                subtitle: "Description",
                isOn: .constant(true),
                isEnabled: true,
                appearance: SDDSSwitch.large.default.appearance,
                switchAccessibility: SwitchAccessibility()
            )
        }
    }
    
    struct CheckBoxView: View {
        var body: some View {
            SDDSCheckbox(
                state: .constant(.indeterminate),
                title: "Value",
                subtitle: "Description",
                isEnabled: true,
                images: .checkbox,
                appearance: SDDSCheckbox.medium.default.appearance
            )
        }
    }
    
    struct ProgressBarView: View {
        var body: some View {
            SDDSProgressView(
                progress: .constant(0.5),
                isEnabled: true,
                appearance: SDDSProgressView.default.appearance
            )
        }
    }
    
    struct SDDSProgressBarPreview: PreviewProvider {
        static var previews: some View {
            SDDSProgressView(
                progress: .constant(0.5),
                isEnabled: true,
                appearance: SDDSProgressView.default.appearance
            )
            .frame(width: 340, height: 60)
        }
    }

    func testBasicButton() throws {
        let button = BasicButtonView()
        let hostingController = UIHostingController(rootView: button)
        
        assertSnapshot(of: hostingController, as: .image(on: .iPhone13))
    }
    
    func testBasicButton2() throws {
        let button = BasicButtonView()
        
        assertSnapshot(of: button, as: .image)
    }
    
    func testIconButton() throws {
        let iconButton = IconButtonView()
        
        assertSnapshot(of: iconButton, as: .image)
    }
    
    func testSwitch() throws {
        let switchView = SwitchView()
        let hostingController = UIHostingController(rootView: switchView)
        
        assertSnapshot(of: hostingController, as: .image(on: .iPhone13))
    }
    
    func testProgressBar() throws {
//        let progressBar = ProgressBarView()
//        let hostingController = UIHostingController(rootView: progressBar)
        
        assertSnapshot(of: SDDSProgressBarPreview.previews, as: .image)
    }
    
    func testBasicButtonisLoading() throws {
        let buttonIsLoading = BasicButtonisLoading()
        
        assertSnapshot(of: buttonIsLoading, as: .image, record: true)
    }
    
    func testCheckBox() throws {
        let checkBoxView = CheckBoxView()
        let hostingController = UIHostingController(rootView: checkBoxView)
        
        assertSnapshot(of: hostingController, as: .image, record: true)
    }
    
    func testRadiobox() throws {
        let radioboxView = RadioboxView()
        
        assertSnapshot(of: radioboxView, as: .image, record: true)
    }
}
