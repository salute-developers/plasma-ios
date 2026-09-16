import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

/**
 `TabsAppearance` определяет внешний вид контейнера вкладок.
 
 - Properties:
    - size: Конфигурация размеров контейнера вкладок
    - disclosureColor: Цвет disclosure с состояниями
    - indicatorColor: Цвет индикатора
    - overflowNextIcon: Иконка кнопки "следующий"
    - overflowNextIconColor: Цвет иконки "следующий"
    - overflowPrevIcon: Иконка кнопки "предыдущий"
    - overflowPrevIconColor: Цвет иконки "предыдущий"
    - dividerAppearance: Внешний вид разделителя
    - tabItemAppearance: Внешний вид элемента вкладки
    - dropdownMenuAppearance: Внешний вид выпадающего меню
    - disclosureTextTypography: Типографика текста disclosure
    - disclosureIcon: Иконка disclosure (для IconTabs)
 */
@ApiInfo(components: ["IconTabs", "TabsDefault", "TabsHeader"])
public struct TabsAppearance: Hashable {
    let id = UUID()
    public var size: TabsSizeConfiguration
    @ApiName("disclosureColor")
    public var disclosureColor: StatefulFillStyle
    public var indicatorColor: ColorToken
    public var overflowNextIcon: Image?
    public var overflowNextIconColor: ColorToken
    public var overflowPrevIcon: Image?
    public var overflowPrevIconColor: ColorToken
    public var dividerAppearance: DividerAppearance?
    public var tabItemAppearance: TabItemAppearance
    public var dropdownMenuAppearance: DropdownMenuAppearance?
    public var disclosureTextTypography: TypographyConfiguration
    public var disclosureIcon: Image?
    
    public init(
        size: TabsSizeConfiguration = ZeroTabsSize(),
        disclosureColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        indicatorColor: ColorToken = .clearColor,
        overflowNextIcon: Image? = nil,
        overflowNextIconColor: ColorToken = .clearColor,
        overflowPrevIcon: Image? = nil,
        overflowPrevIconColor: ColorToken = .clearColor,
        dividerAppearance: DividerAppearance? = nil,
        tabItemAppearance: TabItemAppearance = TabItemAppearance(),
        dropdownMenuAppearance: DropdownMenuAppearance? = nil,
        disclosureTextTypography: TypographyConfiguration = .default,
        disclosureIcon: Image? = nil
    ) {
        self.size = size
        self.disclosureColor = disclosureColor
        self.indicatorColor = indicatorColor
        self.overflowNextIcon = overflowNextIcon
        self.overflowNextIconColor = overflowNextIconColor
        self.overflowPrevIcon = overflowPrevIcon
        self.overflowPrevIconColor = overflowPrevIconColor
        self.dividerAppearance = dividerAppearance
        self.tabItemAppearance = tabItemAppearance
        self.dropdownMenuAppearance = dropdownMenuAppearance
        self.disclosureTextTypography = disclosureTextTypography
        self.disclosureIcon = disclosureIcon
    }

    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        size: TabsSizeConfiguration = ZeroTabsSize(),
        disclosureColor: ButtonColor = ButtonColor(),
        indicatorColor: ColorToken = .clearColor,
        overflowNextIcon: Image? = nil,
        overflowNextIconColor: ColorToken = .clearColor,
        overflowPrevIcon: Image? = nil,
        overflowPrevIconColor: ColorToken = .clearColor,
        dividerAppearance: DividerAppearance? = nil,
        tabItemAppearance: TabItemAppearance = TabItemAppearance(),
        dropdownMenuAppearance: DropdownMenuAppearance? = nil,
        disclosureTextTypography: TypographyConfiguration = .default,
        disclosureIcon: Image? = nil
    ) {
        self.init(
            size: size,
            disclosureColor: disclosureColor.statefulColor.statefulFillStyle,
            indicatorColor: indicatorColor,
            overflowNextIcon: overflowNextIcon,
            overflowNextIconColor: overflowNextIconColor,
            overflowPrevIcon: overflowPrevIcon,
            overflowPrevIconColor: overflowPrevIconColor,
            dividerAppearance: dividerAppearance,
            tabItemAppearance: tabItemAppearance,
            dropdownMenuAppearance: dropdownMenuAppearance,
            disclosureTextTypography: disclosureTextTypography,
            disclosureIcon: disclosureIcon
        )
    }

    public static func == (lhs: TabsAppearance, rhs: TabsAppearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
