import Foundation
import SDDSApiInfo

/// Расположение кнопок навигации карусели.
public enum CarouselButtonsPlacement: String, CaseIterable, Codable {
    @ApiDefault
    case inner
    case outer
}
