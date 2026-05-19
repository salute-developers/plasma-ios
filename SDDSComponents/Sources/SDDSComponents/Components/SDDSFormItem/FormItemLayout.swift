import SwiftUI

struct FormItemLayout: View {
    let topTextAlignment: FormTextAlignment
    let bottomTextAlignment: FormTextAlignment
    let startTitle: AnyView?
    let endTitle: AnyView?
    let topTitle: AnyView?
    let titleCaption: AnyView?
    let caption: AnyView?
    let counter: AnyView?
    let content: AnyView

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if let startTitle {
                startTitle
            }

            VStack(alignment: .leading, spacing: 0) {
                topBlock
                content
                bottomBlock
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if let endTitle {
                endTitle
            }
        }
    }

    @ViewBuilder
    private var topBlock: some View {
        switch topTextAlignment {
        case .center:
            VStack(alignment: .center, spacing: 0) {
                topTitle
                titleCaption
            }
            .frame(maxWidth: .infinity)
        case .edge:
            HStack(alignment: .bottom, spacing: 0) {
                topTitle
                Spacer(minLength: 0)
                titleCaption
            }
        }
    }

    @ViewBuilder
    private var bottomBlock: some View {
        switch bottomTextAlignment {
        case .center:
            VStack(alignment: .center, spacing: 0) {
                caption
                counter
            }
            .frame(maxWidth: .infinity)
        case .edge:
            HStack(alignment: .top, spacing: 0) {
                caption
                Spacer(minLength: 0)
                counter
            }
        }
    }
}
