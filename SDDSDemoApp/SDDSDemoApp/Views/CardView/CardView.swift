import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme
import SDDSIcons
import SDDSThemeCore

struct CardView: View {
    @ObservedObject private var viewModel: CardViewModel = CardViewModel()
    @Environment(\.colorScheme) private var colorScheme
        
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSCard(appearance: viewModel.appearance) {
                        switch viewModel.orientation {
                        case .horizontal:
                            horizontalView
                        case .vertical:
                            verticalView
                        }
                    }
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .background(Color(.systemGroupedBackground))
            .listRowInsets(.init())
            
            Section {
                cardTypeSelectionView
                VariationsView(viewModel: viewModel)
                orientation
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("Card")
    }
    
    private var horizontalView: some View {
        HStack(spacing: 0) {
            cardText
            content
        }
    }
    
    private var verticalView: some View {
        VStack(spacing: 0) {
            cardText
            content
        }
    }
    
    private var cardText: some View {
        Text("Card text")
            .frame(width: cardSize.width, height: cardSize.height)
    }
    
    private var content: some View {
        SDDSCardContent(shapeContent: cardContentShape, backgroundColor: .gray) {
            cardContent
        }
    }
    
    @ViewBuilder
    private var cardContent: some View {
        ZStack {
            Image(systemName: "apple.logo")
                .resizable()
                .foregroundStyle(Color.white)
                .frame(width: imageSize.width, height: imageSize.height)
            Text("Content")
                .foregroundStyle(Color.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: cardSize.width, height: cardSize.height)
    }
    
    @ViewBuilder
    private var cardTypeSelectionView: some View {
        HStack {
            Text("Card Type")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(CardType.allCases, id: \.self) { CardType in
                    Button(CardType.rawValue.capitalized) {
                        viewModel.cardType = CardType
                    }
                }
            } label: {
                Text(viewModel.cardType.rawValue.capitalized)
            }
        }
    }
    
    private var orientation: some View {
        HStack {
            Text("Orientation")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(CardOrientation.allCases, id: \.self) { orientation in
                    Button(orientation.rawValue.capitalized) {
                        viewModel.orientation = orientation
                    }
                }
            } label: {
                Text(viewModel.orientation.rawValue.capitalized)
            }
        }
    }
    
    private var imageSize: CGSize {
        .init(width: 64, height: 64)
    }
    
    private var cardSize: CGSize {
        .init(width: 120, height: 120)
    }
    
    private var cardContentShape: ShapeContent {
        let cornerRadiusDrawer = CornerRadiusDrawer(cornerRadius: 8)
        return ShapeContent(pathDrawer: cornerRadiusDrawer)
    }
    
}

#Preview {
    CardView()
}
