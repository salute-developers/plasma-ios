import Foundation

public extension TextFieldAppearance {
    func size(_ size: TextFieldSizeConfiguration) -> TextFieldAppearance {
        var appearance = self
        appearance.size = size
        return appearance
    }

    func captionTypography(_ captionTypography: TypographyConfiguration) -> TextFieldAppearance {
        var appearance = self
        appearance.captionTypography = captionTypography
        return appearance
    }

    func innerTitleTypography(_ innerTitleTypography: TypographyConfiguration) -> TextFieldAppearance {
        var appearance = self
        appearance.innerTitleTypography = innerTitleTypography
        return appearance
    }

    func textAfterTypography(_ textAfterTypography: TypographyConfiguration) -> TextFieldAppearance {
        var appearance = self
        appearance.textAfterTypography = textAfterTypography
        return appearance
    }

    func textBeforeTypography(_ textBeforeTypography: TypographyConfiguration) -> TextFieldAppearance {
        var appearance = self
        appearance.textBeforeTypography = textBeforeTypography
        return appearance
    }

    func textTypography(_ textTypography: TypographyConfiguration) -> TextFieldAppearance {
        var appearance = self
        appearance.textTypography = textTypography
        return appearance
    }

    func titleTypography(_ titleTypography: TypographyConfiguration) -> TextFieldAppearance {
        var appearance = self
        appearance.titleTypography = titleTypography
        return appearance
    }
    
    func chipAppearance(_ chipAppearance: ChipAppearance) -> TextFieldAppearance {
        var appearance = self
        appearance.chipAppearance = chipAppearance
        return appearance
    }
    
    func chipGroupAppearance(_ chipGroupAppearance: ChipGroupAppearance) -> TextFieldAppearance {
        var appearance = self
        appearance.chipGroupAppearance = chipGroupAppearance
        return appearance
    }
    
    func titleColor(_ titleColor: ColorToken) -> TextFieldAppearance {
        var appearance = self
        appearance.titleColor = titleColor
        return appearance
    }
    
    func labelPlacement(_ labelPlacement: TextFieldLabelPlacement) -> TextFieldAppearance {
        var appearance = self
        appearance.labelPlacement = labelPlacement
        return appearance
    }
    
    func requiredPlacement(_ requiredPlacement: TextFieldRequiredPlacement) -> TextFieldAppearance {
        var appearance = self
        appearance.requiredPlacement = requiredPlacement
        return appearance
    }
    
    func applyColorVariation(variation: TextFieldAppearance) -> TextFieldAppearance {
        var appearance = variation
        appearance.size = self.size
        return appearance
    }

}
