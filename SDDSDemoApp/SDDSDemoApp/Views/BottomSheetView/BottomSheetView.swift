import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme
import SDDSIcons

struct BottomSheetView: View {
    @ObservedObject private var viewModel: BottomSheetViewModel = BottomSheetViewModel()
    @Environment(\.colorScheme) private var colorScheme
        
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    BasicButton(
                        title: "Open",
                        subtitle: "",
                        appearance: BasicButton.l.accent.appearance) {
                            viewModel.isBottomSheetPresented.toggle()
                        }
                    Spacer()
                }
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            .background(Color(.systemGroupedBackground))
            .listRowInsets(.init())
            
            Section {
                VariationsView(viewModel: viewModel)
                headerToggle
                footerToogle
                headerFixedToggle
                footerFixedToogle
                handlePositionPicker
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        
        .navigationTitle("BottomSheet")
        .bottomSheet(
            isPresented: $viewModel.isBottomSheetPresented,
            detent: $viewModel.detent,
            subtheme: viewModel.theme.subtheme(viewModel.subtheme)
        ) {
            SDDSBottomSheet(
                appearance: viewModel.appearance,
                header: {
                    if viewModel.isHeaderFixed {
                        header
                    } else {
                        EmptyView()
                    }
                },
                content: {
                    if viewModel.isHeaderFixed || viewModel.isFooterFixed {
                        ScrollView {
                            content
                        }
                        .applyIf(viewModel.isFooterFixed) {
                            $0.frame(height: contentHeight)
                        }
                        .scrollIndicators(.hidden)
                    } else {
                        content
                    }
                },
                footer: {
                    if viewModel.isFooterFixed {
                        footer
                            .frame(height: footerHeight)
                    }
                }
            )
        }
    }
        
    @ViewBuilder
    private var content: some View {
        VStack(spacing: 0) {
            if !viewModel.isHeaderFixed {
                header
            }
            text
            if !viewModel.isFooterFixed {
                footer
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private var text: some View {
        Text(viewModel.placeholder)
            .padding([.top, .bottom], 12)
    }
    
    @ViewBuilder
    private var header: some View {
        if viewModel.isHeaderEnabled {
            VStack(spacing: 0) {
                Text("Header")
                    .font(.largeTitle)
                    .padding(.bottom, 12)
                Divider()
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var footer: some View {
        if viewModel.isFooterEnabled {
            VStack(spacing: 0) {
                Divider()
                    .padding(.bottom, 12)
                Text("Footer")
                    .font(.footnote)
            }

        } else {
            EmptyView()
        }
    }
    
    private var footerToogle: some View {
        HStack {
            Toggle("Footer", isOn: $viewModel.isFooterEnabled)
        }
    }
    
    private var headerToggle: some View {
        HStack {
            Toggle("Header", isOn: $viewModel.isHeaderEnabled)
        }
    }
    
    private var footerFixedToogle: some View {
        HStack {
            Toggle("Footer Fixed", isOn: $viewModel.isFooterFixed)
        }
    }
    
    private var headerFixedToggle: some View {
        HStack {
            Toggle("Header Fixed", isOn: $viewModel.isHeaderFixed)
        }
    }
    
    private var handlePositionPicker: some View {
        Picker("Handle Placement", selection: Binding(
            get: { viewModel.appearance.handlePlacement },
            set: { viewModel.updateHandlePlacement($0) }
        )) {
            ForEach(BottomSheetHandlePlacement.allCases, id: \.self) { placement in
                Text(placement.rawValue.capitalized).tag(placement)
            }
        }
    }
        
    private var contentHeight: CGFloat {
        var totalHeight: CGFloat = 0
        
        if viewModel.isHeaderEnabled && !viewModel.isHeaderFixed {
            let headerTextHeight: CGFloat = 34
            let dividerHeight: CGFloat = 1
            let paddingHeight: CGFloat = 12
            totalHeight += headerTextHeight + dividerHeight + paddingHeight
        }
        
        let textHeight: CGFloat = 224
        let textPadding: CGFloat = 24
        totalHeight += textHeight + textPadding
        
        if viewModel.isFooterEnabled && !viewModel.isFooterFixed {
            totalHeight += footerHeight
        }
        
        return totalHeight
    }
    
    private var footerHeight: CGFloat {
        let footerTextHeight: CGFloat = 13
        let dividerHeight: CGFloat = 1
        let paddingHeight: CGFloat = 12
        return footerTextHeight + dividerHeight + paddingHeight
    }
}

#Preview {
    BottomSheetView()
}
