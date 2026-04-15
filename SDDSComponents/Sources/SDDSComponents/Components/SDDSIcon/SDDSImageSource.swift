import SwiftUI

/// Image content displayed by ``SDDSIcon``.
public enum SDDSImageSource {
    case image(Image)
    case asset(String, bundle: Bundle? = nil)
    case systemSymbol(String)
}
