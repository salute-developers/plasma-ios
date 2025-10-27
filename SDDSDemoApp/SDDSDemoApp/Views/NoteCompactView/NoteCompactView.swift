import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct NoteCompactView: View {
    @ObservedObject private var viewModel: NoteCompactViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: NoteCompactViewModel = NoteCompactViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                noteCompactPreview
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
            }
            
            Section {
                VariationsView(viewModel: viewModel)
                
                titleField
                textField
                linkButtonTitleField
                linkButtonIconToggle
                contentBeforeToggle
            }
        }
        .navigationTitle("Note Compact")
    }
    
    @ViewBuilder
    private var noteCompactPreview: some View {
        noteCompactContent
            .environment(\.noteCompactAppearance, viewModel.appearance)
    }
    
    @ViewBuilder
    private var noteCompactContent: some View {
        if viewModel.hasContentBefore {
            SDDSNoteCompact(
                title: viewModel.title,
                text: viewModel.text,
                linkButtonTitle: viewModel.linkButtonTitle,
                linkButtonIcon: viewModel.linkButtonIcon,
                onLinkButtonTap: {
                    print("Link button tapped")
                },
                onClose: {
                    print("Close button tapped")
                },
                contentBefore: {
                    Image("plasma")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .applyIf(viewModel.appearance.size.iconSize == 0) {
                            $0.frame(width: 64, height: 64)
                        }
                }
            )
        } else {
            SDDSNoteCompact(
                title: viewModel.title,
                text: viewModel.text,
                linkButtonTitle: viewModel.linkButtonTitle,
                linkButtonIcon: viewModel.linkButtonIcon,
                onLinkButtonTap: {
                    print("Link button tapped")
                },
                onClose: {
                    print("Close button tapped")
                }
            )
        }
    }
    
    // MARK: - UI Elements
    
    private var titleField: some View {
        HStack {
            Text("Title")
            Spacer()
                .frame(maxWidth: .infinity)
            TextField("Title", text: $viewModel.title)
                .multilineTextAlignment(.trailing)
        }
    }
    
    private var textField: some View {
        HStack {
            Text("Text")
            Spacer()
                .frame(maxWidth: .infinity)
            TextField("Text", text: $viewModel.text)
                .multilineTextAlignment(.trailing)
        }
    }
    
    private var linkButtonTitleField: some View {
        HStack {
            Text("Link Button Title")
            Spacer()
                .frame(maxWidth: .infinity)
            TextField("Label", text: $viewModel.linkButtonTitle)
                .multilineTextAlignment(.trailing)
        }
    }
    
    private var linkButtonIconToggle: some View {
        HStack {
            Toggle("Link Button Icon", isOn: $viewModel.linkButtonIconVisible)
        }
    }
    
    private var contentBeforeToggle: some View {
        HStack {
            Toggle("Content Before", isOn: $viewModel.hasContentBefore)
        }
    }
}

#Preview {
    NoteCompactView()
}
