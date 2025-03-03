import SwiftUI

import Combine
import SDDSComponents
import PhotosUI
import SDDSServTheme

struct AvatarView: View {
    @ObservedObject private var viewModel: AvatarViewModel = AvatarViewModel()
    @State private var showImagePicker = false
    @State private var showGradientPicker = false

    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSAvatar(
                        text: viewModel.text,
                        image: viewModel.image,
                        placeholderImage: viewModel.placeholderImage,
                        status: viewModel.status,
                        appearance: viewModel.appearance,
                        accessibility: viewModel.accessibility
                    )
                    Spacer()
                }
            }

            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Text("Text")
                    Spacer()
                    TextField("Avatar Text", text: $viewModel.text)
                        .multilineTextAlignment(.trailing)
                }

                HStack {
                    Text("Status")
                    Spacer()
                    Picker("Status", selection: $viewModel.status) {
                        ForEach(AvatarStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                HStack {
                    Text("Image")
                    Spacer()
                    Button("Select") {
                        viewModel.isPlaceholder = false
                        showImagePicker.toggle()
                    }
                    .buttonStyle(.borderless)
                    Button("Clear") {
                        viewModel.image = nil
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.red)
                }

                HStack {
                    Text("Placeholder Image")
                    Spacer()
                    Button("Select") {
                        viewModel.isPlaceholder = true
                        showImagePicker.toggle()
                    }
                    .buttonStyle(.borderless)
                    Button("Clear") {
                        viewModel.placeholderImage = nil
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.red)
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(viewModel: viewModel)
        }
        .navigationTitle("SDDSAvatar")
    }
}

#Preview {
    NavigationView {
        AvatarView()
    }
}
