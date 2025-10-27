import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct NoteView: View {
    @ObservedObject private var viewModel: NoteViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: NoteViewModel = NoteViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                notePreview
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
        .navigationTitle("Note")
    }
    
    @ViewBuilder
    private var notePreview: some View {
        noteContent
            .environment(\.noteAppearance, viewModel.appearance)
    }
    
    @ViewBuilder
    private var noteContent: some View {
        if viewModel.hasContentBefore {
            SDDSNote(
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
            SDDSNote(
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
    NoteView()
}
