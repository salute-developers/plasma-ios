import Foundation

enum GeneralError: Error {
    case decoding
    case invalidFilename
    case invalidSchemeDirectory
    case unableToCopyTokenSource
    case unableToDownloadFonts
    case invalidHex
    case invalidColorTokenFormat
    case invalidGradientFormat
    case invalidScreenSize
    case invalidTokenFormat
    case fontNotFound
}
