import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.L> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.M> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.S> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Avatar, AvatarAppearance, AvatarVariation.Xxl> {
    
    var pilled: ComponentAppearanceVariation<Avatar, AvatarAppearance> {
        var size =  AvatarAnySize(size: appearance.size)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius-2.0) as PathDrawer
        size.statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxl.pilled",
            appearance: appearance
        )
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Avatar, AvatarAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension AvatarAppearance {
    
}
