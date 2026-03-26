import Foundation
import SwiftUI
import SDDSThemeCore

struct GradientPickerView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @Binding private var selectedGradient: GradientToken?
    
    init(selectedGradient: Binding<GradientToken?> = .constant(nil)) {
        _selectedGradient = selectedGradient
    }

    var body: some View {
        NavigationView {
            List(availableTokens, id: \.self) { token in
                Button(action: {
                    selectedGradient = token
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Rectangle()
                            .gradient(token, colorScheme: colorScheme)
                            .frame(width: 32, height: 32)
                        Spacer()
                        Text(token.description)
                            .font(.caption)
                            .padding(.leading, 8)
                    }
                }
            }
            .navigationTitle("Select a Gradient")
        }
    }

    private var availableTokens: [GradientToken] {
        #if SANDBOX_DS_SERV || SANDBOX_DS_PLASMA_B2C || SANDBOX_DS_PLASMA_HOME_DS
        []
        #else
        GradientToken.tokens
        #endif
    }
}

struct GradientPickerPreview: PreviewProvider {
    static var previews: some View {
        GradientPickerView(selectedGradient: .constant(nil))
    }
}
