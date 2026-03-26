import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SandboxSwiftUI

struct PaginationDotsView: View {
    @ObservedObject private var viewModel: PaginationDotsViewModel
    @Environment(\.colorScheme) private var colorScheme

    init(viewModel: PaginationDotsViewModel = PaginationDotsViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    VStack(spacing: 16) {
                        if isVerticalOrientation {
                            VStack(spacing: 12) {
                                Button("↑") {
                                    viewModel.previous()
                                }
                                .buttonStyle(.borderedProminent)
                                
                                SDDSPaginationDots(
                                    selectedIndex: viewModel.selectedIndex,
                                    totalCount: viewModel.totalCount,
                                    visibleCount: viewModel.visibleCount,
                                    appearance: viewModel.appearance
                                )
                                
                                Button("↓") {
                                    viewModel.next()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        } else {
                            VStack(spacing: 12) {
                                SDDSPaginationDots(
                                    selectedIndex: viewModel.selectedIndex,
                                    totalCount: viewModel.totalCount,
                                    visibleCount: viewModel.visibleCount,
                                    appearance: viewModel.appearance
                                )
                                
                                HStack(spacing: 12) {
                                    Button("←") {
                                        viewModel.previous()
                                    }
                                    .buttonStyle(.borderedProminent)
                                    
                                    Button("→") {
                                        viewModel.next()
                                    }
                                    .buttonStyle(.borderedProminent)
                                }
                            }                            
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 20)
            }
            .listRowBackgroundForSubtheme(viewModel.subtheme, colorScheme: colorScheme)
            
            Section {
                VariationsView(viewModel: viewModel)
                
                valueMenuRow(
                    title: "Selected Index",
                    value: "\(viewModel.selectedIndex)"
                ) {
                    ForEach(0..<viewModel.totalCount, id: \.self) { index in
                        Button("\(index)") {
                            viewModel.selectedIndex = index
                        }
                    }
                }
                
                valueMenuRow(
                    title: "Step",
                    value: "\(viewModel.step)"
                ) {
                    ForEach(1...max(viewModel.totalCount - 1, 1), id: \.self) { value in
                        Button("\(value)") {
                            viewModel.step = value
                        }
                    }
                }
                
                valueMenuRow(
                    title: "Total Count",
                    value: "\(viewModel.totalCount)"
                ) {
                    ForEach(1...30, id: \.self) { count in
                        Button("\(count)") {
                            viewModel.totalCount = count
                        }
                    }
                }
                
                valueMenuRow(
                    title: "Visible Count",
                    value: "\(viewModel.visibleCount)"
                ) {
                    ForEach(1...max(viewModel.totalCount, 1), id: \.self) { count in
                        Button("\(count)") {
                            viewModel.visibleCount = count
                        }
                    }
                }
            }
        }
        .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
        .navigationTitle("PaginationDots")
    }
    
    private func valueMenuRow(
        title: String,
        value: String,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        HStack {
            Text(title)
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                content()
            } label: {
                Text(value)
            }
        }
    }
    
    private var isVerticalOrientation: Bool {
        viewModel.appearance.size.orientation == .vertical
    }
}

#Preview {
    NavigationView {
        PaginationDotsView()
    }
}
