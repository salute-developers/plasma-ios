import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `` - компонент для выбора значений с помощью вращающихся колес.
 
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
 (
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
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.wheelAppearance) private var appearance
    @State private var scrollOffsets: [CGFloat] = []
    @State private var isScrolling: [Bool] = []
    @State private var isUpdatingFromButtons: [Bool] = []
    @State private var lastScrollUpdate: [Date] = []
    @State private var lastButtonPress: [Date] = []
    @State private var hasAppeared: [Bool] = []
    @State private var closestItemIndices: [Int] = []
    @State private var isSnappingFromFake: [Bool] = []
    
    private let wheels: [WheelData]
    @Binding private var selection: [Int]
    private let wheelCount: Int
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
                EmptyView()
                
            case .dots:
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
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: appearance.size.itemMinSpacing) {
                    invisibleSpacerItem(wheelIndex: wheelIndex, itemIndex: -1, geometry: geometry)
                    
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
                    
                    invisibleSpacerItem(wheelIndex: wheelIndex, itemIndex: wheel.items.count, geometry: geometry)
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
    private func invisibleSpacerItem(wheelIndex: Int, itemIndex: Int, geometry: GeometryProxy) -> some View {
        let itemHeight = getItemHeight()
        
        Color.clear
            .frame(height: itemHeight)
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
            .scaleEffect(scale, anchor: scaleAnchor)
            .opacity(isCentralItem ? 1.0 : alpha)
            .animation(.easeInOut(duration: 0.2), value: selection[wheelIndex])
            .frame(maxWidth: .infinity, alignment: frameAlignment)
            .frame(height: itemHeight)
            
            if isCentralItem, let description = wheel.description, !description.isEmpty {
                if descriptionOpacity > 0 {
                    Text(description)
                        .foregroundColor(currentColor(for: appearance.descriptionColor))
                        .typography(descriptionTypography)
                        .frame(maxWidth: .infinity, alignment: frameAlignment)
                        .padding(.top, appearance.size.descriptionPadding)
                } else {
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
        
        var descriptionHeight: CGFloat = 0
        if let description = wheel.description, !description.isEmpty {
            descriptionHeight = appearance.size.descriptionPadding + descriptionTypography.lineHeight
        }
        
        return baseHeight + spacingHeight + descriptionHeight
    }
    
    private func calculateVerticalPadding(for wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        let itemHeight = getItemHeight()
        let baseHeight = CGFloat(visibleItemsCount) * itemHeight
        let spacingHeight = CGFloat(max(0, visibleItemsCount - 1)) * appearance.size.itemMinSpacing
        
        let centerOfCentralItemText = (baseHeight + spacingHeight) / 2
        
        return centerOfCentralItemText
    }
    
    private func getCenterY(for wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        let itemHeight = getItemHeight()
        let baseHeight = CGFloat(visibleItemsCount) * itemHeight
        let spacingHeight = CGFloat(max(0, visibleItemsCount - 1)) * appearance.size.itemMinSpacing
        
        return (baseHeight + spacingHeight) / 2
    }
    
    private func calculateTopPaddingForStaticLayer(for wheel: WheelData, geometry: GeometryProxy) -> CGFloat {
        let centerY = getCenterY(for: wheel, geometry: geometry)
        let itemHeight = getItemHeight()
        
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
        closestItemIndices = Array(repeating: 0, count: wheels.count)
        isSnappingFromFake = Array(repeating: false, count: wheels.count)
        if hasAppeared.count != wheels.count {
            hasAppeared = Array(repeating: false, count: wheels.count)
        }
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
                let currentClosestIndex = wheelIndex < closestItemIndices.count ? closestItemIndices[wheelIndex] : -999
                let wheel = wheels[wheelIndex]
                let isOnFakeElement = currentClosestIndex < 0 || currentClosestIndex >= wheel.items.count
                
                if isOnFakeElement {
                    if wheelIndex < isSnappingFromFake.count {
                        isSnappingFromFake[wheelIndex] = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    snapToCenter(wheelIndex: wheelIndex, proxy: proxy)
                }
            }
    }
    
    private func scrollToSelected(wheelIndex: Int, proxy: ScrollViewProxy) {
        let selectedIndex = selection[wheelIndex]
        let isFirstAppearance = wheelIndex < hasAppeared.count && !hasAppeared[wheelIndex]
        
        if isFirstAppearance {
            DispatchQueue.main.async {
                proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
                if wheelIndex < self.hasAppeared.count {
                    self.hasAppeared[wheelIndex] = true
                }
            }
        } else {
            withAnimation(.easeInOut(duration: 0.3)) {
                proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
            }
        }
    }
    
    private func snapToCenter(wheelIndex: Int, proxy: ScrollViewProxy) {
        let wheel = wheels[wheelIndex]
        let selectedIndex = selection[wheelIndex]
        
        let isOnFakeElement = wheelIndex < closestItemIndices.count && 
                             (closestItemIndices[wheelIndex] < 0 || closestItemIndices[wheelIndex] >= wheel.items.count)
        
        if isOnFakeElement {
            let targetIndex: Int
            if selectedIndex == 0 {
                targetIndex = 0
            } else if selectedIndex == wheel.items.count - 1 {
                targetIndex = wheel.items.count - 1
            } else {
                targetIndex = selectedIndex
            }
            
            if wheelIndex < isSnappingFromFake.count && !isSnappingFromFake[wheelIndex] {
                isSnappingFromFake[wheelIndex] = true
            }
            
            withAnimation(.easeInOut(duration: 0.15)) {
                proxy.scrollTo("\(wheelIndex)-\(targetIndex)", anchor: .center)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.easeInOut(duration: 0.15)) {
                    proxy.scrollTo("\(wheelIndex)-\(targetIndex)", anchor: .center)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    if wheelIndex < self.isSnappingFromFake.count {
                        self.isSnappingFromFake[wheelIndex] = false
                        
                        let currentClosestIndex = wheelIndex < self.closestItemIndices.count ? self.closestItemIndices[wheelIndex] : -999
                        let isStillOnFake = currentClosestIndex < 0 || currentClosestIndex >= wheel.items.count
                        
                        if isStillOnFake {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    proxy.scrollTo("\(wheelIndex)-\(targetIndex)", anchor: .center)
                                }
                            }
                        }
                    }
                }
            }
        } else {
            withAnimation(.easeInOut(duration: 0.2)) {
                proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
            }
        }
    }
    
    private func handleSelectionChange(wheelIndex: Int, proxy: ScrollViewProxy) {
        guard wheelIndex < isScrolling.count && !isScrolling[wheelIndex] else {
            return
        }
        
        let selectedIndex = selection[wheelIndex]
        withAnimation(.easeInOut(duration: 0.3)) {
            proxy.scrollTo("\(wheelIndex)-\(selectedIndex)", anchor: .center)
        }
        
        if wheelIndex < isUpdatingFromButtons.count && isUpdatingFromButtons[wheelIndex] {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if wheelIndex < isUpdatingFromButtons.count {
                    isUpdatingFromButtons[wheelIndex] = false
                }
            }
        }
    }
    
    private func updateSelectionFromItemPositions(wheelIndex: Int, positions: [ItemPosition], geometry: GeometryProxy) {
        guard wheelIndex < isUpdatingFromButtons.count && !isUpdatingFromButtons[wheelIndex] else {
            return
        }
        
        if wheelIndex < isSnappingFromFake.count && isSnappingFromFake[wheelIndex] {
            return
        }
        
        let wheel = wheels[wheelIndex]
        let centerY = getCenterY(for: wheel, geometry: geometry)
        
        let itemsForWheel = positions.filter { $0.wheelIndex == wheelIndex }
        
        guard !itemsForWheel.isEmpty else { return }
        
        let closest = itemsForWheel.min(by: { 
            abs($0.midY - centerY) < abs($1.midY - centerY)
        })
        
        guard let closestItem = closest else { return }
        
        if wheelIndex < closestItemIndices.count {
            closestItemIndices[wheelIndex] = closestItem.itemIndex
        }
        
        var newSelectedIndex: Int
        
        if closestItem.itemIndex < 0 {
            newSelectedIndex = 0
        } else if closestItem.itemIndex >= wheel.items.count {
            newSelectedIndex = wheel.items.count - 1
        } else {
            newSelectedIndex = closestItem.itemIndex
            
            let distanceFromCenter = abs(closestItem.midY - centerY)
            let itemHeight = getItemHeight()
            
            if distanceFromCenter > itemHeight {
                let realItems = itemsForWheel.filter { $0.itemIndex >= 0 && $0.itemIndex < wheel.items.count }
                let sortedItems = realItems.sorted { $0.itemIndex < $1.itemIndex }
                if let first = sortedItems.first, closestItem.itemIndex == first.itemIndex {
                    newSelectedIndex = 0
                } else if let last = sortedItems.last, closestItem.itemIndex == last.itemIndex {
                    newSelectedIndex = wheel.items.count - 1
                }
            }
        }
        
        if wheelIndex < scrollOffsets.count {
            scrollOffsets[wheelIndex] = CGFloat(newSelectedIndex)
        }
        
        if newSelectedIndex >= 0 && newSelectedIndex < wheel.items.count && newSelectedIndex != selection[wheelIndex] {
            selection[wheelIndex] = newSelectedIndex

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
        return colorToken.color(for: colorScheme, subtheme: subtheme)
    }
    
    func currentColor(for buttonColor: ButtonColor) -> Color {
        return buttonColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
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
