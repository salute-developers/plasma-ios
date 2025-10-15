import Foundation
import SwiftUI
@_exported import SDDSThemeCore
@_exported import SDDSIcons

/**
 `SDDSWheel` - компонент для выбора значений с помощью вращающихся колес.
 
 Компонент поддерживает:
 - Несколько колес для выбора различных значений
 - Настраиваемое количество видимых элементов
 - Различные варианты выравнивания элементов
 - Дополнительный текст и описания
 - Иконки управления (вверх/вниз)
 - Разделители между колесами
 - Эффекты масштабирования и прозрачности при прокрутке
 
 # Пример использования:
 ```swift
 SDDSWheel(
     wheels: [
         WheelData(items: ["01", "02", "03", ...]),
         WheelData(items: ["Январь", "Февраль", "Март", ...]),
         WheelData(items: ["2020", "2021", "2022", ...])
     ],
     selection: $selectedValues,
     description: "Выберите дату"
 )
 .wheelAppearance(appearance)
 ```
 */
public struct SDDSWheel: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.wheelAppearance) private var appearance
    @State private var scrollOffsets: [CGFloat] = []
    @State private var isScrolling: [Bool] = []
    
    // Данные для колес
    private let wheels: [WheelData]
    
    // Привязка к выбранным значениям
    @Binding private var selection: [Int]
    
    // Опциональное описание
    private let description: String?
    
    // Количество столбцов-колес
    private let wheelCount: Int
    
    // Количество видимых элементов в столбце
    private let visibleItemsCount: Int
    
    public init(
        wheels: [WheelData],
        selection: Binding<[Int]>,
        description: String? = nil,
        wheelCount: Int,
        visibleItemsCount: Int
    ) {
        self.wheels = wheels
        self._selection = selection
        self.description = description
        self.wheelCount = wheelCount
        self.visibleItemsCount = visibleItemsCount
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            // Описание (если есть)
            if let description = description, !description.isEmpty {
                Text(description)
                    .foregroundColor(currentColor(for: appearance.descriptionColor))
                    .typography(descriptionTypography)
                    .padding(.bottom, appearance.size.descriptionPadding)
            }
            
            // Область колес с иконками управления
            HStack(spacing: appearance.size.separatorSpacing) {
                ForEach(wheels.indices, id: \.self) { index in
                    VStack(spacing: appearance.size.itemMinSpacing) {
                        // Иконка вверх
                        if let controlIconUp = appearance.controlIconUp {
                            Button(action: {
                                scrollUp(wheelIndex: index)
                            }) {
                                controlIconUp
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(currentColor(for: appearance.controlIconUpColor))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        // Колесо
                        wheelColumn(for: index)
                        
                        // Иконка вниз
                        if let controlIconDown = appearance.controlIconDown {
                            Button(action: {
                                scrollDown(wheelIndex: index)
                            }) {
                                controlIconDown
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(currentColor(for: appearance.controlIconDownColor))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    // Разделитель между колесами (кроме последнего)
                    if index < wheels.count - 1 {
                        Rectangle()
                            .fill(currentColor(for: appearance.separatorColor))
                            .frame(width: 1)
                    }
                }
            }
        }
        .onAppear {
            initializeScrollState()
        }
        .onChange(of: wheels.count) { _ in
            initializeScrollState()
        }
    }
    
    // MARK: - Private Views
    
    @ViewBuilder
    private func wheelColumn(for wheelIndex: Int) -> some View {
        let wheel = wheels[wheelIndex]
        let itemCount = wheel.items.count
        
        // Вычисляем максимальную ширину текста
        let maxTextWidth = calculateMaxTextWidth(for: wheel)
        let itemHeight = getItemHeight()
        let columnWidth = maxTextWidth + appearance.size.itemTextAfterPadding * 2
        let columnHeight = CGFloat(visibleItemsCount) * itemHeight
        
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: appearance.size.itemMinSpacing) {
                        ForEach(0..<itemCount, id: \.self) { itemIndex in
                            wheelItem(
                                item: wheel.items[itemIndex],
                                wheelIndex: wheelIndex,
                                itemIndex: itemIndex,
                                geometry: geometry
                            )
                            .id("\(wheelIndex)-\(itemIndex)")
                        }
                    }
                    .padding(.vertical, geometry.size.height / 2)
                }
                .onAppear {
                    let selectedIndex = selection[wheelIndex]
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
                    }
                }
                .onChange(of: selection[wheelIndex]) { _ in
                    let selectedIndex = selection[wheelIndex]
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
                    }
                }
            }
        }
        .frame(width: columnWidth, height: columnHeight)
        .clipped()
    }
    
    @ViewBuilder
    private func wheelItem(
        item: WheelItem,
        wheelIndex: Int,
        itemIndex: Int,
        geometry: GeometryProxy
    ) -> some View {
        let alignment = getAlignment(for: wheelIndex)
        let isCentralItem = itemIndex == selection[wheelIndex]
        
        HStack(spacing: appearance.size.itemTextAfterPadding) {
            if alignment == .trailing || alignment == .center {
                Spacer()
            }
            
            // Основной текст
            Text(item.text)
                .foregroundColor(currentColor(for: appearance.itemTextColor))
                .typography(itemTextTypography)
            
            // Дополнительный текст (если есть)
            if let textAfter = item.textAfter, !textAfter.isEmpty {
                Text(textAfter)
                    .foregroundColor(currentColor(for: appearance.itemTextAfterColor))
                    .typography(itemTextAfterTypography)
            }
            
            if alignment == .leading || alignment == .center {
                Spacer()
            }
        }
        .modifier(WheelItemModifier(
            itemIndex: itemIndex,
            selectedIndex: selection[wheelIndex],
            geometry: geometry,
            isCentralItem: isCentralItem
        ))
    }
    
    // MARK: - Private Methods
    
    private func initializeScrollState() {
        scrollOffsets = Array(repeating: 0, count: wheels.count)
        isScrolling = Array(repeating: false, count: wheels.count)
    }
    
    private func scrollUp(wheelIndex: Int) {
        if selection[wheelIndex] > 0 {
            selection[wheelIndex] -= 1
        }
    }
    
    private func scrollDown(wheelIndex: Int) {
        if selection[wheelIndex] < wheels[wheelIndex].items.count - 1 {
            selection[wheelIndex] += 1
        }
    }
    
    private func calculateMaxTextWidth(for wheel: WheelData) -> CGFloat {
        let maxWidth = wheel.items.reduce(0.0) { maxWidth, item in
            let textWidth = calculateTextWidth(item.text)
            let afterTextWidth = item.textAfter.map(calculateTextWidth) ?? 0
            let totalWidth = textWidth + afterTextWidth + appearance.size.itemTextAfterPadding
            return max(maxWidth, totalWidth)
        }
        return maxWidth
    }
    
    private func calculateTextWidth(_ text: String) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: itemTextTypography.uiFont]
        let size = text.size(withAttributes: attributes)
        return size.width
    }
    
    
    private func getAlignment(for wheelIndex: Int) -> HorizontalAlignment {
        let totalWheels = wheels.count
        let alignment = appearance.size.itemAlignment
        
        switch alignment {
        case .start:
            return .leading
        case .end:
            return .trailing
        case .center:
            return .center
        case .mixed:
            if totalWheels == 1 {
                return .center
            } else if wheelIndex == 0 {
                return .trailing // Самый левый - по правому краю
            } else if wheelIndex == totalWheels - 1 {
                return .leading // Самый правый - по левому краю
            } else {
                return .center // Остальные - по центру
            }
        }
    }
}

