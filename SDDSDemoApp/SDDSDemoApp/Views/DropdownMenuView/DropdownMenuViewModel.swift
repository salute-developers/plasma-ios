import Foundation
import Combine
import SwiftUI
import SDDSComponents

enum DropdownMenuButtonPosition: String, CaseIterable {
    case topLeft
    case topCenter
    case topRight
    case centerLeft
    case center
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}

final class DropdownMenuViewModel: ComponentViewModel<DropdownMenuVariationProvider> {
    @Published var placement: PopoverPlacement = .bottom
    @Published var alignment: PopoverAlignment = .center
    @Published var autoHide: Bool = true
    @Published var buttonPosition: DropdownMenuButtonPosition = .center
    @Published var duration: Int? = nil
    @Published var textInput: String = "3"
    @Published var itemsCount: Int = 3
    
    init() {
        super.init(variationProvider: DropdownMenuVariationProvider())
        
        $textInput
            .map { Int($0) ?? 0 }
            .assign(to: \.itemsCount, on: self)
            .store(in: &cancellables)
    }
}
