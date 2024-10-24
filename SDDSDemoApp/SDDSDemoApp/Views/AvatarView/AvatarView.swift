import SwiftUI
import SDDSComponentsPreview
import Combine
import SDDSComponents
import PhotosUI

struct AvatarView: View {
    @ObservedObject private var viewModel: AvatarViewModel
    @State private var showImagePicker = false
    @State private var isSelectingPlaceholder = false
    @State private var showGradientPicker = false

    init(viewModel: AvatarViewModel = AvatarViewModel()) {
        self.viewModel = viewModel
    }

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
                        size: viewModel.size,
                        accessibility: viewModel.accessibility
                    )
                    Spacer()
                }
            }

            Section {
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
                        isSelectingPlaceholder = false
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
                        isSelectingPlaceholder = true
                        showImagePicker.toggle()
                    }
                    .buttonStyle(.borderless)
                    Button("Clear") {
                        viewModel.placeholderImage = nil
                    }
                    .buttonStyle(.borderless)
                    .foregroundColor(.red)
                }

                HStack {
                    Text("Avatar Size")
                    Spacer()
                    Picker("Size", selection: $viewModel.size) {
                        ForEach(DefaultAvatarSize.allCases, id: \.self) { size in
                            Text(size.description).tag(size)
                        }
                    }
                }

                HStack {
                    Text("Appearance")
                    Spacer()
                    Picker("Appearance", selection: $viewModel.appearance) {
                        ForEach(AvatarAppearance.allCases, id: \.self) { appearance in
                            Text(appearance.name).tag(appearance)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(isPlaceholder: isSelectingPlaceholder, viewModel: viewModel)
        }
        .navigationTitle("SDDSAvatar")
    }
}

#Preview {
    NavigationView {
        AvatarView()
    }
}
