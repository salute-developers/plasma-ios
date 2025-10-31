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
                actionToggle
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
        switch (viewModel.hasContentBefore, viewModel.hasAction) {
        case (true, true):
            SDDSNoteCompact(
                title: viewModel.title,
                text: viewModel.text,
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
                },
                action: {
                    actionButton
                }
            )
        case (true, false):
            SDDSNoteCompact(
                title: viewModel.title,
                text: viewModel.text,
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
        case (false, true):
            SDDSNoteCompact(
                title: viewModel.title,
                text: viewModel.text,
                onClose: {
                    print("Close button tapped")
                },
                action: {
                    actionButton
                }
            )
        case (false, false):
            SDDSNoteCompact(
                title: viewModel.title,
                text: viewModel.text,
                onClose: {
                    print("Close button tapped")
                }
            )
        }
    }
    
    @ViewBuilder
    private var actionButton: some View {
        if let linkButtonAppearance = viewModel.appearance.linkButtonAppearance {
            LinkButton(
                title: "Label",
                iconAttributes: ButtonIconAttributes(image: Image("buttonIcon"), alignment: .trailing),
                appearance: linkButtonAppearance,
                action: {
                    print("Link button tapped")
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
    
    private var actionToggle: some View {
        HStack {
            Toggle("Has Action", isOn: $viewModel.hasAction)
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
