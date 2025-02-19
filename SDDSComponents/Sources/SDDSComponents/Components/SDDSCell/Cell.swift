import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct Cell: View {
    public let appearance: CellAppearance
    public let alignment: CellContentAlignment
    
    public let label: String
    public let title: String
    public let subtitle: String
    
    public let disclosureIcon: Image?
    public let disclosureText: String
    
    public let leftContent: AnyView
    public let centerContent: AnyView
    public let rightContent: AnyView
    public let disclosure: AnyView
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(
        appearance: CellAppearance,
        alignment: CellContentAlignment = .center,
        label: String = "",
        title: String = "",
        subtitle: String = "",
        disclosureIcon: Image? = nil,
        disclosureText: String = "",
        @ViewBuilder leftContent: @escaping () -> some View,
        @ViewBuilder centerContent: @escaping () -> some View,
        @ViewBuilder rightContent: @escaping () -> some View,
        @ViewBuilder disclosure: @escaping () -> some View
    ) {
        self.appearance = appearance
        self.alignment = alignment
        self.label = label
        self.title = title
        self.subtitle = subtitle
        self.disclosureIcon = disclosureIcon
        self.disclosureText = disclosureText
        self.leftContent = AnyView(HStack { AnyView(leftContent()) })
        self.centerContent = AnyView(VStack { AnyView(leftContent()) })
        self.rightContent = AnyView(HStack { AnyView(rightContent()) })
        self.disclosure = AnyView(disclosure())
    }
    
    public var body: some View {
        HStack(alignment: contentAlignment, spacing: 0) {
            leftContent
                .frame(maxWidth: .infinity)
            
            Spacer()
                .frame(width: appearance.size.contentPaddingStart)
            
            if hasCenterContent {
                centerView
            } else {
                centerContent
            }
            
            Spacer()
                .frame(width: appearance.size.contentPaddingEnd)
            
            rightContent
                .frame(maxWidth: .infinity)
            
            if hasDefaultDisclosure {
                defaultDisclosureView
                    .fixedSize()
            } else {
                disclosure
            }
        }
    }
}

extension Cell {
    @ViewBuilder
    private var centerView: some View {
        VStack(spacing: 0) {
            if hasCenterContent {
                if !label.isEmpty {
                    value(for: label, typography: applyTypography(for: appearance.labelTypography), textColor: appearance.labelColor)
                }
                
                if !title.isEmpty {
                    value(for: title, typography: applyTypography(for: appearance.titleTypography), textColor: appearance.titleColor)
                }
                
                if !subtitle.isEmpty {
                    value(for: subtitle, typography: applyTypography(for: appearance.subtitleTypography), textColor: appearance.subtitleColor)
                }
            }
        }
    }
    
    // MARK : - Other additional view
    @ViewBuilder
    private func value(for value: String, typography: TypographyToken, textColor: ColorToken) -> some View {
        Text(value)
            .typography(typography)
            .foregroundColor(textColor.color(for: colorScheme))
    }
    
    @ViewBuilder
    private var defaultDisclosureView: some View {
        HStack(spacing: 0) {
            value(for: disclosureText, typography: applyTypography(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
            
            ZStack {
                if let icon = disclosureIcon {
                    icon
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(appearance.disclosureIconColor.color(for: colorScheme))
                }
            }
        }
    }
    
    // MARK : - Computed values
    private var hasCenterContent: Bool {
        !label.isEmpty || !title.isEmpty || !subtitle.isEmpty
    }
    
    private var hasDefaultDisclosure: Bool {
        !disclosureText.isEmpty
    }
    
    // MARK : - Typography
    private func applyTypography(for text: TypographyConfiguration) -> TypographyToken {
        if let typography = text.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Cell Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    // MARK : - Alignment
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
