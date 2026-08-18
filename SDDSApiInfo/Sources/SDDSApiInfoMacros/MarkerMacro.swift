import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxMacros

public struct MarkerMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] { [] }
}

@main
struct SDDSApiInfoPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [MarkerMacro.self]
}
