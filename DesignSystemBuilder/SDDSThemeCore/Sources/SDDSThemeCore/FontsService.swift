import Foundation
import CoreGraphics
import CoreText

public struct FontInfo {
    public let url: String
    public let weight: String
    public let style: String
    public let filename: String

    public init(url: String, weight: String, style: String, filename: String) {
        self.url = url
        self.weight = weight
        self.style = style
        self.filename = filename
    }
}

/// Шрифт, вшитый в исходники темы base64-строкой, вместо файла на диске или ссылки в сети.
///
/// Такой шрифт регистрируется синхронно и одинаково работает при любом способе поставки темы:
/// статический xcframework, SwiftPM-пакет или автономный `--standalone`-бандл. Ресурсный
/// бандл при этом не нужен, а значит потребителю не нужно ничего доносить руками.
public struct EmbeddedFont {
    /// Имя исходного файла (`SBSansText-Regular.otf`) — только для диагностики.
    public let filename: String
    /// Содержимое `.otf`/`.ttf`, закодированное base64.
    public let base64: String

    public init(filename: String, base64: String) {
        self.filename = filename
        self.base64 = base64
    }
}

public final class FontsService {
    public static var shared = FontsService()

    private let urlSession: URLSession
    private let fileManager: FileManager

    init(urlSession: URLSession = .shared, fileManager: FileManager = .default) {
        self.urlSession = urlSession
        self.fileManager = fileManager
    }

    /// Регистрирует вшитые шрифты. Синхронно и без сети — вызывается из `Theme.initialize()`.
    ///
    /// - Returns: `true`, если зарегистрированы все шрифты. Уже зарегистрированный шрифт
    ///   успехом считается: повторный `initialize()` не должен выглядеть как ошибка.
    @discardableResult
    public func register(embeddedFonts fonts: [EmbeddedFont]) -> Bool {
        var allRegistered = true
        for font in fonts where !register(embeddedFont: font) {
            allRegistered = false
        }
        return allRegistered
    }

    @discardableResult
    public func register(embeddedFont font: EmbeddedFont) -> Bool {
        guard let data = Data(base64Encoded: font.base64, options: .ignoreUnknownCharacters) else {
            print("Failed to decode base64 payload of font \(font.filename)")
            return false
        }
        guard let provider = CGDataProvider(data: data as CFData) else {
            print("Could not create font data provider for \(font.filename)")
            return false
        }
        guard let cgFont = CGFont(provider) else {
            print("Could not create font from data provider for \(font.filename)")
            return false
        }
        return register(cgFont, name: font.filename)
    }

    public func initialize(fonts: [FontInfo], completion: ((Bool) -> Void)? = nil) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }

            let success = self.downloadAndRegisterFonts(fonts: fonts)

            DispatchQueue.main.async {
                completion?(success)
            }
        }
    }

    public func initialize(fontsDirectoryURL: URL, completion: ((Bool) -> Void)? = nil) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }

            let success = self.downloadAndRegisterFonts(from: fontsDirectoryURL)

            DispatchQueue.main.async {
                completion?(success)
            }
        }
    }

    @available(*, deprecated, message: "Use initialize(fontsDirectoryURL:completion:) instead")
    public func initialize(fontsDirectoryURL: URL) {
        let semaphore = DispatchSemaphore(value: 0)
        var success = false

        initialize(fontsDirectoryURL: fontsDirectoryURL) { result in
            success = result
            semaphore.signal()
        }

        semaphore.wait()
    }
}

extension FontsService {
    private func downloadAndRegisterFonts(from bundleURL: URL) -> Bool {
        guard let fonts = loadFonts(from: bundleURL) else {
            print("Failed to load fonts from bundle at \(bundleURL)")
            return false
        }
        return downloadAndRegisterFonts(fonts: fonts)
    }

    private func downloadAndRegisterFonts(fonts: [FontInfo]) -> Bool {
        let tempDirectory = fileManager.temporaryDirectory
            .appendingPathComponent("SDDSFonts", conformingTo: .directory)
            .appendingPathComponent(UUID().uuidString)

        do {
            try fileManager.createDirectory(at: tempDirectory, withIntermediateDirectories: true)
        } catch {
            print("Failed to create temporary directory: \(error)")
            return false
        }

        let group = DispatchGroup()
        var hasError = false

        for fontInfo in fonts {
            guard let fontURL = URL(string: fontInfo.url) else {
                print("Invalid font URL: \(fontInfo.url)")
                hasError = true
                continue
            }

            group.enter()
            downloadAndRegisterFont(url: fontURL, filename: fontInfo.filename, tempDirectory: tempDirectory) { success in
                if !success {
                    hasError = true
                    print("Failed to download or register font: \(fontInfo.filename)")
                }
                group.leave()
            }
        }

        group.wait()

        try? fileManager.removeItem(at: tempDirectory)

        return !hasError
    }

