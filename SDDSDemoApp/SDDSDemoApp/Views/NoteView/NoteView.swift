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
                HStack {
                    Spacer()
                    notePreview
                    Spacer()
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            
            Section {
                VariationsView(viewModel: viewModel)
                
                HStack {
                    Text("Title")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Заголовок", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Text")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Описание", text: $viewModel.text)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Link Button Title")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    TextField("Действие", text: $viewModel.linkButtonTitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Toggle("Link Button Icon", isOn: $viewModel.linkButtonIconVisible)
                }
                
                HStack {
                    Toggle("Content Before", isOn: $viewModel.hasContentBefore)
                }
                
                HStack {
                    Toggle("Close Button", isOn: $viewModel.hasCloseButton)
                }
            }
        }
        .navigationTitle("Note")
    }
    
    @ViewBuilder
    private var notePreview: some View {
        if viewModel.hasContentBefore {
            Note(
                title: viewModel.title,
                text: viewModel.text,
                linkButtonTitle: viewModel.linkButtonTitle,
                linkButtonIcon: viewModel.linkButtonIcon,
                onLinkButtonTap: {
                    print("Link button tapped")
                },
                onClose: viewModel.hasCloseButton ? {
                    print("Close button tapped")
                } : nil,
                contentBefore: {
                    Image("plasma")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 36, height: 36)
                }
            )
            .environment(\.noteAppearance, viewModel.appearance)
            .padding()
        } else {
            Note(
                title: viewModel.title,
                text: viewModel.text,
                linkButtonTitle: viewModel.linkButtonTitle,
                linkButtonIcon: viewModel.linkButtonIcon,
                onLinkButtonTap: {
                    print("Link button tapped")
                },
                onClose: viewModel.hasCloseButton ? {
                    print("Close button tapped")
                } : nil
            )
            .environment(\.noteAppearance, viewModel.appearance)
            .padding()
        }
    }
}

#Preview {
    NoteView()
}
