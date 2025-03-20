import Foundation
import SwiftUI
import Combine
import SDDSComponents
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
            .background(Color(.systemGroupedBackground))
            .listRowInsets(.init())
            
            Section {
                VariationsView(viewModel: viewModel)
                headerToggle
                footerToogle
                handlePositionPicker
            }
        }
        .navigationTitle("SDDSBottomSheet")
        .bottomSheet(isPresented: $viewModel.isBottomSheetPresented) {
            SDDSBottomSheet(
                appearance: viewModel.appearance,
                header: {
                    header
                },
                content: {
                    content
                },
                footer: {
                    footer
                }
            )
        }
    }
    
    @ViewBuilder
    private var content: some View {
        Text("Content")
    }
    
    @ViewBuilder
    private var header: some View {
        if viewModel.isHeaderEnabled {
            Text("Header")
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var footer: some View {
        if viewModel.isHeaderEnabled {
            Text("Header")
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
}

#Preview {
    BottomSheetView()
}