    private func loadFonts(from bundleURL: URL) -> [FontInfo]? {
        guard let bundle = Bundle(url: bundleURL) else {
            print("Failed to load bundle from \(bundleURL)")
            return nil
        }

        if let fonts = getFontsFromSwift(bundle: bundle) {
            return fonts
        }

        if let fonts = getFontsFromJSON(bundle: bundle) {
            return fonts
        }

        return nil
    }

    private func getFontsFromSwift(bundle: Bundle) -> [FontInfo]? {
        guard let moduleName = bundle.infoDictionary?["CFBundleName"] as? String else {
            return nil
        }

        let className = "\(moduleName).FontsManifest"
        guard let manifestClass = NSClassFromString(className) as? AnyClass else {
            return nil
        }

        guard let fontsMethod = class_getClassMethod(manifestClass, NSSelectorFromString("fonts")) else {
            return nil
        }

        typealias FontsMethod = @convention(c) (AnyClass, Selector) -> Unmanaged<NSArray>?
        let fontsImpl = method_getImplementation(fontsMethod)
        let function = unsafeBitCast(fontsImpl, to: FontsMethod.self)

        guard let fontsArray = function(manifestClass, NSSelectorFromString("fonts"))?.takeUnretainedValue() as? [Any] else {
            return nil
        }

        return fontsArray.compactMap { item in
            let mirror = Mirror(reflecting: item)
            var url: String?
            var weight: String?
            var style: String?
            var filename: String?

            for child in mirror.children {
                switch child.label {
                case "url": url = child.value as? String
                case "weight": weight = child.value as? String
                case "style": style = child.value as? String
                case "filename": filename = child.value as? String
                default: break
                }
            }

            guard let url = url, let weight = weight, let style = style, let filename = filename else {
                return nil
            }

            return FontInfo(url: url, weight: weight, style: style, filename: filename)
        }
    }

    private func getFontsFromJSON(bundle: Bundle) -> [FontInfo]? {
        guard let jsonURL = bundle.url(forResource: "fonts", withExtension: "json", subdirectory: "Fonts") else {
            return nil
        }

        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let json = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
            guard let fontsArray = json?["fonts"] as? [[String: Any]] else {
                return nil
            }

            return fontsArray.compactMap { dict in
                guard let url = dict["url"] as? String,
                      let weight = dict["weight"] as? String,
                      let style = dict["style"] as? String,
                      let filename = dict["filename"] as? String else {
                    return nil
                }
                return FontInfo(url: url, weight: weight, style: style, filename: filename)
            }
        } catch {
            print("Failed to decode JSON fonts manifest: \(error)")
            return nil
        }
    }

    private func downloadAndRegisterFont(url: URL, filename: String, tempDirectory: URL, completion: @escaping (Bool) -> Void) {
        let destinationURL = tempDirectory.appendingPathComponent(filename)

        if fileManager.fileExists(atPath: destinationURL.path) {
            registerFont(with: destinationURL)
            completion(true)
            return
        }

        let task = urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {
                completion(false)
                return
            }

            if let error = error {
                print("Error downloading font \(filename): \(error)")
                completion(false)
                return
            }

            guard let data = data, let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response when downloading font \(filename)")
                completion(false)
                return
            }

            do {
                try data.write(to: destinationURL)
                self.registerFont(with: destinationURL)
                completion(true)
            } catch {
                print("Failed to save font \(filename): \(error)")
                completion(false)
            }
        }

        task.resume()
    }

    private func registerFont(with url: URL) {
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            print("Could not create font data provider for \(url)")
            return
        }

        guard let font = CGFont(fontDataProvider) else {
            print("Could not create font from data provider for \(url)")
            return
        }

        _ = register(font, name: url.lastPathComponent)
    }
}

extension FontsService {
    /// Регистрация в `CTFontManager`. Повторная регистрация того же шрифта — не ошибка:
    /// `initialize()` темы может быть вызван несколько раз (тесты, смена тенанта).
    ///
    /// Результат проверяется по факту: если после неудачи шрифт доступен системе по своему
    /// PostScript-имени, значит он уже был зарегистрирован — это успех. Сверять код или текст
    /// ошибки ненадёжно: и то и другое различается между платформами.
    fileprivate func register(_ font: CGFont, name: String) -> Bool {
        var error: Unmanaged<CFError>?
        if CTFontManagerRegisterGraphicsFont(font, &error) {
            return true
        }
        if let postScriptName = font.postScriptName as String?, isAvailable(postScriptName: postScriptName) {
            return true
        }
        if let error = error?.takeUnretainedValue() {
            print("Error while registering font \(name): \(error)")
        } else {
            print("Unknown error while registering font \(name)")
        }
        return false
    }

    /// Доступен ли шрифт системе: резолвится ли дескриптор в него, а не в подстановку.
    private func isAvailable(postScriptName: String) -> Bool {
        let descriptor = CTFontDescriptorCreateWithNameAndSize(postScriptName as CFString, 16)
        let resolved = CTFontCopyPostScriptName(CTFontCreateWithFontDescriptor(descriptor, 16, nil)) as String
        return resolved == postScriptName
    }
}
