import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct Cell: View {
    public let appearance: CellAppearance
    public let contentAlignment: CellContentAlignment

    public let label: String
    public let title: String
    public let subtitle: String
    
    public let disclosureIcon: Image?
    public let disclosureText: String
    
    public let leftContent: AnyView
    public let centerContent: AnyView
    public let rightContent: AnyView
    public let disclosure: AnyView
    
    public init(
        appearance: CellAppearance,
        contentAlignment: CellContentAlignment = .center,
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
        self.contentAlignment = contentAlignment
        self.label = label
        self.title = title
        self.subtitle = subtitle
        self.disclosureIcon = disclosureIcon
        self.disclosureText = disclosureText
        self.leftContent = AnyView(leftContent())
        self.centerContent = AnyView(centerContent())
        self.rightContent = AnyView(rightContent())
        self.disclosure = AnyView(disclosure())
    }
    
    public var body: some View {
        HStack {
            leftContent
            
            if hasCenterContent {
                centerView
            } else {
                centerContent                
            }
            rightContent
            
            if hasDefaultDisclosure {
                defaultDisclosureView
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
                    value(for: label, typography: applyTypography(for: appearance.labelTypography))
                }
                
                if !title.isEmpty {
                    value(for: title, typography: applyTypography(for: appearance.titleTypography))
                }
                
                if !subtitle.isEmpty {
                    value(for: subtitle, typography: applyTypography(for: appearance.subtitleTypography))
                }
            }
        }
    }
    
    //MARK: - Other additional view
    @ViewBuilder
    private func value(for value: String, typography: TypographyToken) -> some View {
        Text(value)
            .typography(typography)
    }
    
    @ViewBuilder
    private var defaultDisclosureView: some View {
        HStack(spacing: 0) {
            value(for: disclosureText, typography: applyTypography(for: appearance.disclosureTextTypography))
            
            ZStack {
                if let icon = disclosureIcon {
                    icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16)
                }
            }
        }
    }
    
    //MARK: - Computed values
    private var hasCenterContent: Bool {
        !label.isEmpty || !title.isEmpty || !subtitle.isEmpty
    }
    
    private var hasDefaultDisclosure: Bool {
        !disclosureText.isEmpty
    }
    
    //MARK: - Typography
    private func applyTypography(for text: TypographyConfiguration) -> TypographyToken {
        if let typography = text.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Cell Typography for size \(appearance.size.debugDescription).")
        }
    }
    //MARK: - Alignment
    private func contentAlignment(alignment: CellContentAlignment) -> Alignment {
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
