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
 - Дополнительный текст и описания для каждого колеса
 - Иконки управления (вверх/вниз)
 - Разделители между колесами
 - Эффекты масштабирования и прозрачности при прокрутке
 
 # Пример использования:
 ```swift
 SDDSWheel(
     wheels: [
         WheelData(items: ["01", "02", "03", ...], description: "День"),
         WheelData(items: ["Январь", "Февраль", "Март", ...], description: "Месяц"),
         WheelData(items: ["2020", "2021", "2022", ...], description: "Год")
     ],
     selection: $selectedValues,
     wheelCount: 3,
     visibleItemsCount: 5
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
    @State private var lastScrollUpdate: [Date] = []
    
    // Данные для колес
    private let wheels: [WheelData]
    
    // Привязка к выбранным значениям
    @Binding private var selection: [Int]
    
    // Количество столбцов-колес
    private let wheelCount: Int
    
    // Количество видимых элементов в столбце
    private let visibleItemsCount: Int
    
    public init(
        wheels: [WheelData],
        selection: Binding<[Int]>,
        wheelCount: Int,
        visibleItemsCount: Int
    ) {
        self.wheels = wheels
        self._selection = selection
        self.wheelCount = wheelCount
        self.visibleItemsCount = visibleItemsCount
    }
    
    public var body: some View {
        let itemHeight = getItemHeight()
        let columnHeight = CGFloat(visibleItemsCount) * itemHeight
        
        HStack(spacing: 0) {
            ForEach(Array(wheels.indices), id: \.self) { index in
                wheelWithControls(at: index)
                
                if index < wheels.count - 1 {
                    wheelSeparator(height: columnHeight)
                }
            }
        }
        .fixedSize(horizontal: true, vertical: false)
        .onAppear {
            initializeScrollState()
        }
        .onChange(of: wheels.count) { _ in
            initializeScrollState()
        }
    }
    
    // MARK: - Private Views
    
    @ViewBuilder
    private func wheelWithControls(at index: Int) -> some View {
        VStack(spacing: appearance.size.itemMinSpacing) {
            controlIconUp(for: index)
            wheelWithDescription(at: index)
            controlIconDown(for: index)
        }
    }
    
    @ViewBuilder
    private func controlIconUp(for index: Int) -> some View {
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
    }
    
    @ViewBuilder
    private func controlIconDown(for index: Int) -> some View {
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
    
    @ViewBuilder
    private func wheelWithDescription(at index: Int) -> some View {
        wheelColumn(for: index)
    }
    
    @ViewBuilder
    private func wheelSeparator(height: CGFloat) -> some View {
        ZStack {
            Color.clear
                .frame(width: appearance.size.separatorSpacing, height: height)
            
            if let dividerAppearance = appearance.dividerAppearance {
                SDDSDivider(appearance: dividerAppearance)
                    .frame(width: height)
                    .rotationEffect(.degrees(90))
            }
        }
        .frame(width: appearance.size.separatorSpacing, height: height)
    }
    
    @ViewBuilder
    private func wheelColumn(for wheelIndex: Int) -> some View {
        let wheel = wheels[wheelIndex]
        let maxTextWidth = calculateMaxTextWidth(for: wheel)
        let itemHeight = getItemHeight()
        let columnWidth = maxTextWidth + 32
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
    private func descriptionOverlayForWheel(description: String, wheelIndex: Int, geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            Spacer()
            
            // Невидимый выбранный элемент для точного позиционирования
            if wheelIndex < wheels.count && selection[wheelIndex] < wheels[wheelIndex].items.count {
                let selectedItem = wheels[wheelIndex].items[selection[wheelIndex]]
                let alignment = getAlignment(for: wheelIndex)
                
                HStack(spacing: appearance.size.itemTextAfterPadding) {
                    if alignment == .trailing || alignment == .center {
                        Spacer()
                    }
                    
                    Text(selectedItem.text)
                        .typography(itemTextTypography)
                    
                    if let textAfter = selectedItem.textAfter, !textAfter.isEmpty {
                        Text(textAfter)
                            .typography(itemTextAfterTypography)
                    }
                    
                    if alignment == .leading || alignment == .center {
                        Spacer()
                    }
                }
                .opacity(0)
            }
            
            // Description с отступом
            Text(description)
                .foregroundColor(currentColor(for: appearance.descriptionColor))
                .typography(descriptionTypography)
                .frame(maxWidth: .infinity, alignment: getTextAlignment(for: wheelIndex))
                .padding(.top, appearance.size.descriptionPadding)
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func wheelScrollView(
        wheelIndex: Int,
        wheel: WheelData,
        geometry: GeometryProxy,
        proxy: ScrollViewProxy
    ) -> some View {
        ZStack {
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
            .onPreferenceChange(ItemPositionPreferenceKey.self) { positions in
                updateSelectionFromItemPositions(wheelIndex: wheelIndex, positions: positions, geometry: geometry)
            }
            .simultaneousGesture(wheelDragGesture(for: wheelIndex))
            .onAppear {
                scrollToSelected(wheelIndex: wheelIndex, proxy: proxy)
            }
            .onChange(of: selection[wheelIndex]) { _ in
                handleSelectionChange(wheelIndex: wheelIndex, proxy: proxy)
            }
            
            // Description поверх скролла
            if let description = wheel.description, !description.isEmpty {
                descriptionOverlayForWheel(description: description, wheelIndex: wheelIndex, geometry: geometry)
            }
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
            GeometryReader { itemGeometry in
                Color.clear
                    .preference(
                        key: ItemPositionPreferenceKey.self,
                        value: [ItemPosition(
                            wheelIndex: wheelIndex,
                            itemIndex: itemIndex,
                            midY: itemGeometry.frame(in: .named("scroll\(wheelIndex)")).midY
                        )]
                    )
            }
        )
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
        lastScrollUpdate = Array(repeating: Date(), count: wheels.count)
    }
    
    private func wheelDragGesture(for wheelIndex: Int) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                print("🎯 DragGesture.onChanged for wheel[\(wheelIndex)], isUpdatingFromButtons=\(wheelIndex < isUpdatingFromButtons.count ? isUpdatingFromButtons[wheelIndex] : false)")
                if wheelIndex < isScrolling.count {
                    isScrolling[wheelIndex] = true
                }
                // Сбрасываем флаг сразу при начале ручного скролла
                if wheelIndex < isUpdatingFromButtons.count {
                    isUpdatingFromButtons[wheelIndex] = false
                    print("  ✅ Reset isUpdatingFromButtons to false")
                }
            }
            .onEnded { _ in
                print("🏁 DragGesture.onEnded for wheel[\(wheelIndex)]")
                // Финализируем скролл после задержки
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    if wheelIndex < isScrolling.count {
                        isScrolling[wheelIndex] = false
                    }
                    // Проверяем, что selection обновился недавно
                    // Если нет - принудительно обновляем на основе последнего offset
                    if wheelIndex < lastScrollUpdate.count {
                        let timeSinceUpdate = Date().timeIntervalSince(lastScrollUpdate[wheelIndex])
                        print("⏱️ Time since last update: \(timeSinceUpdate)")
                        if timeSinceUpdate > 0.2 && wheelIndex < scrollOffsets.count {
                            print("🔄 Finalizing selection for wheel[\(wheelIndex)]")
                            finalizeScrollSelection(wheelIndex: wheelIndex)
                        }
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
    
    private func updateSelectionFromItemPositions(wheelIndex: Int, positions: [ItemPosition], geometry: GeometryProxy) {
        // Не обновляем если скролл инициирован кнопками
        guard wheelIndex < isUpdatingFromButtons.count && !isUpdatingFromButtons[wheelIndex] else {
            return
        }
        
        let wheel = wheels[wheelIndex]
        let centerY = geometry.size.height / 2
        
        // Находим элемент этого колеса, который ближе всего к центру
        let itemsForWheel = positions.filter { $0.wheelIndex == wheelIndex }
        
        guard !itemsForWheel.isEmpty else { return }
        
        // Находим ближайший к центру элемент
        let closest = itemsForWheel.min(by: { 
            abs($0.midY - centerY) < abs($1.midY - centerY)
        })
        
        guard let closestItem = closest else { return }
        
        let newSelectedIndex = closestItem.itemIndex
        
        print("📊 Wheel[\(wheelIndex)] closest item: \(newSelectedIndex), midY=\(closestItem.midY), centerY=\(centerY), distance=\(abs(closestItem.midY - centerY))")
        
        // Сохраняем для финального обновления
        if wheelIndex < scrollOffsets.count {
            scrollOffsets[wheelIndex] = CGFloat(newSelectedIndex)
        }
        
        // Обновляем selection если элемент изменился и валиден
        if newSelectedIndex >= 0 && newSelectedIndex < wheel.items.count && newSelectedIndex != selection[wheelIndex] {
            print("✅ Updating selection[\(wheelIndex)] = \(newSelectedIndex)")
            selection[wheelIndex] = newSelectedIndex
            // Записываем время последнего обновления
            if wheelIndex < lastScrollUpdate.count {
                lastScrollUpdate[wheelIndex] = Date()
            }
        }
    }
    
    private func finalizeScrollSelection(wheelIndex: Int) {
        guard wheelIndex < scrollOffsets.count else { 
            print("❌ finalizeScrollSelection: no scrollOffsets")
            return 
        }
        
        let wheel = wheels[wheelIndex]
        let finalIndex = Int(round(scrollOffsets[wheelIndex]))
        
        print("🔍 finalizeScrollSelection: scrollOffset=\(scrollOffsets[wheelIndex]), finalIndex=\(finalIndex), current=\(selection[wheelIndex])")
        
        if finalIndex >= 0 && finalIndex < wheel.items.count && finalIndex != selection[wheelIndex] {
            print("✅ Finalizing selection[\(wheelIndex)] = \(finalIndex)")
            selection[wheelIndex] = finalIndex
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
    
    private func getTextAlignment(for wheelIndex: Int) -> Alignment {
        let horizontalAlignment = getAlignment(for: wheelIndex)
        switch horizontalAlignment {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .center:
            return .center
        default:
            return .center
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
    public let description: String?
    
    public init(items: [WheelItem], description: String? = nil) {
        self.items = items
        self.description = description
    }
    
    public init(items: [String], description: String? = nil) {
        self.items = items.map { WheelItem(text: $0) }
        self.description = description
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

// MARK: - Preference Keys

private struct ItemPosition: Equatable {
    let wheelIndex: Int
    let itemIndex: Int
    let midY: CGFloat
}

private struct ItemPositionPreferenceKey: PreferenceKey {
    static var defaultValue: [ItemPosition] = []
    
    static func reduce(value: inout [ItemPosition], nextValue: () -> [ItemPosition]) {
        value.append(contentsOf: nextValue())
    }
}

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
