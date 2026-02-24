import Foundation
import SwiftUI

/**
 `ToolbarSlotData` содержит массив элементов для одного слота `SDDSToolbar`.
 */
public struct ToolbarSlotData: Identifiable {
    public let id: UUID
    public let views: [AnyView]
    
    public init(id: UUID = UUID(), views: [AnyView]) {
        self.id = id
        self.views = views
    }
}

public extension ToolbarSlotData {
    static func from<V: View>(
        id: UUID = UUID(),
        @ViewBuilder content: () -> [V]
    ) -> ToolbarSlotData {
        ToolbarSlotData(id: id, views: content().map { AnyView($0) })
    }
}

/**
 `SDDSToolbar` группирует контент по слотам с поддержкой разделителей и ориентации.
 */
public struct SDDSToolbar: View {
    @Environment(\.toolbarAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    
    private let _appearance: ToolbarAppearance?
    private let slots: [ToolbarSlotData]
    private let slotsAmount: Int
    private let hasDivider: Bool
    
    public init(
        slots: [ToolbarSlotData],
        slotsAmount: Int,
        hasDivider: Bool = false,
        appearance: ToolbarAppearance? = nil
    ) {
        self.slots = slots
        self.slotsAmount = max(0, slotsAmount)
        self.hasDivider = hasDivider
        self._appearance = appearance
    }
    
    public var body: some View {
        Group {
            switch appearance.size.orientation {
            case .horizontal:
                horizontalLayout
            case .vertical:
                verticalLayout
            }
        }
        .fixedSize(
            horizontal: appearance.size.orientation == .vertical,
            vertical: appearance.size.orientation == .horizontal
        )
        .padding(.leading, appearance.size.paddingStart)
        .padding(.trailing, appearance.size.paddingEnd)
        .padding(.top, appearance.size.paddingTop)
        .padding(.bottom, appearance.size.paddingBottom)
        .background(appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
        .shape(pathDrawer: appearance.size.shape)
        .shadow(appearance.shadow)
    }
    
    private var appearance: ToolbarAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var normalizedSlots: [ToolbarSlotData] {
        guard slotsAmount > 0 else {
            return []
        }
        return (0..<slotsAmount).map { index in
            if index < slots.count {
                return slots[index]
            }
            return ToolbarSlotData(views: [])
        }
    }
    
    private var shouldShowDivider: Bool {
        hasDivider && normalizedSlots.count > 1 && appearance.dividerAppearance != nil
    }
    
    private func slotPadding(for index: Int) -> EdgeInsets {
        let isSingle = normalizedSlots.count == 1
        if isSingle {
            return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        }
        
        let value = appearance.size.slotPadding
        let isFirst = index == 0
        let isLast = index == normalizedSlots.count - 1
        
        switch appearance.size.orientation {
        case .horizontal:
            if isFirst {
                return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: value)
            }
            if isLast {
                return EdgeInsets(top: 0, leading: value, bottom: 0, trailing: 0)
            }
            return EdgeInsets(top: 0, leading: value, bottom: 0, trailing: value)
        case .vertical:
            if isFirst {
                return EdgeInsets(top: 0, leading: 0, bottom: value, trailing: 0)
            }
            if isLast {
                return EdgeInsets(top: value, leading: 0, bottom: 0, trailing: 0)
            }
            return EdgeInsets(top: value, leading: 0, bottom: value, trailing: 0)
        }
    }
    
    private func dividerPadding() -> EdgeInsets {
        switch appearance.size.orientation {
        case .horizontal:
            return EdgeInsets(top: appearance.size.dividerMargin, leading: 0, bottom: appearance.size.dividerMargin, trailing: 0)
        case .vertical:
            return EdgeInsets(top: 0, leading: appearance.size.dividerMargin, bottom: 0, trailing: appearance.size.dividerMargin)
        }
    }
    
    @ViewBuilder
    private var horizontalLayout: some View {
        HStack(spacing: 0) {
            slotStack
        }
    }
    
    @ViewBuilder
    private var verticalLayout: some View {
        VStack(spacing: 0) {
            slotStack
        }
    }
    
    @ViewBuilder
    private var slotStack: some View {
        ForEach(Array(normalizedSlots.enumerated()), id: \.element.id) { index, slot in
            slotView(slot, index: index)
            if shouldShowDivider && index < normalizedSlots.count - 1 {
                dividerView
            }
        }
    }
    
    @ViewBuilder
    private func slotView(_ slot: ToolbarSlotData, index: Int) -> some View {
        Group {
            switch appearance.size.orientation {
            case .horizontal:
                HStack(spacing: 0) {
                    ForEach(Array(slot.views.enumerated()), id: \.offset) { _, view in
                        view
                    }
                }
            case .vertical:
                VStack(spacing: 0) {
                    ForEach(Array(slot.views.enumerated()), id: \.offset) { _, view in
                        view
                    }
                }
            }
        }
        .padding(slotPadding(for: index))
    }
    
    @ViewBuilder
    private var dividerView: some View {
        if let dividerAppearance = appearance.dividerAppearance {
            switch appearance.size.orientation {
            case .horizontal:
                Rectangle()
                    .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(width: max(dividerAppearance.thickness, 1))
                    .padding(dividerPadding())
            case .vertical:
                Rectangle()
                    .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(height: max(dividerAppearance.thickness, 1))
                    .padding(dividerPadding())
            }
        }
    }
}
