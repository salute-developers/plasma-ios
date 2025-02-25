import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct Cell<LeftContent: View, RightContent: View>: View {
    public let appearance: CellAppearance
    public let alignment: CellContentAlignment
    
    public let label: String
    public let title: String
    public let subtitle: String
    
    public let disclosureEnabled: Bool
    public let disclosureImage: Image?
    public let disclosureText: String
    
    public let leftContent: LeftContent
    public let rightContent: RightContent
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(
        appearance: CellAppearance = CellAppearance(),
        alignment: CellContentAlignment = .center,
        label: String = "",
        title: String = "",
        subtitle: String = "",
        disclosureEnabled: Bool = false,
        disclosureImage: Image? = nil,
        disclosureText: String = "",
        @ViewBuilder leftContent: @escaping () -> LeftContent,
        @ViewBuilder rightContent: @escaping () -> RightContent
    ) {
        self.appearance = appearance
        self.alignment = alignment
        self.label = label
        self.title = title
        self.subtitle = subtitle
        self.disclosureEnabled = disclosureEnabled
        self.disclosureImage = disclosureImage
        self.disclosureText = disclosureText
        self.leftContent = leftContent()
        self.rightContent = rightContent()
    }
    
    public var body: some View {
        HStack(alignment: contentAlignment, spacing: 0) {
            leftContent
            Spacer()
                .frame(width: appearance.size.contentPaddingStart)
            centerView
            Spacer()
                .frame(width: appearance.size.contentPaddingEnd)
            rightContent
            disclosure
        }
    }
}

extension Cell {
    @ViewBuilder
    private var centerView: some View {
        if hasCenterContent {
            VStack(spacing: 0) {
                if !label.isEmpty {
                    HStack {
                        value(for: label, typography: typographyToken(for: appearance.labelTypography), textColor: appearance.labelColor)
                        Spacer()
                    }
                }
                if !title.isEmpty {
                    HStack {
                        value(for: title, typography: typographyToken(for: appearance.titleTypography), textColor: appearance.titleColor)
                        Spacer()
                    }
                }
                if !subtitle.isEmpty {
                    HStack {
                        value(for: subtitle, typography: typographyToken(for: appearance.subtitleTypography), textColor: appearance.subtitleColor)
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    // MARK: - Other additional view
    @ViewBuilder
    private func value(for value: String, typography: TypographyToken, textColor: ColorToken) -> some View {
        Text(value)
            .typography(typography)
            .foregroundColor(textColor.color(for: colorScheme))
    }
    
    // MARK: - Disclosure
    @ViewBuilder
    private var disclosure: some View {
        if disclosureEnabled {
            disclosureDefault
        } else if let disclosureImage = disclosureImage {
            value(for: disclosureText, typography: typographyToken(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
                .fixedSize()
            disclosureImage
        }
    }
    
    @ViewBuilder
    private var disclosureDefault: some View {
        HStack(spacing: 0) {
            value(for: disclosureText, typography: typographyToken(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
                .fixedSize()
            ZStack {
                if let image = appearance.disclosureImage {
                    image
                        .renderingMode(.template)
                        .foregroundColor(appearance.disclosureImageColor.color(for: colorScheme))
                }
            }
        }
    }
    
    // MARK: - Computed values
    private var hasCenterContent: Bool {
        !label.isEmpty || !title.isEmpty || !subtitle.isEmpty
    }
    
    // MARK: - Typography
    private func typographyToken(for text: TypographyConfiguration) -> TypographyToken {
        if let typography = text.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Cell Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    // MARK: - Alignment
    private var contentAlignment: VerticalAlignment {
        switch alignment {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        }
    }
}
