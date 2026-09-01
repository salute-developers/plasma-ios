import Foundation

struct AvatarGroupProps: MergeableConfiguration, Codable {
    typealias Props = AvatarGroupProps
    
    var itemOffset: KeyValue<Double>?
    var itemSpacing: KeyValue<Double>?
    var avatarStyle: KeyValue<String>?
}
