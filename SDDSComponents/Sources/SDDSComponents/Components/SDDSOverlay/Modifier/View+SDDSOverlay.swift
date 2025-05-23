import SwiftUI

public extension View {
    func overlay(isPresented: Binding<Bool>, appearance: OverlayAppearance) -> some View {
        SDDSOverlay(
            isPresented: isPresented,
            appearance: appearance
        ) {
            self
        }
    }
}

