import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSAccordion_Simple: View {
    var body: some View {
        SDDSAccordion(
            items: [
                AccordionData(
                    title: "Первый элемент",
                    content: "Содержимое первого элемента"
                ),
                AccordionData(
                    title: "Второй элемент",
                    content: "Содержимое второго элемента"
                )
            ],
            showDividers: false,
            appearance: AccordionSolidActionStart.m.appearance
        )
    }
}
