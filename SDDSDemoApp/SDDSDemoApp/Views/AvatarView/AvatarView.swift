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
                        accessibility: viewModel.accessibility,
                        extraContent: {
                            if viewModel.isBadgeEnabled {
                                SDDSBadge(
                                    label: viewModel.badgeViewModel.label,
                                    image: image,
                                    alignment: viewModel.badgeViewModel.alignment,
                                    style: .basic,
                                    appearance: viewModel.appearance.badgeAppearance
                                )
                            } else if viewModel.isCounterEnabled {
                                SDDSCounter(
                                    text: viewModel.counterViewModel.text,
                                    appearance: viewModel.appearance.counterAppearance,
                                    isAnimating: false,
                                    isHighlighted: false,
                                    isHovered: false,
                                    isSelected: false
                                )
                            } else {
                                EmptyView()
                            }
                        },
                        extraPlacement: viewModel.extraPlacement
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
                
                HStack {
                    Text("Extra Placement")
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Menu {
                        ForEach(AvatarExtraPlacement.allCases, id: \.self) { extraPlacement in
                            Button(extraPlacement.rawValue.capitalized) {
                                viewModel.extraPlacement = extraPlacement
                            }
                        }
                    } label: {
                        Text(viewModel.extraPlacement.rawValue)
                    }
                }
            }
            
            Section {
                HStack {
                    Toggle("Badge", isOn: $viewModel.isBadgeEnabled)
                }
                
                if viewModel.isBadgeEnabled {
                    BadgeView(viewModel: viewModel.badgeViewModel)
                }
            }
            
            Section {
                HStack {
                    Toggle("Counter", isOn: $viewModel.isCounterEnabled)
                }
                
                if viewModel.isCounterEnabled {
                    CounterView(viewModel: viewModel.counterViewModel)
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(viewModel: viewModel)
        }
        .navigationTitle("SDDSAvatar")
    }
    
    private var image: Image? {
        viewModel.badgeViewModel.iconVisible ? Image("buttonIcon") : nil
    }
}

#Preview {
    NavigationView {
        AvatarView()
    }
}
