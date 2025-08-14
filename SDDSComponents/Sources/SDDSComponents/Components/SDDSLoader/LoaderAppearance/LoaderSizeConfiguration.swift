import Foundation
import SwiftUI

public protocol LoaderSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {}

/**
 `LoaderSizeConfiguration` определяет размеры компонента Loader.
 
 Loader не имеет собственных размеров, только стили вложенных компонентов.
 Размеры определяются через spinnerAppearance и circularProgressAppearance.
 */
public struct DefaultLoaderSizeConfiguration: LoaderSizeConfiguration {
    
    public init() {}
    
    public var debugDescription: String {
        "DefaulLoaderSizeConfiguration"
    }
}
