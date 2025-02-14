import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct Cell: View {
//    public let appearance: CellAppearance
//    public let alignment: CellContentAlignment
//    
//    public let label: String
//    public let title: String
//    public let subtitle: String
//
//    public let disclosureIcon: AnyView
//    public let disclosureText: String
//    
    public let leftContent: AnyView
    public let centerContent: AnyView
    public let rightContent: AnyView

    public init(
//        appearance: CellAppearance,
//        alignment: CellContentAlignment,
//        label: String,
//        title: String,
//        subtitle: String,
//        disclosureIcon: some View,
//        disclosureText: String,
        @ViewBuilder leftContent: @escaping () -> some View,
        @ViewBuilder centerContent: @escaping () -> some View,
        @ViewBuilder rightContent: @escaping () -> some View
    ) {
//        self.appearance = appearance
//        self.alignment = alignment
//        self.label = label
//        self.title = title
//        self.subtitle = subtitle
//        self.disclosureIcon = disclosureIcon
//        self.disclosureText = disclosureText
        self.leftContent = AnyView(leftContent())
        self.centerContent = AnyView(centerContent())
        self.rightContent = AnyView(rightContent())
    }
    
    
    public var body: some View {
        HStack {
            leftContent
            centerContent
            rightContent
        }
    }
}

//extension Cell {
//    //MARK: - Drowing content type
//    private func drawContent(for type: [CellElement]) -> some View {
//        ForEach(type, id: \.self) { content in
//            switch content {
//            case .avatar(let avatarData):
//                SDDSAvatar(
//                    text: avatarData.text,
//                    image: avatarData.image,
//                    placeholderImage: avatarData.placeholderImage,
//                    status: avatarData.status,
//                    appearance: appearance.avatarAppearance,
//                    accessibility: avatarData.accessibility
//                )
//            case .iconButton(let iconButtonData):
//                IconButton(
//                    iconAttributes: iconButtonData.iconAttributes ,
//                    isDisabled: iconButtonData.isDisabled,
//                    isLoading: iconButtonData.isLoading,
//                    spinnerImage: iconButtonData.spinnerImage,
//                    appearance: appearance.iconButtonAppearance,
//                    layoutMode: iconButtonData.layoutMode,
//                    accessibility: iconButtonData.accessibility,
//                    action: iconButtonData.action
//                )
//            case .custom(let customView):
//                customView
//            }
//        }
//    }
//    //MARK: - Content view
//    @ViewBuilder
//    private var leftView: some View {
//        HStack(spacing: 0) {
//            drawContent(for: leftContent)
//        }
//    }
//    
//    @ViewBuilder
//    private var centerView: some View {
//        HStack(spacing: 0) {
//            VStack(spacing: 0) {
//                if hasCenterContent {
//                    if !label.isEmpty {
//                        value(for: label, typography: applyTypography(for: appearance.labelTypography))
//                    }
//                    
//                    if !title.isEmpty {
//                        value(for: title, typography: applyTypography(for: appearance.titleTypography))
//                    }
//                    
//                    if !subtitle.isEmpty {
//                        value(for: subtitle, typography: applyTypography(for: appearance.subtitleTypography))
//                    }
//                    
//                    if !centerContent.isEmpty {
//                        drawContent(for: centerContent)
//                    }
//                }
//            }
//        }
//        .frame(maxWidth: .infinity)
//    }
//    
//    @ViewBuilder
//    private var rightView: some View {
//        HStack(spacing: 0) {
//            drawContent(for: rightContent)
//            
//            disclosureView
//        }
//    }
//    
//    //MARK: - Disclosure view
//    @ViewBuilder
//    private var disclosureView: some View {
//        switch disclosure {
//        case .default(let defaultDisclosure):
//            defaultDisclosureView(for: defaultDisclosure)
//        case .custom(let viewProvider):
//            viewProvider.view
//        case .none:
//            EmptyView()
//        }
//    }
//    
//    @ViewBuilder
//    private func defaultDisclosureView(for disclosure: DefaultDisclosure)-> some View {
//        HStack {
//            value(for: disclosure.text, typography: applyTypography(for: appearance.disclosureTextTypography))
//            
//            ZStack {
//                switch disclosure.icon {
//                case .image(let image):
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 10, height: 10)
//                        .foregroundColor(Color.gray)
//                case .custom(let viewProvider):
//                    viewProvider.view
//                }
//            }
//            .frame(width: 16, height: 16)
//            .debug(color: Color.yellow, condition: true)
//        }
//        .debug(color: Color.green, condition: true)
//    }
//    
//    //MARK: - Other additional view
//    @ViewBuilder
//    private func value(for value: String, typography: TypographyToken) -> some View {
//        Text(value)
//            .typography(typography)
//    }
//    
//    //MARK: - Computed values
//    private var hasCenterContent: Bool {
//        !label.isEmpty || !title.isEmpty || !subtitle.isEmpty
//    }
//    
//    //MARK: - Typography
//    private func applyTypography(for text: TypographyConfiguration) -> TypographyToken {
//        if let typography = text.typography(with: appearance.size) {
//            return typography
//        } else {
//            fatalError("Undefined Cell Typography for size \(appearance.size.debugDescription).")
//        }
//    }
//    //MARK: - Alignment
//    private func contentAlignment(alignment: CellContentAlignment) -> Alignment {
//        switch alignment {
//        case .top:
//            return .top
//        case .center:
//            return .center
//        case .bottom:
//            return .bottom
//        }
//    }
//}
