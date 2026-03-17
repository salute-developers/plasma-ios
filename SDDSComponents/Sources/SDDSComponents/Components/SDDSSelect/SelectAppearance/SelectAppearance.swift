import Foundation
import SwiftUI
import SDDSThemeCore

public struct SelectAppearance {
    public var dropdownAppearance: DropdownMenuAppearance
    public var textFieldAppearance: TextFieldAppearance
    public var buttonAppearance: ButtonAppearance
    public var selectItemAppearance: SelectItemAppearance
    public var size: SelectSizeConfiguration
    
    public init(
        dropdownAppearance: DropdownMenuAppearance = .defaultValue,
        textFieldAppearance: TextFieldAppearance = .defaultValue,
        buttonAppearance: ButtonAppearance = .defaultValue,
        selectItemAppearance: SelectItemAppearance = .defaultValue,
        size: SelectSizeConfiguration = ZeroSelectSize()
    ) {
        self.dropdownAppearance = dropdownAppearance
        self.textFieldAppearance = textFieldAppearance
        self.buttonAppearance = buttonAppearance
        self.selectItemAppearance = selectItemAppearance
        self.size = size
    }
}

extension SelectAppearance: EnvironmentKey {
    public static var defaultValue: SelectAppearance {
        SelectAppearance()
    }
}

