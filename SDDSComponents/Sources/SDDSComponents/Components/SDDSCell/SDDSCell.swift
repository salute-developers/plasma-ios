import Foundation
import SwiftUI
@_exported import SDDSThemeCore

<<<<<<< HEAD
public struct SDDSCell<LeftContent: View, RightContent: View>: View {
=======
public struct Cell: View {
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
    public let appearance: CellAppearance
    public let alignment: CellContentAlignment
    
    public let label: String
    public let title: String
    public let subtitle: String
    
<<<<<<< HEAD
    public let disclosureEnabled: Bool
    public let disclosureImage: Image?
    public let disclosureText: String
    
    public let leftContent: LeftContent
    public let rightContent: RightContent
=======
    public let disclosureIcon: Image?
    public let disclosureText: String
    
    public let leftContent: AnyView
    public let centerContent: AnyView
    public let rightContent: AnyView
    public let disclosure: AnyView
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(
<<<<<<< HEAD
        appearance: CellAppearance = CellAppearance(),
=======
        appearance: CellAppearance,
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
        alignment: CellContentAlignment = .center,
        label: String = "",
        title: String = "",
        subtitle: String = "",
<<<<<<< HEAD
        disclosureEnabled: Bool = false,
        disclosureImage: Image? = nil,
        disclosureText: String = "",
        @ViewBuilder leftContent: @escaping () -> LeftContent,
        @ViewBuilder rightContent: @escaping () -> RightContent
=======
        disclosureIcon: Image? = nil,
        disclosureText: String = "",
        @ViewBuilder leftContent: @escaping () -> some View,
        @ViewBuilder centerContent: @escaping () -> some View,
        @ViewBuilder rightContent: @escaping () -> some View,
        @ViewBuilder disclosure: @escaping () -> some View
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
    ) {
        self.appearance = appearance
        self.alignment = alignment
        self.label = label
        self.title = title
        self.subtitle = subtitle
<<<<<<< HEAD
        self.disclosureEnabled = disclosureEnabled
        self.disclosureImage = disclosureImage
        self.disclosureText = disclosureText
        self.leftContent = leftContent()
        self.rightContent = rightContent()
=======
        self.disclosureIcon = disclosureIcon
        self.disclosureText = disclosureText
        self.leftContent = AnyView(HStack { AnyView(leftContent()) })
        self.centerContent = AnyView(VStack { AnyView(leftContent()) })
        self.rightContent = AnyView(HStack { AnyView(rightContent()) })
        self.disclosure = AnyView(disclosure())
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
    }
    
    public var body: some View {
        HStack(alignment: contentAlignment, spacing: 0) {
            leftContent
<<<<<<< HEAD
                .environment(cellAppearance: appearance)
            centerView
                .padding(.leading, appearance.size.contentPaddingStart)
                .padding(.trailing, appearance.size.contentPaddingEnd)
            rightContent
                .environment(cellAppearance: appearance)
            disclosure
=======
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
            } else {
                disclosure
            }
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
        }
    }
}

<<<<<<< HEAD
extension SDDSCell {
    @ViewBuilder
    private var centerView: some View {
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
    
    // MARK: - Other additional view
=======
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
    
    //MARK: - Other additional view
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
    @ViewBuilder
    private func value(for value: String, typography: TypographyToken, textColor: ColorToken) -> some View {
        Text(value)
            .typography(typography)
            .foregroundColor(textColor.color(for: colorScheme))
    }
    
<<<<<<< HEAD
    // MARK: - Disclosure
    @ViewBuilder
    private var disclosure: some View {
        if disclosureEnabled {
            defaultDisclosure
        } else if let disclosureImage = disclosureImage {
            value(for: disclosureText, typography: typographyToken(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
                .fixedSize()
            disclosureImage
        }
    }
    
    @ViewBuilder
    private var defaultDisclosure: some View {
        HStack(spacing: 0) {
            value(for: disclosureText, typography: typographyToken(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
                .fixedSize()
            ZStack {
                if let image = appearance.disclosureImage {
                    image
                        .renderingMode(.template)
                        .foregroundColor(appearance.disclosureImageColor.color(for: colorScheme))
=======
    @ViewBuilder
    private var defaultDisclosureView: some View {
        HStack(spacing: 0) {
            value(for: disclosureText, typography: applyTypography(for: appearance.disclosureTextTypography), textColor: appearance.disclosureTextColor)
            
            ZStack {
                if let icon = disclosureIcon {
                    icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16)
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
                }
            }
        }
    }
    
<<<<<<< HEAD
    // MARK: - Typography
    private func typographyToken(for text: TypographyConfiguration) -> TypographyToken {
=======
    //MARK: - Computed values
    private var hasCenterContent: Bool {
        !label.isEmpty || !title.isEmpty || !subtitle.isEmpty
    }
    
    private var hasDefaultDisclosure: Bool {
        !disclosureText.isEmpty
    }
    
    //MARK: - Typography
    private func applyTypography(for text: TypographyConfiguration) -> TypographyToken {
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
        if let typography = text.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Cell Typography for size \(appearance.size.debugDescription).")
        }
    }
    
<<<<<<< HEAD
    // MARK: - Alignment
=======
    //MARK: - Alignment
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
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
