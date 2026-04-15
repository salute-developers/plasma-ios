import Foundation
import Combine
import SDDSComponents
import SDDSThemeCore
import SwiftUI
import UIKit

final class TextViewModel: ObservableObject {
    @Published var theme: Theme = .sdddsServTheme
    @Published var subtheme: Subtheme = .none

    @Published var bodyText: String = TextViewModel.defaultBody
    @Published var lineLimit: Int = 5 {
        didSet {
            let clamped = max(1, min(50, lineLimit))
            if clamped != lineLimit {
                lineLimit = clamped
            }
        }
    }
    @Published var softWrap: Bool = true
    @Published var overflow: TextDemoOverflow = .ellipsis
    @Published var colorMode: TextDemoColorMode = .fillColor
    @Published var multilineTextAlignment: TextAlignment = .leading
    @Published var minimumScaleFactor: CGFloat = 1

    init(theme: Theme = .sdddsServTheme, uiState: TextUiState = .init()) {
        self.theme = theme
        apply(uiState: uiState)
    }

    private func apply(uiState: TextUiState) {
        _ = uiState
    }

    var fillStyle: SDDSComponents.FillStyle {
        switch colorMode {
        case .fillColor:
            return .color(TextIconDemoTokens.positiveTextColorToken(theme: theme))
        case .fillBrush:
            return .gradient(TextIconDemoTokens.accentTextGradientToken(theme: theme))
        }
    }

    var previewLineLimit: Int? {
        softWrap ? max(1, lineLimit) : 1
    }

    var resolvedTruncation: Text.TruncationMode {
        switch overflow {
        case .ellipsis:
            return .tail
        case .clip:
            return .tail
        }
    }

    var clipPreviewMaxHeight: CGFloat {
        let lineHeight = ceil(UIFont.preferredFont(forTextStyle: .body).lineHeight)
        let glyphSafetyInset: CGFloat = 4
        return CGFloat(max(1, lineLimit)) * lineHeight + glyphSafetyInset
    }

    var clipEllipsisMaskHeight: CGFloat {
        ceil(UIFont.preferredFont(forTextStyle: .body).lineHeight) + 4
    }

    static let defaultBody =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, " +
        "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " +
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris " +
        "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor " +
        "in reprehenderit in voluptate velit esse cillum dolore"
}

enum TextDemoOverflow: String, CaseIterable, Identifiable {
    case ellipsis
    case clip

    var id: String { rawValue }
}

enum TextDemoColorMode: String, CaseIterable, Identifiable {
    case fillColor
    case fillBrush

    var id: String { rawValue }
}
