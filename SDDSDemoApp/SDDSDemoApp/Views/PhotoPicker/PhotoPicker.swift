import SwiftUI
import PhotosUI
import UIKit

struct PhotoPicker: UIViewControllerRepresentable {
    @ObservedObject var viewModel: AvatarViewModel
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else {
                return
            }

            provider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
                guard let self = self, let uiImage = image as? UIImage else {
                    return
                }
                DispatchQueue.main.async {
                    if self.parent.viewModel.isPlaceholder {
                        self.parent.viewModel.image = nil
                        self.parent.viewModel.placeholderImage = .image(Image(uiImage: uiImage))
                    } else {
                        self.parent.viewModel.placeholderImage = nil
                        self.parent.viewModel.image = .image(Image(uiImage: uiImage))
                    }
                }
            }
        }
    }
}
