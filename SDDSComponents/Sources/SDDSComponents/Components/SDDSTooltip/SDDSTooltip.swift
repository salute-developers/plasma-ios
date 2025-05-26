import SwiftUI
import SDDSThemeCore

struct SDDSTooltip<ContentStart: View>: View {
    let appearance: TooltipAppearance
    let size: TooltipSizeConfiguration
    let text: String
    let contentStart: () -> ContentStart
    
    var body: some View {
        HStack(spacing: size.contentStartPadding) {
            contentStart()
            Text(text)
        }
        .padding(.leading, size.paddingStart)
        .padding(.trailing, size.paddingEnd)
        .padding(.top, size.paddingTop)
        .padding(.bottom, size.paddingBottom)
    }
} 
