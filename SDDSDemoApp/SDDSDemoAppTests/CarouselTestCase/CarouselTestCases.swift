import SDDSComponents
import SDDSServTheme
import SwiftUI
import UIKit

struct CarouselSnapshotCase: View {
    @State private var selection: Int
    let appearance: CarouselAppearance
    let pageCount: Int
    let hasIndicator: Bool
    let hasControls: Bool
    let indicatorVisibleCount: Int

    init(
        appearance: CarouselAppearance,
        selection: Int,
        pageCount: Int,
        hasIndicator: Bool = true,
        hasControls: Bool = true,
        indicatorVisibleCount: Int = 5
    ) {
        self._selection = State(initialValue: selection)
        self.appearance = appearance
        self.pageCount = pageCount
        self.hasIndicator = hasIndicator
        self.hasControls = hasControls
        self.indicatorVisibleCount = indicatorVisibleCount
    }

    var body: some View {
        ZStack {
            Color(.systemGray6)
            SDDSCarousel(
                selection: $selection,
                pageCount: pageCount,
                hasIndicator: hasIndicator,
                hasControls: hasControls,
                indicatorVisibleCount: indicatorVisibleCount,
                appearance: appearance
            ) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                    Text("\(index + 1)")
                        .font(.title)
                }
                .frame(height: 160)
            }
        }
        .frame(width: 360, height: 280)
        .onAppear {
            UIView.setAnimationsEnabled(false)
        }
        .onDisappear {
            UIView.setAnimationsEnabled(true)
        }
    }
}
