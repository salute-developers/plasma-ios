import SwiftUI
import SDDSComponentsPreview
import Combine
import SDDSComponents

struct ChipGroupView: View {
    @State var size: CGFloat = 0
    
    private var chips: [ChipData] {
        let chipSize = SDDSChipSize.small(.pilled)
        let chipAccessibility = ChipAccessibility()
        
        return (1...9).map { index in
            ChipData(
                title: "Label",
                isEnabled: true,
                iconImage: Image.image("chipIcon"),
                buttonImage: Image.image("chipClose"),
                appearance: .default,
                size: chipSize,
                accessibility: chipAccessibility,
                removeAction: {}
            )
        }
    }

    var body: some View {
        List {
            Section {
                HStack {
                    SDDSChipGroup(data: chips, size: DefaultChipGroupSize(alignment: .left), height: $size)
                    Spacer()
                        .frame(width: 58)
                }
                
            }
        }
        .navigationTitle("SDDSChipGroup")
    }
}

#Preview {
    NavigationView {
        ChipGroupView()
    }
}
