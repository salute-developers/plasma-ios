import Foundation

public struct FontInfo {
    public let url: String
    public let weight: String
    public let style: String
    public let filename: String
}

public struct FontsManifest {
    public static let fonts: [FontInfo] = [
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Light.otf", weight: "light", style: "normal", filename: "SBSansDisplay-Light.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Thin.otf", weight: "ultralight", style: "normal", filename: "SBSansDisplay-Thin.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Bold.otf", weight: "bold", style: "normal", filename: "SBSansDisplay-Bold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Regular.otf", weight: "regular", style: "normal", filename: "SBSansDisplay-Regular.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Semibold.otf", weight: "semibold", style: "normal", filename: "SBSansDisplay-Semibold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Medium.otf", weight: "medium", style: "normal", filename: "SBSansDisplay-Medium.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Light.otf", weight: "light", style: "normal", filename: "SBSansDisplay-Light.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Thin.otf", weight: "ultralight", style: "normal", filename: "SBSansDisplay-Thin.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Bold.otf", weight: "bold", style: "normal", filename: "SBSansDisplay-Bold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Regular.otf", weight: "regular", style: "normal", filename: "SBSansDisplay-Regular.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Semibold.otf", weight: "semibold", style: "normal", filename: "SBSansDisplay-Semibold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansDisplay.0.2.0/SBSansDisplay-Medium.otf", weight: "medium", style: "normal", filename: "SBSansDisplay-Medium.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Light.otf", weight: "light", style: "normal", filename: "SBSansText-Light.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Italic.otf", weight: "regular", style: "italic", filename: "SBSansText-Italic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-SemiboldItalic.otf", weight: "semibold", style: "italic", filename: "SBSansText-SemiboldItalic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Thin.otf", weight: "ultralight", style: "normal", filename: "SBSansText-Thin.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Regular.otf", weight: "regular", style: "normal", filename: "SBSansText-Regular.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Semibold.otf", weight: "semibold", style: "normal", filename: "SBSansText-Semibold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-LightItalic.otf", weight: "light", style: "italic", filename: "SBSansText-LightItalic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Bold.otf", weight: "bold", style: "normal", filename: "SBSansText-Bold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-BoldItalic.otf", weight: "bold", style: "italic", filename: "SBSansText-BoldItalic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Medium.otf", weight: "medium", style: "normal", filename: "SBSansText-Medium.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Light.otf", weight: "light", style: "normal", filename: "SBSansText-Light.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Italic.otf", weight: "regular", style: "italic", filename: "SBSansText-Italic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-SemiboldItalic.otf", weight: "semibold", style: "italic", filename: "SBSansText-SemiboldItalic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Thin.otf", weight: "ultralight", style: "normal", filename: "SBSansText-Thin.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Regular.otf", weight: "regular", style: "normal", filename: "SBSansText-Regular.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Semibold.otf", weight: "semibold", style: "normal", filename: "SBSansText-Semibold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-LightItalic.otf", weight: "light", style: "italic", filename: "SBSansText-LightItalic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Bold.otf", weight: "bold", style: "normal", filename: "SBSansText-Bold.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-BoldItalic.otf", weight: "bold", style: "italic", filename: "SBSansText-BoldItalic.otf"),
            FontInfo(url: "https://cdn-app.sberdevices.ru/shared-static/0.0.0/fonts/SBSansText.0.2.0/SBSansText-Medium.otf", weight: "medium", style: "normal", filename: "SBSansText-Medium.otf")
    ]
}
