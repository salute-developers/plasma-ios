import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct Cell: View {
    public let appearance: CellAppearance
    //    public let alignment: CellContentAlignment
    //
    public let label: String
    public let title: String
    public let subtitle: String
    //
    //    public let disclosureIcon: AnyView
    public let disclosureText: String
    //
    public let leftContent: AnyView
    public let centerContent: AnyView
    public let rightContent: AnyView
    
    public init(
        appearance: CellAppearance,
        //        alignment: CellContentAlignment,
        label: String,
        title: String,
        subtitle: String,
        //        disclosureIcon: some View,
        disclosureText: String,
        @ViewBuilder leftContent: @escaping () -> some View,
        @ViewBuilder centerContent: @escaping () -> some View,
        @ViewBuilder rightContent: @escaping () -> some View
    ) {
        self.appearance = appearance
        //        self.alignment = alignment
        self.label = label
        self.title = title
        self.subtitle = subtitle
        //        self.disclosureIcon = disclosureIcon
        self.disclosureText = disclosureText
        self.leftContent = AnyView(leftContent())
        self.centerContent = AnyView(centerContent())
        self.rightContent = AnyView(rightContent())
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
    
    //MARK: - Computed values
    private var hasCenterContent: Bool {
        !label.isEmpty || !title.isEmpty || !subtitle.isEmpty
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
