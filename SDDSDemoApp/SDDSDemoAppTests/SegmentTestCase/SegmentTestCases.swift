//
//  SegmentTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.05.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Segment/SegmentItem]
 */

struct SegmentItemSizeLPrimary: View {
    var segmentItemAppearance: SegmentItemAppearance
    
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: nil,
            isDisabled: false,
            isSelected: true,
            counterEnabled: true,
            appearance: segmentItemAppearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}

struct SegmentItemSizeMSecondaryPilled: View {
    var segmentItemAppearance: SegmentItemAppearance
    
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "Value",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isSelected: true,
            counterEnabled: true,
            appearance: segmentItemAppearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}

struct SegmentItemSizeSPrimary: View {
    var segmentItemAppearance: SegmentItemAppearance
    
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .trailing),
            isDisabled: false,
            isSelected: false,
            counterEnabled: true,
            appearance: segmentItemAppearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}

struct SegmentItemSizeXsCounter: View {
    var segmentItemAppearance: SegmentItemAppearance
    var counterAppearance: CounterAppearance
    
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isSelected: true,
            counterEnabled: true,
            appearance: segmentItemAppearance,
            counterText: "123",
            counter: {
                SDDSCounter(
                    text: "123",
                    appearance: counterAppearance,
                    isAnimating: false,
                    isHighlighted: false,
                    isHovered: false,
                    isSelected: false
                )
            },
            action: {}
        )
    }
}

struct SegmentItemSizeDisabled: View {
    var segmentItemAppearance: SegmentItemAppearance
    
    var body: some View {
        SDDSSegmentItem(
            title: "Label",
            subtitle: "",
            iconAttributes: nil,
            isDisabled: true,
            isSelected: true,
            counterEnabled: true,
            appearance: segmentItemAppearance,
            counterText: "",
            counter: {},
            action: {}
        )
    }
}



struct SegmentSizeLPrimary: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeMSecondaryPilled: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeS: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeXs: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeLVertical: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .vertical,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentDisabled: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: true,
            stretch: false,
            hasBackground: true
        )
    }
}

struct SegmentSizeSStretch: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: { AnyView(EmptyView()) },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: true,
            hasBackground: true
        )
    }
}

struct SegmentSizeLCounter: View {
    var segmentItemAppearance: SegmentItemAppearance
    var segmentAppearance: SegmentAppearance
    var counterAppearance: CounterAppearance
    
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
                    appearance: segmentItemAppearance,
                    counter: {
                        AnyView (
                            SDDSCounter(
                                text: "123",
                                appearance: counterAppearance,
                                isAnimating: false,
                                isHighlighted: false,
                                isHovered: false,
                                isSelected: false
                            )
                        )
                    },
                    action: {}
                )
            },
            appearance: segmentAppearance,
            layoutOrientation: .horizontal,
            selectedItemId: .constant(ids[0]),
            isDisabled: false,
            stretch: false,
            hasBackground: true
        )
    }
}
