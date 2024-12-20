import Foundation

// MARK: - AvatarAppearance Extension
public extension AvatarAppearance {
    func size(_ size: AvatarSizeConfiguration) -> AvatarAppearance {
        return AvatarAppearance(
            size: size,
            textFillStyle: self.textFillStyle,
            backgroundFillStyle: self.backgroundFillStyle,
            backgroundOpacity: self.backgroundOpacity,
            onlineStatusColor: self.onlineStatusColor,
            offlineStatusColor: self.offlineStatusColor,
            textTypography: self.textTypography
        )
    }
    
    func textFillStyle(_ textFillStyle: FillStyle) -> AvatarAppearance {
        return AvatarAppearance(
            size: self.size,
            textFillStyle: textFillStyle,
            backgroundFillStyle: self.backgroundFillStyle,
            backgroundOpacity: self.backgroundOpacity,
            onlineStatusColor: self.onlineStatusColor,
            offlineStatusColor: self.offlineStatusColor,
            textTypography: self.textTypography
        )
    }
    
    func backgroundFillStyle(_ backgroundFillStyle: FillStyle) -> AvatarAppearance {
        return AvatarAppearance(
            size: self.size,
            textFillStyle: self.textFillStyle,
            backgroundFillStyle: backgroundFillStyle,
            backgroundOpacity: self.backgroundOpacity,
            onlineStatusColor: self.onlineStatusColor,
            offlineStatusColor: self.offlineStatusColor,
            textTypography: self.textTypography
        )
    }
    
    func backgroundOpacity(_ backgroundOpacity: CGFloat) -> AvatarAppearance {
        return AvatarAppearance(
            size: self.size,
            textFillStyle: self.textFillStyle,
            backgroundFillStyle: self.backgroundFillStyle,
            backgroundOpacity: backgroundOpacity,
            onlineStatusColor: self.onlineStatusColor,
            offlineStatusColor: self.offlineStatusColor,
            textTypography: self.textTypography
        )
    }
    
    func onlineStatusColor(_ onlineStatusColor: ColorToken) -> AvatarAppearance {
        return AvatarAppearance(
            size: self.size,
            textFillStyle: self.textFillStyle,
            backgroundFillStyle: self.backgroundFillStyle,
            backgroundOpacity: self.backgroundOpacity,
            onlineStatusColor: onlineStatusColor,
            offlineStatusColor: self.offlineStatusColor,
            textTypography: self.textTypography
        )
    }
    
    func offlineStatusColor(_ offlineStatusColor: ColorToken) -> AvatarAppearance {
        return AvatarAppearance(
            size: self.size,
            textFillStyle: self.textFillStyle,
            backgroundFillStyle: self.backgroundFillStyle,
            backgroundOpacity: self.backgroundOpacity,
            onlineStatusColor: self.onlineStatusColor,
            offlineStatusColor: offlineStatusColor,
            textTypography: self.textTypography
        )
    }
    
    func textTypography(_ textTypography: TypographyConfiguration) -> AvatarAppearance {
        return AvatarAppearance(
            size: self.size,
            textFillStyle: self.textFillStyle,
            backgroundFillStyle: self.backgroundFillStyle,
            backgroundOpacity: self.backgroundOpacity,
            onlineStatusColor: self.onlineStatusColor,
            offlineStatusColor: self.offlineStatusColor,
            textTypography: textTypography
        )
    }
    
    func applyColorVariation(variation: AvatarAppearance) -> AvatarAppearance {
        return AvatarAppearance(
            size: size,
            textFillStyle: variation.textFillStyle,
            backgroundFillStyle: variation.backgroundFillStyle,
            backgroundOpacity: variation.backgroundOpacity,
            onlineStatusColor: variation.onlineStatusColor,
            offlineStatusColor: variation.offlineStatusColor,
            textTypography: textTypography
        )
    }
}
