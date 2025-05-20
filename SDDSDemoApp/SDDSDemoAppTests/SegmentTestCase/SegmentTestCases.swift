//
//  SegmentTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 19.05.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Segment/SegmentItem]
 */

struct SegmentItemSizeLPrimary: View {
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: nil,
            isDisabled: false,
            isSelected: true,
            counterEnabled: true,
            appearance: SegmentItem.l.primary.appearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}

struct SegmentItemSizeMSecondaryPilled: View {
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "Value",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isSelected: true,
            counterEnabled: true,
            appearance: SegmentItem.m.pilled.secondary.appearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}

struct SegmentItemSizeSPrimary: View {
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isSelected: false,
            counterEnabled: true,
            appearance: SegmentItem.s.primary.appearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}

struct SegmentItemSizeXsCounter: View {
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isSelected: true,
            counterEnabled: true,
            appearance: SegmentItem.xs.pilled.primary.appearance,
            counterText: "123",
            counter: {
                CounterForSegmentXxs()
            },
            action: {}
        )
    }
}

struct SegmentItemSizeDisabled: View {
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: nil,
            isDisabled: true,
            isSelected: true,
            counterEnabled: true,
            appearance: SegmentItem.l.primary.appearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}



struct SegmentSizeLPrimary: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<3).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    counterEnabled: false,
                    appearance: SegmentItem.l.primary.appearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: Segment.l.primary.appearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeMSecondaryPilled: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<2).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "Value",
                    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                    isDisabled: false,
                    counterEnabled: false,
                    appearance: SegmentItem.m.secondary.appearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: Segment.m.pilled.secondary.appearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeS: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<3).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "",
                    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                    isDisabled: false,
                    counterEnabled: false,
                    appearance: SegmentItem.s.primary.appearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: Segment.s.primary.appearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeXs: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<3).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "",
                    iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
                    isDisabled: false,
                    counterEnabled: false,
                    appearance: SegmentItem.xs.primary.appearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: Segment.xs.primary.appearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeLVertical: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<3).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    counterEnabled: false,
                    appearance: SegmentItem.l.primary.appearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: Segment.l.primary.appearance,
            layoutOrientation: .vertical,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentDisabled: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<3).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: true,
                    counterEnabled: false,
                    appearance: SegmentItem.l.primary.appearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: Segment.l.primary.appearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: true,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeSStretch: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<3).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    counterEnabled: false,
                    appearance: SegmentItem.s.primary.appearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: Segment.s.primary.appearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: true,
            hasBackground: true
        )
    }
}

struct SegmentSizeLCounter: View {
    let ids = [UUID(),UUID(), UUID()]
    var body: some View {
        SDDSSegment(
            items: (0..<2).map { index in
                SDDSSegmentItemData(
                    id: ids[index],
                    title: "Label",
                    subtitle: "",
                    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                    isDisabled: false,
                    counterEnabled: true,
                    appearance: SegmentItem.l.primary.appearance,
                    counter: {
                        AnyView(CounterForSegmentS())
                    },
                    action: {}
                )
            },
            appearance: Segment.l.primary.appearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct CounterForSegmentS: View {
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: Counter.s.accent.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterForSegmentXxs: View {
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: Counter.xxs.default.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}