// MARK: - Private Extension

private extension SDDSWheel {
    func currentColor(for colorToken: ColorToken) -> Color {
        return colorToken.color(for: colorScheme)
    }
    
    func currentColor(for buttonColor: ButtonColor) -> Color {
        return buttonColor.defaultColor.color(for: colorScheme)
    }
    
    var descriptionTypography: TypographyToken {
        if let typography = appearance.descriptionTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Wheel Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    var itemTextTypography: TypographyToken {
        if let typography = appearance.itemTextTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Wheel Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    var itemTextAfterTypography: TypographyToken {
        if let typography = appearance.itemTextAfterTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Wheel Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    func getItemHeight() -> CGFloat {
        return itemTextTypography.lineHeight
    }
}

// MARK: - WheelItemModifier

struct WheelItemModifier: ViewModifier {
    let itemIndex: Int
    let selectedIndex: Int
    let geometry: GeometryProxy
    let isCentralItem: Bool
    
    func body(content: Content) -> some View {
        let distance = calculateDistance(
            itemIndex: itemIndex,
            selectedIndex: selectedIndex,
            geometry: geometry
        )
        let scale = getScaleByDistance(distance: distance, geometry: geometry)
        let alpha = getAlphaByDistance(distance: distance, geometry: geometry)
        
        content
            .scaleEffect(scale)
            .opacity(isCentralItem ? 1.0 : alpha)
            .animation(.easeInOut(duration: 0.2), value: scale)
            .animation(.easeInOut(duration: 0.2), value: alpha)
    }
    
    private func calculateDistance(
        itemIndex: Int,
        selectedIndex: Int,
        geometry: GeometryProxy
    ) -> CGFloat {
        let itemHeight: CGFloat = 50 // Константа для высоты элемента
        let centerY = geometry.size.height / 2
        
        // Вычисляем реальную позицию элемента относительно центра
        // Центральный элемент - это selectedIndex
        let relativeIndex = itemIndex - selectedIndex
        let itemY = centerY + CGFloat(relativeIndex) * itemHeight
        
        return abs(itemY - centerY)
    }
    
    private func getMaxDistance(geometry: GeometryProxy) -> CGFloat {
        return geometry.size.height / 2
    }
    
    private func getDistanceFactor(distance: CGFloat, geometry: GeometryProxy) -> CGFloat {
        let maxDist = getMaxDistance(geometry: geometry)
        let absDistance = abs(distance)
        return min(absDistance / maxDist, 1.5)
    }
    
    private func getScaleByDistance(distance: CGFloat, geometry: GeometryProxy) -> CGFloat {
        let factor = getDistanceFactor(distance: distance, geometry: geometry)
        return 1.0 - 0.3 * factor
    }
    
    private func getAlphaByDistance(distance: CGFloat, geometry: GeometryProxy) -> CGFloat {
        let factor = getDistanceFactor(distance: distance, geometry: geometry)
        return 1.0 - 0.8 * min(factor, 1.0)
    }
}

// MARK: - WheelData

/**
 Данные для одного колеса.
 */
public struct WheelData: Identifiable {
    public let id = UUID()
    public let items: [WheelItem]
    
    public init(items: [WheelItem]) {
        self.items = items
    }
    
    public init(items: [String]) {
        self.items = items.map { WheelItem(text: $0) }
    }
}

/**
 Элемент колеса с основным текстом и опциональным дополнительным текстом.
 */
public struct WheelItem {
    public let text: String
    public let textAfter: String?
    
    public init(text: String, textAfter: String? = nil) {
        self.text = text
        self.textAfter = textAfter
    }
}

// MARK: - View Extension

public extension View {
    /**
     Применяет внешний вид к компоненту Wheel.
     
     - Parameter appearance: Внешний вид компонента.
     - Returns: Модифицированное представление.
     */
    func wheelAppearance(_ appearance: WheelAppearance) -> some View {
        environment(\.wheelAppearance, appearance)
    }
}
