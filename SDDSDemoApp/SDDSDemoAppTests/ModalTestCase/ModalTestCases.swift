//
//  ModalTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест кейсы для компонента [Modal]
 */

/**
 PLASMA-T2046
 */
struct ModalUseNativeBlackOutHasClose: View {
    var appearance: ModalAppearance
    
    var body: some View {
        ZStack {
            backgroundBlackOut(useNativeBlackout: true)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                SDDSModal(
                    content: {
                        HStack(spacing: 24) {
                            Text("Modal")
                            Spacer()
                        }
                        .frame(width: 120)
                    },
                    closeImage: Image(systemName: "xmark"),
                    appearance: appearance,
                    onClose: {}
                )
                .frame(width: 300, height: 200)
                Spacer()
            }
        }
    }
}

/**
 PLASMA-T2047
 */
struct ModalWithoutNativeBlackOut: View {
    var appearance: ModalAppearance
    
    var body: some View {
        ZStack {
            backgroundBlackOut(useNativeBlackout: false)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                SDDSModal(
                    content: {
                        HStack(spacing: 24) {
                            Text("Modal")
                            Spacer()
                        }
                        .frame(width: 120)
                    },
                    closeImage: nil,
                    appearance: appearance,
                    onClose: {}
                )
                .frame(width: 300, height: 200)
                Spacer()
            }
        }
    }
}

private func backgroundBlackOut(useNativeBlackout: Bool) -> some View {
    Group {
        if useNativeBlackout {
            Color(.systemGray5).opacity(0.6)
        } else {
            Color.clear
        }
    }
}
