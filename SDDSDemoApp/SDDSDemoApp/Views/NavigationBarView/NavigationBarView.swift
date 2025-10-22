import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct NavigationBarView: View {
    @ObservedObject private var viewModel: NavigationBarViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: NavigationBarViewModel = NavigationBarViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            navigationBar
            
            settingsList
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .navigationTitle("Navigation Bar")
    }
    
    // MARK: - Navigation Bar
    
    private var navigationBar: some View {
        SDDSNavigationBar(
            type: viewModel.navigationBarType,
            title: viewModel.titleText,
            icon: viewModel.showIcon ? Image(systemName: "star.fill") : nil,
            textPlacement: viewModel.textPlacement,
            textAlign: viewModel.textAlign,
            contentPlacement: viewModel.contentPlacement,
            backAction: {
                print("Back button tapped")
            },
            actionStart: {
                actionStartView
            },
            actionEnd: {
                actionEndView
            },
            content: {
                contentView
            }
        )
    }
    
    private var contentView: some View {
        Text(viewModel.contentText)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(backgroundColor)
    }
    
    private var backgroundColor: Color {
        switch viewModel.navigationBarType {
        case .mainPage(let appearance):
            return appearance.backgroundColor.color(for: colorScheme)
        case .internalPage(let appearance):
            return appearance.backgroundColor.color(for: colorScheme)
        }
    }
    
    @ViewBuilder
    private var actionStartView: some View {
        if viewModel.hasActionLeft {
            Text("Action 1")
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var actionEndView: some View {
        if viewModel.hasActionRight {
            Text("Action 2")
        } else {
            EmptyView()
        }
    }
    
    // MARK: - Settings List
    
    private var settingsList: some View {
        List {
            Section {
                pageTypeRow
                variationsView
                textPlacementRow
                textAlignRow
                contentPlacementRow
                
                Toggle("Has Action Left", isOn: $viewModel.hasActionLeft)
                Toggle("Has Action Right", isOn: $viewModel.hasActionRight)
                
                titleTextRow
                contentTextRow
            }
        }
    }
    
    @ViewBuilder
    private var variationsView: some View {
        switch viewModel.pageType {
        case .mainPage:
            VariationsView(viewModel: viewModel)
        case .internalPage:
            if let internalPageViewModel = viewModel.internalPageViewModel {
                VariationsView(viewModel: internalPageViewModel)
            }
        }
    }
    
    // MARK: - Settings Rows
    
    private var pageTypeRow: some View {
        HStack {
            Text("Page Type")
            Spacer()
            Menu {
                Button("Main Page") {
                    viewModel.pageType = .mainPage
                }
                Button("Internal Page") {
                    viewModel.pageType = .internalPage
                }
            } label: {
                Text(pageTypeText(viewModel.pageType))
            }
        }
    }

    private var textPlacementRow: some View {
        HStack {
            Text("Text Placement")
            Spacer()
            Menu {
                Button("Bottom") {
                    viewModel.updateTextPlacement(.bottom)
                }
                Button("Inline") {
                    viewModel.updateTextPlacement(.inline)
                }
            } label: {
                Text(textPlacementText(viewModel.textPlacement))
            }
        }
    }
    
    private var textAlignRow: some View {
        HStack {
            Text("Text Align")
            Spacer()
            Menu {
                Button("Center") {
                    viewModel.updateTextAlign(.center)
                }
                Button("Left") {
                    viewModel.updateTextAlign(.left)
                }
                Button("Right") {
                    viewModel.updateTextAlign(.right)
                }
            } label: {
                Text(textAlignText(viewModel.textAlign))
            }
        }
    }
    
    private var contentPlacementRow: some View {
        HStack {
            Text("Content Placement")
            Spacer()
            Menu {
                Button("Bottom") {
                    viewModel.updateContentPlacement(.bottom)
                }
                Button("Inline") {
                    viewModel.updateContentPlacement(.inline)
                }
            } label: {
                Text(contentPlacementText(viewModel.contentPlacement))
            }
        }
    }
    
    private var titleTextRow: some View {
        HStack {
            Text("Title Text")
            Spacer()
            TextField("Title", text: $viewModel.titleText)
                .multilineTextAlignment(.trailing)
        }
    }
    
    private var contentTextRow: some View {
        HStack {
            Text("Content Text")
            Spacer()
            TextField("Content", text: $viewModel.contentText)
                .multilineTextAlignment(.trailing)
        }
    }
    
    // MARK: - Helper Methods
    
    private func textPlacementText(_ placement: NavigationBarTextPlacement) -> String {
        switch placement {
        case .bottom:
            return "Bottom"
        case .inline:
            return "Inline"
        }
    }
    
    private func textAlignText(_ align: NavigationBarTextAlign) -> String {
        switch align {
        case .center:
            return "Center"
        case .left:
            return "Left"
        case .right:
            return "Right"
        }
    }
    
    private func contentPlacementText(_ placement: NavigationBarContentPlacement) -> String {
        switch placement {
        case .bottom:
            return "Bottom"
        case .inline:
            return "Inline"
        }
    }
    
    private func pageTypeText(_ type: NavigationBarPageType) -> String {
        switch type {
        case .mainPage:
            return "Main Page"
        case .internalPage:
            return "Internal Page"
        }
    }
}

#Preview {
    NavigationBarView()
}
