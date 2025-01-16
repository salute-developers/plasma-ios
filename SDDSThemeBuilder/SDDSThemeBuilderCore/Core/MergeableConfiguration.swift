import Foundation

protocol MergeableConfiguration: Codable {
    associatedtype Props: Codable
    
    func merge(rhs: Props) -> Props
}

extension MergeableConfiguration {
    func merge(rhs: Props) -> Props {
        do {
            let lhsData = try JSONEncoder().encode(self)
            let rhsData = try JSONEncoder().encode(rhs)

            let lhsDict = try JSONSerialization.jsonObject(with: lhsData, options: []) as! [String: Any?]
            let rhsDict = try JSONSerialization.jsonObject(with: rhsData, options: []) as! [String: Any?]

            let mergedDict = lhsDict.merging(rhsDict) { lhs, rhs in
                return lhs ?? rhs
            }

            let mergedData = try JSONSerialization.data(withJSONObject: mergedDict, options: [])

            return try JSONDecoder().decode(Props.self, from: mergedData)
        } catch {
            print(error)
            return rhs
        }
    }
}
