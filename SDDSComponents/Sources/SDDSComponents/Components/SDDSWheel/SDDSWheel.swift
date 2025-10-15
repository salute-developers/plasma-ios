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
    @State private var lastButtonPress: [Date] = []
    
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
        HStack(spacing: 0) {
            ForEach(Array(wheels.indices), id: \.self) { index in
                wheelWithControls(at: index)
                
                if index < wheels.count - 1 {
                    let columnHeight = calculateColumnHeight(for: wheels[index])
                    wheelSeparator(height: columnHeight, wheel: wheels[index])
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
        let wheel = wheels[index]
        let maxTextWidth = calculateMaxTextWidth(for: wheel)
        let frameAlignment = getTextAlignment(for: index)
        
        VStack(spacing: appearance.size.itemMinSpacing) {
            controlIconUp(for: index, width: maxTextWidth, alignment: frameAlignment)
            wheelWithDescription(at: index)
            controlIconDown(for: index, width: maxTextWidth, alignment: frameAlignment)
        }
    }
    
    @ViewBuilder
    private func controlIconUp(for index: Int, width: CGFloat, alignment: Alignment) -> some View {
        if let controlIconUp = appearance.controlIconUp {
            let iconSize = appearance.size.controlIconUpSize
            Button(
                action: {
                    scrollUp(wheelIndex: index)
                },
                label: {
                    if iconSize > 0 {
                        controlIconUp
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundColor(currentColor(for: appearance.controlIconUpColor))
                    } else {
                        controlIconUp
                            .renderingMode(.template)
                            .foregroundColor(currentColor(for: appearance.controlIconUpColor))
                    }
                }
            )
            .buttonStyle(PlainButtonStyle())
            .frame(width: width, alignment: alignment)
        }
    }
    
    @ViewBuilder
    private func controlIconDown(for index: Int, width: CGFloat, alignment: Alignment) -> some View {
        if let controlIconDown = appearance.controlIconDown {
            let iconSize = appearance.size.controlIconDownSize
            Button(
                action: {
                    scrollDown(wheelIndex: index)
                },
                label: {
                    if iconSize > 0 {
                        controlIconDown
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                            .foregroundColor(currentColor(for: appearance.controlIconDownColor))
                    } else {
                        controlIconDown
                            .renderingMode(.template)
                            .foregroundColor(currentColor(for: appearance.controlIconDownColor))
                    }
                }
            )
            .buttonStyle(PlainButtonStyle())
            .frame(width: width, alignment: alignment)
        }
    }
    
    @ViewBuilder
    private func wheelWithDescription(at index: Int) -> some View {
        wheelColumn(for: index)
    }
    
    @ViewBuilder
    private func wheelSeparator(height: CGFloat, wheel: WheelData) -> some View {
        ZStack {
            Color.clear
                .frame(width: appearance.size.separatorSpacing, height: height)
            
            switch appearance.dividerStyle {
            case .empty:
                // Не показываем разделитель, только spacer
                EmptyView()
                
            case .dots:
                // Показываем двоеточие, выровненное по центру выбранного элемента
                GeometryReader { geometry in
                    let centerY = getCenterY(for: wheel, geometry: geometry)
                    VStack(spacing: 0) {
                        Color.clear.frame(height: centerY - getItemHeight() / 2)
                        Text(":")
                            .foregroundColor(currentColor(for: appearance.itemTextColor))
                            .typography(itemTextTypography)
                            .frame(height: getItemHeight())
                        Spacer(minLength: 0)
                    }
                }
                
            case .divider:
                // Показываем стандартный разделитель
                if let dividerAppearance = appearance.dividerAppearance {
                    SDDSDivider(appearance: dividerAppearance)
                        .frame(width: height)
                        .rotationEffect(.degrees(90))
                }
            }
        }
        .frame(width: appearance.size.separatorSpacing, height: height)
    }
    
    @ViewBuilder
    private func wheelColumn(for wheelIndex: Int) -> some View {
        let wheel = wheels[wheelIndex]
        let maxTextWidth = calculateMaxTextWidth(for: wheel)
        let horizontalPadding: CGFloat = 0
        let columnWidth = maxTextWidth + horizontalPadding
        let columnHeight = calculateColumnHeight(for: wheel)
        
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
        let verticalPadding = calculateVerticalPadding(for: wheel, geometry: geometry)
        
        ZStack {
            // Нижний слой - прокручиваемые элементы С description (но description невидим)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: appearance.size.itemMinSpacing) {
                    ForEach(0..<wheel.items.count, id: \.self) { itemIndex in
                        wheelItemWithTracking(
                            wheelIndex: wheelIndex,
                            itemIndex: itemIndex,
                            item: wheel.items[itemIndex],
                            wheel: wheel,
                            geometry: geometry,
                            descriptionOpacity: 0.0
                        )
                    }
                }
                .padding(.vertical, verticalPadding)
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
            .simultaneousGesture(wheelDragGesture(for: wheelIndex, proxy: proxy))
            .onAppear {
                scrollToSelected(wheelIndex: wheelIndex, proxy: proxy)
            }
            .onChange(of: selection[wheelIndex]) { _ in
                handleSelectionChange(wheelIndex: wheelIndex, proxy: proxy)
            }
            
            // Верхний слой - неподвижный description (только центральный элемент)
            if let description = wheel.description, 
               !description.isEmpty,
               selection[wheelIndex] < wheel.items.count {
                let selectedItem = wheel.items[selection[wheelIndex]]
                let topPadding = calculateTopPaddingForStaticLayer(for: wheel, geometry: geometry)
                
                VStack(spacing: 0) {
                    Color.clear.frame(height: topPadding)
                    
                    wheelItemStatic(
                        item: selectedItem,
                        wheelIndex: wheelIndex,
                        itemIndex: selection[wheelIndex],
                        wheel: wheel,
                        geometry: geometry,
                        itemOpacity: 0.0,
                        descriptionOpacity: 1.0
                    )
                    
                    Spacer(minLength: 0)
                }
                .allowsHitTesting(false)
            }
        }
    }
    
    @ViewBuilder
    private func wheelItemWithTracking(
        wheelIndex: Int,
        itemIndex: Int,
        item: WheelItem,
        wheel: WheelData,
        geometry: GeometryProxy,
        descriptionOpacity: Double
    ) -> some View {
        wheelItem(
            item: item,
            wheelIndex: wheelIndex,
            itemIndex: itemIndex,
            wheel: wheel,
            geometry: geometry,
            descriptionOpacity: descriptionOpacity
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
        wheel: WheelData,
        geometry: GeometryProxy,
        descriptionOpacity: Double
    ) -> some View {
        let alignment = getAlignment(for: wheelIndex)
        let isCentralItem = itemIndex == selection[wheelIndex]
        let itemHeight = getItemHeight()
        let frameAlignment = getTextAlignment(for: wheelIndex)
        
        let distance = calculateItemDistance(
            itemIndex: itemIndex,
            selectedIndex: selection[wheelIndex],
            wheel: wheel,
            geometry: geometry
        )
        let scale = getScaleByDistance(distance: distance, wheel: wheel, geometry: geometry)
        let alpha = getAlphaByDistance(distance: distance, wheel: wheel, geometry: geometry)
        let scaleAnchor = getScaleAnchor(for: wheelIndex)
        
        VStack(spacing: 0) {
            // Сам элемент
            HStack(spacing: appearance.size.itemTextAfterPadding) {
                // Основной текст
                Text(item.text)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(currentColor(for: appearance.itemTextColor))
                    .typography(itemTextTypography)
                
                // Дополнительный текст (если есть)
                if let textAfter = item.textAfter, !textAfter.isEmpty {
                    Text(textAfter)
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundColor(currentColor(for: appearance.itemTextAfterColor))
                        .typography(itemTextAfterTypography)
                }
            }
            .scaleEffect(scale, anchor: scaleAnchor)
            .opacity(isCentralItem ? 1.0 : alpha)
            .animation(.easeInOut(duration: 0.2), value: selection[wheelIndex])
            .frame(maxWidth: .infinity, alignment: frameAlignment)
            .frame(height: itemHeight)
            
            // Description для центрального элемента
            if isCentralItem, let description = wheel.description, !description.isEmpty {
                if descriptionOpacity > 0 {
                    // Реальный description (для верхнего слоя)
                    Text(description)
                        .foregroundColor(currentColor(for: appearance.descriptionColor))
                        .typography(descriptionTypography)
                        .frame(maxWidth: .infinity, alignment: frameAlignment)
                        .padding(.top, appearance.size.descriptionPadding)
                } else {
                    // Заглушка для layout (для нижнего слоя)
                    let descHeight = descriptionTypography.lineHeight
                    Color.clear
                        .frame(maxWidth: .infinity)
                        .frame(height: descHeight)
                        .padding(.top, appearance.size.descriptionPadding)
                }
            }
        }
    }
    
    @ViewBuilder
    private func wheelItemStatic(
        item: WheelItem,
        wheelIndex: Int,
        itemIndex: Int,
        wheel: WheelData,
        geometry: GeometryProxy,
        itemOpacity: Double,
        descriptionOpacity: Double
    ) -> some View {
        let isCentralItem = itemIndex == selection[wheelIndex]
        let itemHeight = getItemHeight()
        let frameAlignment = getTextAlignment(for: wheelIndex)
        let scaleAnchor = getScaleAnchor(for: wheelIndex)
        
        VStack(spacing: 0) {
            // Полноценный элемент, но с управляемой прозрачностью
            HStack(spacing: appearance.size.itemTextAfterPadding) {
                Text(item.text)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(currentColor(for: appearance.itemTextColor))
                    .typography(itemTextTypography)
                
                if let textAfter = item.textAfter, !textAfter.isEmpty {
                    Text(textAfter)
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundColor(currentColor(for: appearance.itemTextAfterColor))
                        .typography(itemTextAfterTypography)
                }
            }
            .scaleEffect(1.0, anchor: scaleAnchor)
            .frame(maxWidth: .infinity, alignment: frameAlignment)
            .frame(height: itemHeight)
            .opacity(itemOpacity)
            
            // Description для центрального элемента
            if isCentralItem, let description = wheel.description, !description.isEmpty {
                Text(description)
                    .foregroundColor(currentColor(for: appearance.descriptionColor))
                    .typography(descriptionTypography)
                    .frame(maxWidth: .infinity, alignment: frameAlignment)
                    .padding(.top, appearance.size.descriptionPadding)
                    .opacity(descriptionOpacity)
            }
        }
    }
    
    private func getScaleAnchor(for wheelIndex: Int) -> UnitPoint {
        let alignment = getAlignment(for: wheelIndex)
        switch alignment {
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
    
    private func calculateColumnHeight(for wheel: WheelData) -> CGFloat {
        let itemHeight = getItemHeight()
        let baseHeight = CGFloat(visibleItemsCount) * itemHeight
        let spacingHeight = CGFloat(max(0, visibleItemsCount - 1)) * appearance.size.itemMinSpacing
        
        // Добавляем высоту description для центрального элемента, если он есть
        var descriptionHeight: CGFloat = 0
        if let description = wheel.description, !description.isEmpty {
            descriptionHeight = appearance.size.descriptionPadding + descriptionTypography.lineHeight
        }
        
        return baseHeight + spacingHeight + descriptionHeight
    }
    
    private func calculateVerticalPadding(for wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        // Центр должен быть на середине текста центрального элемента,
        // а не на середине всей высоты (которая включает description)
        let itemHeight = getItemHeight()
        let baseHeight = CGFloat(visibleItemsCount) * itemHeight
        let spacingHeight = CGFloat(max(0, visibleItemsCount - 1)) * appearance.size.itemMinSpacing
        
        // Центр текста центрального элемента
        let centerOfCentralItemText = (baseHeight + spacingHeight) / 2
        
        // Геометрия включает description, но центр скролла должен быть на centerOfCentralItemText
        return centerOfCentralItemText
    }
    
    private func getCenterY(for wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        // Центр Y находится на середине текста центрального элемента
        let itemHeight = getItemHeight()
        let baseHeight = CGFloat(visibleItemsCount) * itemHeight
        let spacingHeight = CGFloat(max(0, visibleItemsCount - 1)) * appearance.size.itemMinSpacing
        
        return (baseHeight + spacingHeight) / 2
    }
    
    private func calculateTopPaddingForStaticLayer(for wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        // Верхний отступ должен разместить текст элемента так, чтобы его центр был на getCenterY
        let centerY = getCenterY(for: wheel, geometry: geometry)
        let itemHeight = getItemHeight()
        
        // Верх элемента = центр - половина высоты элемента
        return centerY - (itemHeight / 2)
    }
    
    private func calculateItemDistance(
        itemIndex: Int,
        selectedIndex: Int,
        wheel: WheelData,
        geometry: GeometryProxy
    ) -> CGFloat {
        let itemHeight = getItemHeight()
        let centerY = getCenterY(for: wheel, geometry: geometry)
        let relativeIndex = itemIndex - selectedIndex
        let itemY = centerY + CGFloat(relativeIndex) * (itemHeight + appearance.size.itemMinSpacing)
        return abs(itemY - centerY)
    }
    
    private func getScaleByDistance(distance: CGFloat, wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        let centerY = getCenterY(for: wheel, geometry: geometry)
        let maxDist = centerY
        let absDistance = abs(distance)
        let factor = min(absDistance / maxDist, 1.5)
        return 1.0 - 0.3 * factor
    }
    
    private func getAlphaByDistance(distance: CGFloat, wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        let centerY = getCenterY(for: wheel, geometry: geometry)
        let maxDist = centerY
        let absDistance = abs(distance)
        let factor = min(absDistance / maxDist, 1.5)
        return 1.0 - 0.8 * min(factor, 1.0)
    }
    
    // MARK: - Private Methods
    
    private func initializeScrollState() {
        scrollOffsets = Array(repeating: 0, count: wheels.count)
        isScrolling = Array(repeating: false, count: wheels.count)
        isUpdatingFromButtons = Array(repeating: false, count: wheels.count)
        lastScrollUpdate = Array(repeating: Date(), count: wheels.count)
        lastButtonPress = Array(repeating: Date.distantPast, count: wheels.count)
    }
    
    private func wheelDragGesture(for wheelIndex: Int, proxy: ScrollViewProxy) -> some Gesture {
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
                // Увеличиваем задержку для корректной финализации скролла
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if wheelIndex < isScrolling.count {
                        isScrolling[wheelIndex] = false
                    }
                    if wheelIndex < lastScrollUpdate.count {
                        let timeSinceUpdate = Date().timeIntervalSince(lastScrollUpdate[wheelIndex])
                        if timeSinceUpdate > 0.1 && wheelIndex < scrollOffsets.count {
                            finalizeScrollSelection(wheelIndex: wheelIndex)
                        }
                    }
                }
                // Центрируем выбранный элемент после окончания скролла с увеличенной задержкой
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    snapToCenter(wheelIndex: wheelIndex, proxy: proxy)
                }
            }
    }
    
    private func scrollToSelected(wheelIndex: Int, proxy: ScrollViewProxy) {
        let selectedIndex = selection[wheelIndex]
        withAnimation(.easeInOut(duration: 0.3)) {
            proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
        }
    }
    
    private func snapToCenter(wheelIndex: Int, proxy: ScrollViewProxy) {
        let selectedIndex = selection[wheelIndex]
        withAnimation(.easeInOut(duration: 0.2)) {
            proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
        }
    }
    
    private func handleSelectionChange(wheelIndex: Int, proxy: ScrollViewProxy) {
        // Не скроллим программно, если идет ручной скролл
        guard wheelIndex < isScrolling.count && !isScrolling[wheelIndex] else {
            return
        }
        
        // Скроллим программно для любого программного изменения (кнопки или внешнее изменение)
        let selectedIndex = selection[wheelIndex]
        withAnimation(.easeInOut(duration: 0.3)) {
            proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
        }
        
        // Сбрасываем флаг после небольшой задержки
        if wheelIndex < isUpdatingFromButtons.count && isUpdatingFromButtons[wheelIndex] {
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
        let centerY = getCenterY(for: wheel, geometry: geometry)
        
        // Находим элемент этого колеса, который ближе всего к центру
        let itemsForWheel = positions.filter { $0.wheelIndex == wheelIndex }
        
        guard !itemsForWheel.isEmpty else { return }
        
        // Находим ближайший к центру элемент
        let closest = itemsForWheel.min(by: { 
            abs($0.midY - centerY) < abs($1.midY - centerY)
        })
        
        guard let closestItem = closest else { return }
        
        var newSelectedIndex = closestItem.itemIndex
        
        // Проверяем границы - если скроллим к краям
        let distanceFromCenter = abs(closestItem.midY - centerY)
        let itemHeight = getItemHeight()
        
        // Если элемент далеко от центра, возможно мы на краю списка
        if distanceFromCenter > itemHeight {
            // Проверяем, не первый/последний ли это элемент в массиве позиций
            let sortedItems = itemsForWheel.sorted { $0.itemIndex < $1.itemIndex }
            if let first = sortedItems.first, closestItem.itemIndex == first.itemIndex {
                // Это первый видимый элемент - значит мы в начале списка
                newSelectedIndex = 0
            } else if let last = sortedItems.last, closestItem.itemIndex == last.itemIndex {
                // Это последний видимый элемент - значит мы в конце списка
                newSelectedIndex = wheel.items.count - 1
            }
        }
        
        // Сохраняем для финального обновления
        if wheelIndex < scrollOffsets.count {
            scrollOffsets[wheelIndex] = CGFloat(newSelectedIndex)
        }
        
        // Обновляем selection если элемент изменился и валиден
        if newSelectedIndex >= 0 && newSelectedIndex < wheel.items.count && newSelectedIndex != selection[wheelIndex] {
            selection[wheelIndex] = newSelectedIndex
            // Записываем время последнего обновления
            if wheelIndex < lastScrollUpdate.count {
                lastScrollUpdate[wheelIndex] = Date()
            }
        }
    }
    
    private func finalizeScrollSelection(wheelIndex: Int) {
        guard wheelIndex < scrollOffsets.count else { return }
        
        let wheel = wheels[wheelIndex]
        let finalIndex = Int(round(scrollOffsets[wheelIndex]))
        
        if finalIndex >= 0 && finalIndex < wheel.items.count && finalIndex != selection[wheelIndex] {
            selection[wheelIndex] = finalIndex
        }
    }
    
    private func scrollUp(wheelIndex: Int) {
        if wheelIndex < lastButtonPress.count {
            let timeSinceLastPress = Date().timeIntervalSince(lastButtonPress[wheelIndex])
            guard timeSinceLastPress > 0.5 else { return }
            lastButtonPress[wheelIndex] = Date()
        }
        
        if selection[wheelIndex] > 0 {
            if wheelIndex < isUpdatingFromButtons.count {
                isUpdatingFromButtons[wheelIndex] = true
            }
            selection[wheelIndex] -= 1
        }
    }
    
    private func scrollDown(wheelIndex: Int) {
        if wheelIndex < lastButtonPress.count {
            let timeSinceLastPress = Date().timeIntervalSince(lastButtonPress[wheelIndex])
            guard timeSinceLastPress > 0.5 else { return }
            lastButtonPress[wheelIndex] = Date()
        }
        
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
        
        // Учитываем description если есть
        if let description = wheel.description, !description.isEmpty {
            let descWidth = calculateTextWidth(description, typography: descriptionTypography)
            return max(maxWidth, descWidth)
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
