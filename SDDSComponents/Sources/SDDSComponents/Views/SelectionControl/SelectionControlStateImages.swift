import Foundation
import SwiftUI

public struct SelectionControlStateImages {
    public let selectedImage: Image
    public let deselectedImage: Image
    public let indeterminateImage: Image?
    
    public init(selectedImage: Image, deselectedImage: Image, indeterminateImage: Image?) {
        self.selectedImage = selectedImage
        self.deselectedImage = deselectedImage
        self.indeterminateImage = indeterminateImage
    }
}
