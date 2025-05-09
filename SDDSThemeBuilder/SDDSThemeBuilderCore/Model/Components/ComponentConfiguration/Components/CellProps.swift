import Foundation

struct CellProps: MergeableConfiguration, Codable {
    typealias Props = CellProps
    
    var contentPaddingStart: KeyValue<Double>?
    var contentPaddingEnd: KeyValue<Double>?
    var labelStyle: KeyValue<String>?
    var titleStyle: KeyValue<String>?
    var subtitleStyle: KeyValue<String>?
    var disclosureTextStyle: KeyValue<String>?
    var avatarStyle: KeyValue<String>?
    var iconButtonStyle: KeyValue<String>?
    var checkBoxStyle: KeyValue<String>?
    var radioBoxStyle: KeyValue<String>?
    var switchStyle: KeyValue<String>?
    var disclosureIcon: KeyValue<String>?
    var labelColor: ColorKeyValue?
    var titleColor: ColorKeyValue?
    var subtitleColor: ColorKeyValue?
    var disclosureTextColor: ColorKeyValue?
    var disclosureIconColor: ColorKeyValue?
}
