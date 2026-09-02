import Foundation

public enum GeneralError: Error {
    case decoding
    case schemeNotFound
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
    case unableWriteData
    case nsError(Error)
    case codeGeneration(CodeGenerationError)
    case emptyData
}

