//
//  AccordionTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 17.07.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Accordion]
 */

/**
 Accordion общий тест-кейс
 */
struct AccordionCommonVariation : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: [
                AccordionData(
                    title: "Title",
                    content: "Content text",
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
            ],
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2095
 */
struct AccordionSolidActionStartSizeM : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: (0..<10).map { index in
                AccordionData(
                    title: "Title",
                    content: "Content text",
                    isExpanded: index == 0,
                    onToggle: {
                        isExpanded in
                    }
                )
            },
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2096
 */
struct AccordionClearActionEndSizeSHasDivider : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: [
                AccordionData(
                    title: "Title",
                    content: "Content text",
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
            ],
            showDividers: true,
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2097
 */
struct AccordionClearActionStartSizeXs : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: [
                AccordionData(
                    title: "Title",
                    content: "Content text",
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
            ],
            showDividers: false,
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2098
 */
struct AccordionSolidActionEndSizeLNoText : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: [
                AccordionData(
                    title: "",
                    content: "",
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
            ],
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2099
 */
struct AccordionSolidActionEndSizeLAmountTen : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: (0...10).map { index in
                AccordionData(
                    title: "Title",
                    content: "Content text",
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                )
            },
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2100
 */
struct AccordionClearActionStartSizeH2 : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: (0...10).map { index in
                AccordionData(
                    title: "Title",
                    content: "Content text",
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                )
            },
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2103
 */
struct AccordionClearActionEndSizeH4 : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: [
                AccordionData(
                    title: "Title",
                    content: "Content text",
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
                AccordionData(
                    title: "Title",
                    content: "Content text"
                ),
            ],
            showDividers: true,
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2107
 */
struct AccordionSolidActionEndLongTextSizeL : View {
    var appearance: AccordionAppearance
    
    var body: some View {
        SDDSAccordion(
            items: [
                AccordionData(
                    title: "The standard lorem ipsum passage, used since the 1500",
                    content: """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                    """,
                    isExpanded: true,
                    onToggle: {
                        isExpanded in
                    }
                ),
                AccordionData(
                    title: "The standard lorem ipsum passage, used since the 1500",
                    content: """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                    """
                ),
                AccordionData(
                    title: "The standard lorem ipsum passage, used since the 1500",
                    content: """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                    """
                ),
            ],
            appearance: appearance
        )
    }
}
