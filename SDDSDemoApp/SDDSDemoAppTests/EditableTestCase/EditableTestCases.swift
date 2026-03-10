//
//  EditableTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 10.03.2026.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Editable]
 */

/**
 PLASMA-T2536
 */
struct EditableSingleLineRelativeStart: View {
    var appearance: EditableAppearance
    @State var text: String = "Value"
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: true,
            readOnly: false,
            singleLine: true,
            textAlign: .leading,
            iconPlacement: .relative,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
    }
}

/**
 PLASMA-T2537
 */
struct EditableDisabled: View {
    var appearance: EditableAppearance
    @State var text: String = "Value"
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: false,
            readOnly: false,
            singleLine: true,
            textAlign: .center,
            iconPlacement: .relative,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
    }
}

/**
 PLASMA-T2538
 */
struct EditableMultiLineAbsoluteEnd: View {
    var appearance: EditableAppearance
    @State private var text: String = """
Lorem Ipsum is simply dummy text of 
the printing and typesetting industry.
Lorem Ipsum has been the industry's 
standard dummy text ever since the 1500s, 
when an unknown printer took a galley 
of type and scrambled it to make a type 
specimen book. 
"""
    var body: some View {
        ZStack {
            VStack {
                SDDSEditable(
                    text: $text,
                    enabled: true,
                    readOnly: false,
                    singleLine: false,
                    textAlign: .trailing,
                    iconPlacement: .absolute,
                    appearance: appearance,
                    iconContent: Action {
                        Asset.editFill24.image
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                )
                .padding(.trailing, 50)
                .padding(.vertical, 70)
            }
            .frame(width: 350)
            .padding(.horizontal, 12)
        }
    }
}

/**
 PLASMA-T2540
 */
struct EditableSingleLineAbsoluteCenterLongText: View {
    var appearance: EditableAppearance
    @State var text: String = longText
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: true,
            readOnly: false,
            singleLine: true,
            textAlign: .center,
            iconPlacement: .absolute,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
    }
}

/**
 PLASMA-T2541
 */
struct EditableMultiLineRelativeStart: View {
    var appearance: EditableAppearance
    @State var text: String = longText
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: true,
            readOnly: false,
            singleLine: false,
            textAlign: .leading,
            iconPlacement: .relative,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
    }
}

/**
 PLASMA-T2543
 */
struct EditableMultiLineRelativeCenter: View {
    var appearance: EditableAppearance
    @State var text: String = "!@#$%^&*()"
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: true,
            readOnly: false,
            singleLine: false,
            textAlign: .center,
            iconPlacement: .relative,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
    }
}

/**
 PLASMA-T2544
 */
struct EditableReadOnly: View {
    var appearance: EditableAppearance
    @State var text: String = "Value"
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: true,
            readOnly: true,
            singleLine: true,
            textAlign: .leading,
            iconPlacement: .relative,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
    }
}

/**
 PLASMA-T2545
 */
struct EditableMultiLineRelativeCenterLongText: View {
    var appearance: EditableAppearance
    @State var text: String = longText
    
    var body: some View {
        VStack {
            SDDSEditable(
                text: $text,
                enabled: true,
                readOnly: false,
                singleLine: false,
                textAlign: .center,
                iconPlacement: .relative,
                appearance: appearance,
                iconContent: Action {
                    Asset.editFill24.image
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            )
        }
        .padding(.vertical, 20)
    }
}

/**
 PLASMA-T2577
 */
struct EditableNoText: View {
    var appearance: EditableAppearance
    @State var text: String = ""
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: true,
            readOnly: false,
            singleLine: true,
            textAlign: .leading,
            iconPlacement: .relative,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
    }
}

/**
 PLASMA-T2541
 */
struct EditableSingleLineRelativeStartLongText: View {
    var appearance: EditableAppearance
    @State var text: String = longText
    
    var body: some View {
        SDDSEditable(
            text: $text,
            enabled: true,
            readOnly: false,
            singleLine: false,
            textAlign: .leading,
            iconPlacement: .relative,
            appearance: appearance,
            iconContent: Action {
                Asset.editFill24.image
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        )
        .padding(.vertical, 20)
    }
}

private let longText = """
Lorem Ipsum is simply dummy text of the printing 
and typesetting industry. Lorem Ipsum has been the 
industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and 
scrambled it to make a type specimen book. 
"""
