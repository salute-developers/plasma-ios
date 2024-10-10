import Foundation
import SwiftUI
import Combine
import SDDSComponents

struct RadioboxView: View {
    @ObservedObject private var viewModel: RadioboxViewModel
    
    init(viewModel: RadioboxViewModel = RadioboxViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    SDDSRadiobox(
                        isSelected: $viewModel.isSelected,
                        title: viewModel.title,
                        subtitle: viewModel.subtitle,
                        isEnabled: viewModel.isEnabled,
                        images: RadioboxView.radiobox,
                        size: viewModel.size,
                        appearance: viewModel.appearance
                    )
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Text("Title")
                    Spacer()
                    TextField("Radiobox Title", text: $viewModel.title)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Subtitle")
                    Spacer()
                    TextField("Radiobox Subtitle", text: $viewModel.subtitle)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("State")
                    Spacer()
                    Toggle("Selected", isOn: $viewModel.isSelected)
                }
                
                HStack {
                    Toggle("Enabled", isOn: $viewModel.isEnabled)
                }
                
                HStack {
                    Text("Tint Color")
                    Spacer()
                    Menu {
                        ForEach(ColorStyle.allCases, id: \.self) { style in
                            Button(style.rawValue) {
                                viewModel.tintColor = style
                            }
                        }
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(viewModel.tintColor.color)
                            
                            Text(viewModel.tintColor.rawValue)
                        }
                    }
                }
                
                HStack {
                    Text("Image Size")
                    Spacer()
                    VStack {
                        TextField("Width", value: $viewModel.imageWidth, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .frame(maxWidth: 100)
                        TextField("Height", value: $viewModel.imageHeight, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .frame(maxWidth: 100)
                    }
                }
                
                HStack {
                    Text("Horizontal Gap")
                    Spacer()
                    TextField("Gap", value: $viewModel.horizontalGap, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
                
                HStack {
                    Text("Vertical Gap")
                    Spacer()
                    TextField("Gap", value: $viewModel.verticalGap, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .frame(maxWidth: 100)
                }
            }
        }
        .navigationTitle("SDDSRadiobox")
    }
}

extension RadioboxView {
    static var radiobox: RadioboxImages {
        .init(
            selectedImage: Image.image("radioboxOn", bundle: Bundle(for: CheckboxViewModel.self)),
            deselectedImage: Image.image("radioboxIconOff", bundle: Bundle(for: CheckboxViewModel.self))
        )
    }
}

#Preview {
    RadioboxView(viewModel: RadioboxViewModel())
}
