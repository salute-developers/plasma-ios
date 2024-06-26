import Foundation

enum GeneralError: Error {
    case decoding
    case invalidFilename
    case invalidSchemeDirectory
    case invalidThemeDirectory
    case unableToCopyTokenSource
    case unableToDownloadFonts
    case invalidHex
    case invalidColorTokenFormat
    case invalidGradientFormat
    case invalidScreenSize
    case invalidTokenFormat
    case invalidPalette
    case fontNotFound
    case fontExtensionError
}

