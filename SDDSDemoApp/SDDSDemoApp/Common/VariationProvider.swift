import Foundation
import SDDSComponents

protocol VariationProvider: AnyObject {
    associatedtype Appearance

    var variations: [Variation<Appearance>] { get }
    
    var defaultValue: Appearance { get }
    
    var theme: Theme { get set }
}
