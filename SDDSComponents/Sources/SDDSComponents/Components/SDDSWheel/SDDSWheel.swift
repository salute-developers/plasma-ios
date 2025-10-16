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
    @State private var isUpdatingFromButtons: [Bool] = []
    
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
        let maxTextWidth = calculateMaxTextWidth(for: wheel)
        let itemHeight = getItemHeight()
        let columnWidth = maxTextWidth + 16
        let columnHeight = CGFloat(visibleItemsCount) * itemHeight
        
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                wheelScrollView(
                    wheelIndex: wheelIndex,
                    wheel: wheel,
                    geometry: geometry,
                    proxy: proxy
                )
            }
        }
        .frame(width: columnWidth, height: columnHeight)
        .clipped()
    }
    
    @ViewBuilder
    private func wheelScrollView(
        wheelIndex: Int,
        wheel: WheelData,
        geometry: GeometryProxy,
        proxy: ScrollViewProxy
    ) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: appearance.size.itemMinSpacing) {
                ForEach(0..<wheel.items.count, id: \.self) { itemIndex in
                    wheelItemWithTracking(
                        wheelIndex: wheelIndex,
                        itemIndex: itemIndex,
                        item: wheel.items[itemIndex],
                        geometry: geometry
                    )
                }
            }
            .padding(.vertical, geometry.size.height / 2)
            .background(
                GeometryReader { contentGeometry in
                    Color.clear
                        .preference(
                            key: ScrollOffsetPreferenceKey.self,
                            value: contentGeometry.frame(in: .named("scroll\(wheelIndex)")).minY
                        )
                }
            )
        }
        .coordinateSpace(name: "scroll\(wheelIndex)")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
            updateSelectionFromScroll(wheelIndex: wheelIndex, offset: offset, geometry: geometry)
        }
        .simultaneousGesture(wheelDragGesture(for: wheelIndex))
        .onAppear {
            scrollToSelected(wheelIndex: wheelIndex, proxy: proxy)
        }
        .onChange(of: selection[wheelIndex]) { _ in
            handleSelectionChange(wheelIndex: wheelIndex, proxy: proxy)
        }
    }
    
    @ViewBuilder
    private func wheelItemWithTracking(
        wheelIndex: Int,
        itemIndex: Int,
        item: WheelItem,
        geometry: GeometryProxy
    ) -> some View {
        wheelItem(
            item: item,
            wheelIndex: wheelIndex,
            itemIndex: itemIndex,
            geometry: geometry
        )
        .id("\(wheelIndex)-\(itemIndex)")
        .background(
            itemPositionTracker(
                wheelIndex: wheelIndex,
                itemIndex: itemIndex,
                geometry: geometry
            )
        )
    }
    
    @ViewBuilder
    private func itemPositionTracker(
        wheelIndex: Int,
        itemIndex: Int,
        geometry: GeometryProxy
    ) -> some View {
        GeometryReader { itemGeometry in
            Color.clear
                .onAppear {
                    checkVisibleItem(
                        wheelIndex: wheelIndex,
                        itemIndex: itemIndex,
                        itemGeometry: itemGeometry,
                        scrollGeometry: geometry
                    )
                }
                .onChange(of: itemGeometry.frame(in: .named("scroll\(wheelIndex)")).midY) { _ in
                    checkVisibleItem(
                        wheelIndex: wheelIndex,
                        itemIndex: itemIndex,
                        itemGeometry: itemGeometry,
                        scrollGeometry: geometry
                    )
                }
        }
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
        isUpdatingFromButtons = Array(repeating: false, count: wheels.count)
    }
    
    private func wheelDragGesture(for wheelIndex: Int) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if wheelIndex < isScrolling.count {
                    isScrolling[wheelIndex] = true
                }
                if wheelIndex < isUpdatingFromButtons.count {
                    isUpdatingFromButtons[wheelIndex] = false
                }
            }
            .onEnded { _ in
                // Даем небольшую задержку перед сбросом флага,
                // чтобы финальные обновления offset успели обработаться
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if wheelIndex < isScrolling.count {
                        isScrolling[wheelIndex] = false
                    }
                }
            }
    }
    
    private func scrollToSelected(wheelIndex: Int, proxy: ScrollViewProxy) {
        let selectedIndex = selection[wheelIndex]
        withAnimation(.easeInOut(duration: 0.3)) {
            proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
        }
    }
    
    private func handleSelectionChange(wheelIndex: Int, proxy: ScrollViewProxy) {
        // Не скроллим программно, если идет ручной скролл
        guard wheelIndex < isScrolling.count && !isScrolling[wheelIndex] else {
            return
        }
        
        // Скроллим программно только если изменение пришло от кнопок
        if wheelIndex < isUpdatingFromButtons.count && isUpdatingFromButtons[wheelIndex] {
            let selectedIndex = selection[wheelIndex]
            withAnimation(.easeInOut(duration: 0.3)) {
                proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
            }
            // Сбрасываем флаг после небольшой задержки
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if wheelIndex < isUpdatingFromButtons.count {
                    isUpdatingFromButtons[wheelIndex] = false
                }
            }
        }
    }
    
    private func updateSelectionFromScroll(wheelIndex: Int, offset: CGFloat, geometry: GeometryProxy) {
        // Обновляем только во время ручного скролла
        guard wheelIndex < isScrolling.count && isScrolling[wheelIndex] else {
            return
        }
        
        let wheel = wheels[wheelIndex]
        let itemHeight = getItemHeight()
        let spacing = appearance.size.itemMinSpacing
        let centerY = geometry.size.height / 2
        
        // offset - это minY контента относительно coordinateSpace
        // Когда скроллим вниз, minY становится отрицательным
        let contentOffset = -offset
        
        // Вычисляем позицию центра видимой области относительно контента
        let centerPosition = contentOffset + centerY
        
        // Вычисляем индекс элемента с учетом высоты элемента и отступов
        let itemWithSpacing = itemHeight + spacing
        let newSelectedIndex = Int(round(centerPosition / itemWithSpacing))
        
        // Обновляем selection если элемент изменился и валиден
        if newSelectedIndex >= 0 && newSelectedIndex < wheel.items.count && newSelectedIndex != selection[wheelIndex] {
            selection[wheelIndex] = newSelectedIndex
        }
    }
    
    private func checkVisibleItem(
        wheelIndex: Int,
        itemIndex: Int,
        itemGeometry: GeometryProxy,
        scrollGeometry: GeometryProxy
    ) {
        // Отслеживаем только во время ручного скролла
        guard wheelIndex < isScrolling.count && isScrolling[wheelIndex] else {
            return
        }
        
        // Получаем центр видимой области
        let scrollCenter = scrollGeometry.size.height / 2
        
        // Получаем позицию элемента относительно скролла
        let itemFrame = itemGeometry.frame(in: .named("scroll\(wheelIndex)"))
        let itemCenter = itemFrame.midY
        
        // Вычисляем расстояние от центра элемента до центра видимой области
        let distanceFromCenter = abs(itemCenter - scrollCenter)
        
        // Определяем порог - половина высоты элемента
        let itemHeight = getItemHeight()
        let threshold = itemHeight / 2
        
        // Если элемент находится в центральной зоне
        if distanceFromCenter < threshold {
            let wheel = wheels[wheelIndex]
            if itemIndex >= 0 && itemIndex < wheel.items.count && itemIndex != selection[wheelIndex] {
                selection[wheelIndex] = itemIndex
            }
        }
    }
    
    private func scrollUp(wheelIndex: Int) {
        if selection[wheelIndex] > 0 {
            if wheelIndex < isUpdatingFromButtons.count {
                isUpdatingFromButtons[wheelIndex] = true
            }
            selection[wheelIndex] -= 1
        }
    }
    
    private func scrollDown(wheelIndex: Int) {
        if selection[wheelIndex] < wheels[wheelIndex].items.count - 1 {
            if wheelIndex < isUpdatingFromButtons.count {
                isUpdatingFromButtons[wheelIndex] = true
            }
            selection[wheelIndex] += 1
        }
    }
    
    private func calculateMaxTextWidth(for wheel: WheelData) -> CGFloat {
        let maxWidth = wheel.items.reduce(0.0) { maxWidth, item in
            let textWidth = calculateTextWidth(item.text, typography: itemTextTypography)
            var totalWidth = textWidth
            
            if let textAfter = item.textAfter, !textAfter.isEmpty {
                let afterTextWidth = calculateTextWidth(textAfter, typography: itemTextAfterTypography)
                totalWidth += appearance.size.itemTextAfterPadding + afterTextWidth
            }
            
            return max(maxWidth, totalWidth)
        }
        return maxWidth
    }
    
    private func calculateTextWidth(_ text: String, typography: TypographyToken) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: typography.uiFont]
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
                return .trailing
            } else if wheelIndex == totalWheels - 1 {
                return .leading
            } else {
                return .center
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
        let itemHeight: CGFloat = 50
        let centerY = geometry.size.height / 2
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

// MARK: - ScrollOffsetPreferenceKey

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
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
