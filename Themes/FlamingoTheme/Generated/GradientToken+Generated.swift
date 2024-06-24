import SwiftUI
import UIKit
@_exported import SDDSThemeCore

public extension GradientToken {
    static var backgroundDefaultGradientBlue: Self {
        GradientToken(
            description: "backgroundDefaultGradientBlue",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#129DFAFF")), 
                            Color(UIColor(hex: "#52BAFFFF"))
                        ],
                        angle: 305.27
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#129DFAFF")), 
                            Color(UIColor(hex: "#52BAFFFF"))
                        ],
                        angle: 305.27
                    )
                )
            ]
        )
    }
    static var backgroundDefaultGradientGreen: Self {
        GradientToken(
            description: "backgroundDefaultGradientGreen",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#24B23EFF")), 
                            Color(UIColor(hex: "#AFED00FF"))
                        ],
                        angle: 305.27
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#24B23EFF")), 
                            Color(UIColor(hex: "#AFED00FF"))
                        ],
                        angle: 305.27
                    )
                )
            ]
        )
    }
    static var backgroundDefaultGradientOrange: Self {
        GradientToken(
            description: "backgroundDefaultGradientOrange",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#FA6D20FF")), 
                            Color(UIColor(hex: "#FA9D6BFF"))
                        ],
                        angle: 305.27
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#FA6D20FF")), 
                            Color(UIColor(hex: "#FA9D6BFF"))
                        ],
                        angle: 305.27
                    )
                )
            ]
        )
    }
    static var backgroundDefaultGradientPink: Self {
        GradientToken(
            description: "backgroundDefaultGradientPink",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.08, 
                            0.91
                        ],
                        colors: [
                            Color(UIColor(hex: "#FF1F78FF")), 
                            Color(UIColor(hex: "#FF8FBCFF"))
                        ],
                        angle: 304.01
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.08, 
                            0.91
                        ],
                        colors: [
                            Color(UIColor(hex: "#FF1F78FF")), 
                            Color(UIColor(hex: "#FF8FBCFF"))
                        ],
                        angle: 304.01
                    )
                )
            ]
        )
    }
    static var backgroundDefaultGradientPurple: Self {
        GradientToken(
            description: "backgroundDefaultGradientPurple",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.08, 
                            0.91
                        ],
                        colors: [
                            Color(UIColor(hex: "#AD42F5FF")), 
                            Color(UIColor(hex: "#D39CF7FF"))
                        ],
                        angle: 304.01
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.08, 
                            0.91
                        ],
                        colors: [
                            Color(UIColor(hex: "#AD42F5FF")), 
                            Color(UIColor(hex: "#D39CF7FF"))
                        ],
                        angle: 304.33
                    )
                )
            ]
        )
    }
    static var backgroundDefaultGradientRed: Self {
        GradientToken(
            description: "backgroundDefaultGradientRed",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#FF2E43FF")), 
                            Color(UIColor(hex: "#FD96A0FF"))
                        ],
                        angle: 305.27
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#FF2E43FF")), 
                            Color(UIColor(hex: "#FD96A0FF"))
                        ],
                        angle: 305.27
                    )
                )
            ]
        )
    }
    static var backgroundDefaultGradientYellow: Self {
        GradientToken(
            description: "backgroundDefaultGradientYellow",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#F2C202FF")), 
                            Color(UIColor(hex: "#FFD83DFF"))
                        ],
                        angle: 305.27
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0.01, 
                            0.96
                        ],
                        colors: [
                            Color(UIColor(hex: "#F2C202FF")), 
                            Color(UIColor(hex: "#FFD83DFF"))
                        ],
                        angle: 305.27
                    )
                )
            ]
        )
    }
    static var outlineDefaultAccentGradient: Self {
        GradientToken(
            description: "outlineDefaultAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultAccentGradientActive: Self {
        GradientToken(
            description: "outlineDefaultAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultAccentGradientHover: Self {
        GradientToken(
            description: "outlineDefaultAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultAccentMinorGradient: Self {
        GradientToken(
            description: "outlineDefaultAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultAccentMinorGradientActive: Self {
        GradientToken(
            description: "outlineDefaultAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultAccentMinorGradientHover: Self {
        GradientToken(
            description: "outlineDefaultAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultPromoGradient: Self {
        GradientToken(
            description: "outlineDefaultPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultPromoGradientActive: Self {
        GradientToken(
            description: "outlineDefaultPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultPromoGradientHover: Self {
        GradientToken(
            description: "outlineDefaultPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultPromoMinorGradient: Self {
        GradientToken(
            description: "outlineDefaultPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultPromoMinorGradientActive: Self {
        GradientToken(
            description: "outlineDefaultPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultPromoMinorGradientHover: Self {
        GradientToken(
            description: "outlineDefaultPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultTransparentAccentGradient: Self {
        GradientToken(
            description: "outlineDefaultTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultTransparentAccentGradientActive: Self {
        GradientToken(
            description: "outlineDefaultTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineDefaultTransparentAccentGradientHover: Self {
        GradientToken(
            description: "outlineDefaultTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseAccentGradient: Self {
        GradientToken(
            description: "outlineInverseAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseAccentGradientActive: Self {
        GradientToken(
            description: "outlineInverseAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseAccentGradientHover: Self {
        GradientToken(
            description: "outlineInverseAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseAccentMinorGradient: Self {
        GradientToken(
            description: "outlineInverseAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseAccentMinorGradientActive: Self {
        GradientToken(
            description: "outlineInverseAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseAccentMinorGradientHover: Self {
        GradientToken(
            description: "outlineInverseAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInversePromoGradient: Self {
        GradientToken(
            description: "outlineInversePromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInversePromoGradientActive: Self {
        GradientToken(
            description: "outlineInversePromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInversePromoGradientHover: Self {
        GradientToken(
            description: "outlineInversePromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInversePromoMinorGradient: Self {
        GradientToken(
            description: "outlineInversePromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInversePromoMinorGradientActive: Self {
        GradientToken(
            description: "outlineInversePromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInversePromoMinorGradientHover: Self {
        GradientToken(
            description: "outlineInversePromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseTransparentAccentGradient: Self {
        GradientToken(
            description: "outlineInverseTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseTransparentAccentGradientActive: Self {
        GradientToken(
            description: "outlineInverseTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineInverseTransparentAccentGradientHover: Self {
        GradientToken(
            description: "outlineInverseTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkAccentGradient: Self {
        GradientToken(
            description: "outlineOnDarkAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkAccentGradientActive: Self {
        GradientToken(
            description: "outlineOnDarkAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkAccentGradientHover: Self {
        GradientToken(
            description: "outlineOnDarkAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkAccentMinorGradient: Self {
        GradientToken(
            description: "outlineOnDarkAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkAccentMinorGradientActive: Self {
        GradientToken(
            description: "outlineOnDarkAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkAccentMinorGradientHover: Self {
        GradientToken(
            description: "outlineOnDarkAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkPromoGradient: Self {
        GradientToken(
            description: "outlineOnDarkPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkPromoGradientActive: Self {
        GradientToken(
            description: "outlineOnDarkPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkPromoGradientHover: Self {
        GradientToken(
            description: "outlineOnDarkPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkPromoMinorGradient: Self {
        GradientToken(
            description: "outlineOnDarkPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkPromoMinorGradientActive: Self {
        GradientToken(
            description: "outlineOnDarkPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkPromoMinorGradientHover: Self {
        GradientToken(
            description: "outlineOnDarkPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkTransparentAccentGradient: Self {
        GradientToken(
            description: "outlineOnDarkTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkTransparentAccentGradientActive: Self {
        GradientToken(
            description: "outlineOnDarkTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnDarkTransparentAccentGradientHover: Self {
        GradientToken(
            description: "outlineOnDarkTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightAccentGradient: Self {
        GradientToken(
            description: "outlineOnLightAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightAccentGradientActive: Self {
        GradientToken(
            description: "outlineOnLightAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightAccentGradientHover: Self {
        GradientToken(
            description: "outlineOnLightAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightAccentMinorGradient: Self {
        GradientToken(
            description: "outlineOnLightAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightAccentMinorGradientActive: Self {
        GradientToken(
            description: "outlineOnLightAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightAccentMinorGradientHover: Self {
        GradientToken(
            description: "outlineOnLightAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightPromoGradient: Self {
        GradientToken(
            description: "outlineOnLightPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightPromoGradientActive: Self {
        GradientToken(
            description: "outlineOnLightPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightPromoGradientHover: Self {
        GradientToken(
            description: "outlineOnLightPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightPromoMinorGradient: Self {
        GradientToken(
            description: "outlineOnLightPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightPromoMinorGradientActive: Self {
        GradientToken(
            description: "outlineOnLightPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightPromoMinorGradientHover: Self {
        GradientToken(
            description: "outlineOnLightPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightTransparentAccentGradient: Self {
        GradientToken(
            description: "outlineOnLightTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightTransparentAccentGradientActive: Self {
        GradientToken(
            description: "outlineOnLightTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var outlineOnLightTransparentAccentGradientHover: Self {
        GradientToken(
            description: "outlineOnLightTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultAccentGradient: Self {
        GradientToken(
            description: "surfaceDefaultAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#108210FF")), 
                            Color(UIColor(hex: "#14CC98FF"))
                        ],
                        angle: 315.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#108210FF")), 
                            Color(UIColor(hex: "#14CC98FF"))
                        ],
                        angle: 315.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultAccentGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultAccentGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultAccentMinorGradient: Self {
        GradientToken(
            description: "surfaceDefaultAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultAccentMinorGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultAccentMinorGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultPromoGradient: Self {
        GradientToken(
            description: "surfaceDefaultPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultPromoGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultPromoGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultPromoMinorGradient: Self {
        GradientToken(
            description: "surfaceDefaultPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultPromoMinorGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultPromoMinorGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultSkeletonDeepGradient: Self {
        GradientToken(
            description: "surfaceDefaultSkeletonDeepGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultSkeletonDeepGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultSkeletonDeepGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultSkeletonDeepGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultSkeletonDeepGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultSkeletonGradient: Self {
        GradientToken(
            description: "surfaceDefaultSkeletonGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultSkeletonGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultSkeletonGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultSkeletonGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultSkeletonGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultTransparentAccentGradient: Self {
        GradientToken(
            description: "surfaceDefaultTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultTransparentAccentGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultTransparentAccentGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultTransparentPromoGradient: Self {
        GradientToken(
            description: "surfaceDefaultTransparentPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultTransparentPromoGradientActive: Self {
        GradientToken(
            description: "surfaceDefaultTransparentPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceDefaultTransparentPromoGradientHover: Self {
        GradientToken(
            description: "surfaceDefaultTransparentPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseAccentGradient: Self {
        GradientToken(
            description: "surfaceInverseAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseAccentGradientActive: Self {
        GradientToken(
            description: "surfaceInverseAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseAccentGradientHover: Self {
        GradientToken(
            description: "surfaceInverseAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseAccentMinorGradient: Self {
        GradientToken(
            description: "surfaceInverseAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseAccentMinorGradientActive: Self {
        GradientToken(
            description: "surfaceInverseAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseAccentMinorGradientHover: Self {
        GradientToken(
            description: "surfaceInverseAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInversePromoGradient: Self {
        GradientToken(
            description: "surfaceInversePromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInversePromoGradientActive: Self {
        GradientToken(
            description: "surfaceInversePromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInversePromoGradientHover: Self {
        GradientToken(
            description: "surfaceInversePromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInversePromoMinorGradient: Self {
        GradientToken(
            description: "surfaceInversePromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInversePromoMinorGradientActive: Self {
        GradientToken(
            description: "surfaceInversePromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInversePromoMinorGradientHover: Self {
        GradientToken(
            description: "surfaceInversePromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseSkeletonDeepGradient: Self {
        GradientToken(
            description: "surfaceInverseSkeletonDeepGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseSkeletonDeepGradientActive: Self {
        GradientToken(
            description: "surfaceInverseSkeletonDeepGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseSkeletonDeepGradientHover: Self {
        GradientToken(
            description: "surfaceInverseSkeletonDeepGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseSkeletonGradient: Self {
        GradientToken(
            description: "surfaceInverseSkeletonGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseSkeletonGradientActive: Self {
        GradientToken(
            description: "surfaceInverseSkeletonGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseSkeletonGradientHover: Self {
        GradientToken(
            description: "surfaceInverseSkeletonGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseTransparentAccentGradient: Self {
        GradientToken(
            description: "surfaceInverseTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseTransparentAccentGradientActive: Self {
        GradientToken(
            description: "surfaceInverseTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseTransparentAccentGradientHover: Self {
        GradientToken(
            description: "surfaceInverseTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseTransparentPromoGradient: Self {
        GradientToken(
            description: "surfaceInverseTransparentPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseTransparentPromoGradientActive: Self {
        GradientToken(
            description: "surfaceInverseTransparentPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceInverseTransparentPromoGradientHover: Self {
        GradientToken(
            description: "surfaceInverseTransparentPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkAccentGradient: Self {
        GradientToken(
            description: "surfaceOnDarkAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkAccentGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkAccentGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkAccentMinorGradient: Self {
        GradientToken(
            description: "surfaceOnDarkAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkAccentMinorGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkAccentMinorGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkPromoGradient: Self {
        GradientToken(
            description: "surfaceOnDarkPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkPromoGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkPromoGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkPromoMinorGradient: Self {
        GradientToken(
            description: "surfaceOnDarkPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkPromoMinorGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkPromoMinorGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkSkeletonDeepGradient: Self {
        GradientToken(
            description: "surfaceOnDarkSkeletonDeepGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF0A")), 
                            Color(UIColor(hex: "#FFFFFF33")), 
                            Color(UIColor(hex: "#FFFFFF52")), 
                            Color(UIColor(hex: "#FFFFFF5C"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkSkeletonDeepGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkSkeletonDeepGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkSkeletonDeepGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkSkeletonDeepGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkSkeletonGradient: Self {
        GradientToken(
            description: "surfaceOnDarkSkeletonGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF03")), 
                            Color(UIColor(hex: "#FFFFFF0D")), 
                            Color(UIColor(hex: "#FFFFFF14")), 
                            Color(UIColor(hex: "#FFFFFF17"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkSkeletonGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkSkeletonGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkSkeletonGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkSkeletonGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkTransparentAccentGradient: Self {
        GradientToken(
            description: "surfaceOnDarkTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkTransparentAccentGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkTransparentAccentGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkTransparentPromoGradient: Self {
        GradientToken(
            description: "surfaceOnDarkTransparentPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkTransparentPromoGradientActive: Self {
        GradientToken(
            description: "surfaceOnDarkTransparentPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnDarkTransparentPromoGradientHover: Self {
        GradientToken(
            description: "surfaceOnDarkTransparentPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightAccentGradient: Self {
        GradientToken(
            description: "surfaceOnLightAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightAccentGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightAccentGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightAccentMinorGradient: Self {
        GradientToken(
            description: "surfaceOnLightAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightAccentMinorGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightAccentMinorGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightPromoGradient: Self {
        GradientToken(
            description: "surfaceOnLightPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightPromoGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightPromoGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightPromoMinorGradient: Self {
        GradientToken(
            description: "surfaceOnLightPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightPromoMinorGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightPromoMinorGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightSkeletonDeepGradient: Self {
        GradientToken(
            description: "surfaceOnLightSkeletonDeepGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#0808080A")), 
                            Color(UIColor(hex: "#08080833")), 
                            Color(UIColor(hex: "#08080852")), 
                            Color(UIColor(hex: "#0808085C"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightSkeletonDeepGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightSkeletonDeepGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightSkeletonDeepGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightSkeletonDeepGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightSkeletonGradient: Self {
        GradientToken(
            description: "surfaceOnLightSkeletonGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            0.0625, 
                            0.125, 
                            0.25, 
                            0.375, 
                            0.4375, 
                            0.5, 
                            0.5625, 
                            0.625, 
                            0.75, 
                            0.875, 
                            0.9375, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080803")), 
                            Color(UIColor(hex: "#0808080D")), 
                            Color(UIColor(hex: "#08080814")), 
                            Color(UIColor(hex: "#08080817"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightSkeletonGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightSkeletonGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightSkeletonGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightSkeletonGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightTransparentAccentGradient: Self {
        GradientToken(
            description: "surfaceOnLightTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightTransparentAccentGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightTransparentAccentGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightTransparentPromoGradient: Self {
        GradientToken(
            description: "surfaceOnLightTransparentPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightTransparentPromoGradientActive: Self {
        GradientToken(
            description: "surfaceOnLightTransparentPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var surfaceOnLightTransparentPromoGradientHover: Self {
        GradientToken(
            description: "surfaceOnLightTransparentPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultAccentGradient: Self {
        GradientToken(
            description: "textDefaultAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#0B8C0BFF")), 
                            Color(UIColor(hex: "#14CC98FF"))
                        ],
                        angle: 315.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#108210FF")), 
                            Color(UIColor(hex: "#14CC98FF"))
                        ],
                        angle: 315.0
                    )
                )
            ]
        )
    }
    static var textDefaultAccentGradientActive: Self {
        GradientToken(
            description: "textDefaultAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultAccentGradientHover: Self {
        GradientToken(
            description: "textDefaultAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultAccentMinorGradient: Self {
        GradientToken(
            description: "textDefaultAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultAccentMinorGradientActive: Self {
        GradientToken(
            description: "textDefaultAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultAccentMinorGradientHover: Self {
        GradientToken(
            description: "textDefaultAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultPromoGradient: Self {
        GradientToken(
            description: "textDefaultPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultPromoGradientActive: Self {
        GradientToken(
            description: "textDefaultPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultPromoGradientHover: Self {
        GradientToken(
            description: "textDefaultPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultPromoMinorGradient: Self {
        GradientToken(
            description: "textDefaultPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultPromoMinorGradientActive: Self {
        GradientToken(
            description: "textDefaultPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultPromoMinorGradientHover: Self {
        GradientToken(
            description: "textDefaultPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultTransparentAccentGradient: Self {
        GradientToken(
            description: "textDefaultTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultTransparentAccentGradientActive: Self {
        GradientToken(
            description: "textDefaultTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textDefaultTransparentAccentGradientHover: Self {
        GradientToken(
            description: "textDefaultTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseAccentGradient: Self {
        GradientToken(
            description: "textInverseAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#108210FF")), 
                            Color(UIColor(hex: "#14CC98FF"))
                        ],
                        angle: 315.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#0B8C0BFF")), 
                            Color(UIColor(hex: "#14CC98FF"))
                        ],
                        angle: 315.0
                    )
                )
            ]
        )
    }
    static var textInverseAccentGradientActive: Self {
        GradientToken(
            description: "textInverseAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseAccentGradientHover: Self {
        GradientToken(
            description: "textInverseAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseAccentMinorGradient: Self {
        GradientToken(
            description: "textInverseAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseAccentMinorGradientActive: Self {
        GradientToken(
            description: "textInverseAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseAccentMinorGradientHover: Self {
        GradientToken(
            description: "textInverseAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInversePromoGradient: Self {
        GradientToken(
            description: "textInversePromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInversePromoGradientActive: Self {
        GradientToken(
            description: "textInversePromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInversePromoGradientHover: Self {
        GradientToken(
            description: "textInversePromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInversePromoMinorGradient: Self {
        GradientToken(
            description: "textInversePromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInversePromoMinorGradientActive: Self {
        GradientToken(
            description: "textInversePromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInversePromoMinorGradientHover: Self {
        GradientToken(
            description: "textInversePromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseTransparentAccentGradient: Self {
        GradientToken(
            description: "textInverseTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseTransparentAccentGradientActive: Self {
        GradientToken(
            description: "textInverseTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textInverseTransparentAccentGradientHover: Self {
        GradientToken(
            description: "textInverseTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkAccentGradient: Self {
        GradientToken(
            description: "textOnDarkAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkAccentGradientActive: Self {
        GradientToken(
            description: "textOnDarkAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkAccentGradientHover: Self {
        GradientToken(
            description: "textOnDarkAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkAccentMinorGradient: Self {
        GradientToken(
            description: "textOnDarkAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkAccentMinorGradientActive: Self {
        GradientToken(
            description: "textOnDarkAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkAccentMinorGradientHover: Self {
        GradientToken(
            description: "textOnDarkAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkPromoGradient: Self {
        GradientToken(
            description: "textOnDarkPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkPromoGradientActive: Self {
        GradientToken(
            description: "textOnDarkPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkPromoGradientHover: Self {
        GradientToken(
            description: "textOnDarkPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkPromoMinorGradient: Self {
        GradientToken(
            description: "textOnDarkPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkPromoMinorGradientActive: Self {
        GradientToken(
            description: "textOnDarkPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkPromoMinorGradientHover: Self {
        GradientToken(
            description: "textOnDarkPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkTransparentAccentGradient: Self {
        GradientToken(
            description: "textOnDarkTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkTransparentAccentGradientActive: Self {
        GradientToken(
            description: "textOnDarkTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnDarkTransparentAccentGradientHover: Self {
        GradientToken(
            description: "textOnDarkTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightAccentGradient: Self {
        GradientToken(
            description: "textOnLightAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightAccentGradientActive: Self {
        GradientToken(
            description: "textOnLightAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightAccentGradientHover: Self {
        GradientToken(
            description: "textOnLightAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightAccentMinorGradient: Self {
        GradientToken(
            description: "textOnLightAccentMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightAccentMinorGradientActive: Self {
        GradientToken(
            description: "textOnLightAccentMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightAccentMinorGradientHover: Self {
        GradientToken(
            description: "textOnLightAccentMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightPromoGradient: Self {
        GradientToken(
            description: "textOnLightPromoGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightPromoGradientActive: Self {
        GradientToken(
            description: "textOnLightPromoGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightPromoGradientHover: Self {
        GradientToken(
            description: "textOnLightPromoGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightPromoMinorGradient: Self {
        GradientToken(
            description: "textOnLightPromoMinorGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightPromoMinorGradientActive: Self {
        GradientToken(
            description: "textOnLightPromoMinorGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightPromoMinorGradientHover: Self {
        GradientToken(
            description: "textOnLightPromoMinorGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightTransparentAccentGradient: Self {
        GradientToken(
            description: "textOnLightTransparentAccentGradient",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightTransparentAccentGradientActive: Self {
        GradientToken(
            description: "textOnLightTransparentAccentGradientActive",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var textOnLightTransparentAccentGradientHover: Self {
        GradientToken(
            description: "textOnLightTransparentAccentGradientHover",
            darkGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ],
            lightGradients: [
                .linear(
                    LinearGradient(
                        locations: [
                            0, 
                            1
                        ],
                        colors: [
                            Color(UIColor(hex: "#FFFFFF")), 
                            Color(UIColor(hex: "#000000"))
                        ],
                        angle: 90.0
                    )
                )
            ]
        )
    }
    static var tokens: [Self] = [
        backgroundDefaultGradientBlue,
        backgroundDefaultGradientGreen,
        backgroundDefaultGradientOrange,
        backgroundDefaultGradientPink,
        backgroundDefaultGradientPurple,
        backgroundDefaultGradientRed,
        backgroundDefaultGradientYellow,
        outlineDefaultAccentGradient,
        outlineDefaultAccentGradientActive,
        outlineDefaultAccentGradientHover,
        outlineDefaultAccentMinorGradient,
        outlineDefaultAccentMinorGradientActive,
        outlineDefaultAccentMinorGradientHover,
        outlineDefaultPromoGradient,
        outlineDefaultPromoGradientActive,
        outlineDefaultPromoGradientHover,
        outlineDefaultPromoMinorGradient,
        outlineDefaultPromoMinorGradientActive,
        outlineDefaultPromoMinorGradientHover,
        outlineDefaultTransparentAccentGradient,
        outlineDefaultTransparentAccentGradientActive,
        outlineDefaultTransparentAccentGradientHover,
        outlineInverseAccentGradient,
        outlineInverseAccentGradientActive,
        outlineInverseAccentGradientHover,
        outlineInverseAccentMinorGradient,
        outlineInverseAccentMinorGradientActive,
        outlineInverseAccentMinorGradientHover,
        outlineInversePromoGradient,
        outlineInversePromoGradientActive,
        outlineInversePromoGradientHover,
        outlineInversePromoMinorGradient,
        outlineInversePromoMinorGradientActive,
        outlineInversePromoMinorGradientHover,
        outlineInverseTransparentAccentGradient,
        outlineInverseTransparentAccentGradientActive,
        outlineInverseTransparentAccentGradientHover,
        outlineOnDarkAccentGradient,
        outlineOnDarkAccentGradientActive,
        outlineOnDarkAccentGradientHover,
        outlineOnDarkAccentMinorGradient,
        outlineOnDarkAccentMinorGradientActive,
        outlineOnDarkAccentMinorGradientHover,
        outlineOnDarkPromoGradient,
        outlineOnDarkPromoGradientActive,
        outlineOnDarkPromoGradientHover,
        outlineOnDarkPromoMinorGradient,
        outlineOnDarkPromoMinorGradientActive,
        outlineOnDarkPromoMinorGradientHover,
        outlineOnDarkTransparentAccentGradient,
        outlineOnDarkTransparentAccentGradientActive,
        outlineOnDarkTransparentAccentGradientHover,
        outlineOnLightAccentGradient,
        outlineOnLightAccentGradientActive,
        outlineOnLightAccentGradientHover,
        outlineOnLightAccentMinorGradient,
        outlineOnLightAccentMinorGradientActive,
        outlineOnLightAccentMinorGradientHover,
        outlineOnLightPromoGradient,
        outlineOnLightPromoGradientActive,
        outlineOnLightPromoGradientHover,
        outlineOnLightPromoMinorGradient,
        outlineOnLightPromoMinorGradientActive,
        outlineOnLightPromoMinorGradientHover,
        outlineOnLightTransparentAccentGradient,
        outlineOnLightTransparentAccentGradientActive,
        outlineOnLightTransparentAccentGradientHover,
        surfaceDefaultAccentGradient,
        surfaceDefaultAccentGradientActive,
        surfaceDefaultAccentGradientHover,
        surfaceDefaultAccentMinorGradient,
        surfaceDefaultAccentMinorGradientActive,
        surfaceDefaultAccentMinorGradientHover,
        surfaceDefaultPromoGradient,
        surfaceDefaultPromoGradientActive,
        surfaceDefaultPromoGradientHover,
        surfaceDefaultPromoMinorGradient,
        surfaceDefaultPromoMinorGradientActive,
        surfaceDefaultPromoMinorGradientHover,
        surfaceDefaultSkeletonDeepGradient,
        surfaceDefaultSkeletonDeepGradientActive,
        surfaceDefaultSkeletonDeepGradientHover,
        surfaceDefaultSkeletonGradient,
        surfaceDefaultSkeletonGradientActive,
        surfaceDefaultSkeletonGradientHover,
        surfaceDefaultTransparentAccentGradient,
        surfaceDefaultTransparentAccentGradientActive,
        surfaceDefaultTransparentAccentGradientHover,
        surfaceDefaultTransparentPromoGradient,
        surfaceDefaultTransparentPromoGradientActive,
        surfaceDefaultTransparentPromoGradientHover,
        surfaceInverseAccentGradient,
        surfaceInverseAccentGradientActive,
        surfaceInverseAccentGradientHover,
        surfaceInverseAccentMinorGradient,
        surfaceInverseAccentMinorGradientActive,
        surfaceInverseAccentMinorGradientHover,
        surfaceInversePromoGradient,
        surfaceInversePromoGradientActive,
        surfaceInversePromoGradientHover,
        surfaceInversePromoMinorGradient,
        surfaceInversePromoMinorGradientActive,
        surfaceInversePromoMinorGradientHover,
        surfaceInverseSkeletonDeepGradient,
        surfaceInverseSkeletonDeepGradientActive,
        surfaceInverseSkeletonDeepGradientHover,
        surfaceInverseSkeletonGradient,
        surfaceInverseSkeletonGradientActive,
        surfaceInverseSkeletonGradientHover,
        surfaceInverseTransparentAccentGradient,
        surfaceInverseTransparentAccentGradientActive,
        surfaceInverseTransparentAccentGradientHover,
        surfaceInverseTransparentPromoGradient,
        surfaceInverseTransparentPromoGradientActive,
        surfaceInverseTransparentPromoGradientHover,
        surfaceOnDarkAccentGradient,
        surfaceOnDarkAccentGradientActive,
        surfaceOnDarkAccentGradientHover,
        surfaceOnDarkAccentMinorGradient,
        surfaceOnDarkAccentMinorGradientActive,
        surfaceOnDarkAccentMinorGradientHover,
        surfaceOnDarkPromoGradient,
        surfaceOnDarkPromoGradientActive,
        surfaceOnDarkPromoGradientHover,
        surfaceOnDarkPromoMinorGradient,
        surfaceOnDarkPromoMinorGradientActive,
        surfaceOnDarkPromoMinorGradientHover,
        surfaceOnDarkSkeletonDeepGradient,
        surfaceOnDarkSkeletonDeepGradientActive,
        surfaceOnDarkSkeletonDeepGradientHover,
        surfaceOnDarkSkeletonGradient,
        surfaceOnDarkSkeletonGradientActive,
        surfaceOnDarkSkeletonGradientHover,
        surfaceOnDarkTransparentAccentGradient,
        surfaceOnDarkTransparentAccentGradientActive,
        surfaceOnDarkTransparentAccentGradientHover,
        surfaceOnDarkTransparentPromoGradient,
        surfaceOnDarkTransparentPromoGradientActive,
        surfaceOnDarkTransparentPromoGradientHover,
        surfaceOnLightAccentGradient,
        surfaceOnLightAccentGradientActive,
        surfaceOnLightAccentGradientHover,
        surfaceOnLightAccentMinorGradient,
        surfaceOnLightAccentMinorGradientActive,
        surfaceOnLightAccentMinorGradientHover,
        surfaceOnLightPromoGradient,
        surfaceOnLightPromoGradientActive,
        surfaceOnLightPromoGradientHover,
        surfaceOnLightPromoMinorGradient,
        surfaceOnLightPromoMinorGradientActive,
        surfaceOnLightPromoMinorGradientHover,
        surfaceOnLightSkeletonDeepGradient,
        surfaceOnLightSkeletonDeepGradientActive,
        surfaceOnLightSkeletonDeepGradientHover,
        surfaceOnLightSkeletonGradient,
        surfaceOnLightSkeletonGradientActive,
        surfaceOnLightSkeletonGradientHover,
        surfaceOnLightTransparentAccentGradient,
        surfaceOnLightTransparentAccentGradientActive,
        surfaceOnLightTransparentAccentGradientHover,
        surfaceOnLightTransparentPromoGradient,
        surfaceOnLightTransparentPromoGradientActive,
        surfaceOnLightTransparentPromoGradientHover,
        textDefaultAccentGradient,
        textDefaultAccentGradientActive,
        textDefaultAccentGradientHover,
        textDefaultAccentMinorGradient,
        textDefaultAccentMinorGradientActive,
        textDefaultAccentMinorGradientHover,
        textDefaultPromoGradient,
        textDefaultPromoGradientActive,
        textDefaultPromoGradientHover,
        textDefaultPromoMinorGradient,
        textDefaultPromoMinorGradientActive,
        textDefaultPromoMinorGradientHover,
        textDefaultTransparentAccentGradient,
        textDefaultTransparentAccentGradientActive,
        textDefaultTransparentAccentGradientHover,
        textInverseAccentGradient,
        textInverseAccentGradientActive,
        textInverseAccentGradientHover,
        textInverseAccentMinorGradient,
        textInverseAccentMinorGradientActive,
        textInverseAccentMinorGradientHover,
        textInversePromoGradient,
        textInversePromoGradientActive,
        textInversePromoGradientHover,
        textInversePromoMinorGradient,
        textInversePromoMinorGradientActive,
        textInversePromoMinorGradientHover,
        textInverseTransparentAccentGradient,
        textInverseTransparentAccentGradientActive,
        textInverseTransparentAccentGradientHover,
        textOnDarkAccentGradient,
        textOnDarkAccentGradientActive,
        textOnDarkAccentGradientHover,
        textOnDarkAccentMinorGradient,
        textOnDarkAccentMinorGradientActive,
        textOnDarkAccentMinorGradientHover,
        textOnDarkPromoGradient,
        textOnDarkPromoGradientActive,
        textOnDarkPromoGradientHover,
        textOnDarkPromoMinorGradient,
        textOnDarkPromoMinorGradientActive,
        textOnDarkPromoMinorGradientHover,
        textOnDarkTransparentAccentGradient,
        textOnDarkTransparentAccentGradientActive,
        textOnDarkTransparentAccentGradientHover,
        textOnLightAccentGradient,
        textOnLightAccentGradientActive,
        textOnLightAccentGradientHover,
        textOnLightAccentMinorGradient,
        textOnLightAccentMinorGradientActive,
        textOnLightAccentMinorGradientHover,
        textOnLightPromoGradient,
        textOnLightPromoGradientActive,
        textOnLightPromoGradientHover,
        textOnLightPromoMinorGradient,
        textOnLightPromoMinorGradientActive,
        textOnLightPromoMinorGradientHover,
        textOnLightTransparentAccentGradient,
        textOnLightTransparentAccentGradientActive,
        textOnLightTransparentAccentGradientHover,
    ]
}
