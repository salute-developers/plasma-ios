import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct BadgeView: View {
    @ObservedObject private var viewModel: BadgeViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: BadgeViewModel = BadgeViewModel()) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        switch viewModel.componentViewLayoutMode {
        case .screen:
            List {
                Section {
                    HStack {
                        Spacer()
                        SDDSBadge(
                            label: viewModel.label,
                            image: image,
                            alignment: viewModel.alignment,
                            style: viewModel.badgeStyle,
                            appearance: viewModel.appearance
                        )
                        Spacer()
                    }
                }
                
                settings
            }
            .navigationTitle("Badge")
        case .subScreen:
            settings
        }
    }
    
    private var settings: some View {
        Section {
            if viewModel.componentViewLayoutMode == .screen {
                badgeTypeSelectionView
                VariationsView(viewModel: viewModel)
            }
            labelTextField
            iconToggle
            iconAlignmentSelectionView
        }
    }
    
    private var image: Image? {
        viewModel.iconVisible ? Image("buttonIcon") : nil
    }
    
    @ViewBuilder
    private var badgeTypeSelectionView: some View {
        HStack {
            Text("Button Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(BadgeType.allCases, id: \.self) { badgeType in
                    Button(badgeType.rawValue.capitalized) {
                        viewModel.badgeType = badgeType
                    }
                }
            } label: {
                Text(viewModel.badgeType.rawValue.capitalized)
            }
        }
    }
    
    @ViewBuilder
    private var labelTextField: some View {
        HStack {
            Text("Label")
            Spacer()
                .frame(maxWidth: .infinity)
            TextField("Badge Label", text: $viewModel.label)
                .multilineTextAlignment(.trailing)
        }
    }

    @ViewBuilder
    private var iconToggle: some View {
        HStack {
            Toggle("Icon", isOn: $viewModel.iconVisible)
        }
    }

    @ViewBuilder
    private var iconAlignmentSelectionView: some View {
        HStack {
            Text("Icon Alignment")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(BadgeAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue)
            }
        }
    }
}

#Preview {
    ButtonView()
}
