import Foundation
import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

public struct SegmentItemView: View {
    @ObservedObject private var viewModel: SegmentItemViewModel = SegmentItemViewModel()
    
    public var body: some View {
        List {
            segmentView
            Section(header: Text("SegmentItem")) {
                VariationsView(viewModel: viewModel)
                title
                subtitle
                iconVisible
                counter
                alignment
                disabled
            }
        }
    }
    
    public var segmentView: some View {
        HStack {
            Spacer()
            SDDSSegmentItem(
                title: viewModel.title,
                subtitle: viewModel.subtitle,
                iconAttributes: viewModel.iconAttributes,
                isDisabled: viewModel.isDisabled,
                isSelected: viewModel.isSelected,
<<<<<<< HEAD
                counterEnabled: viewModel.isCounterVisible,
=======
                counterEnabled: viewModel.counterEnabled,
>>>>>>> 7e47872f (feat: added multiple themes support)
                appearance: viewModel.appearance,
                counterViewProvider: .default(text: viewModel.counterViewModel.text),
                action: {}
            )
            Spacer()
        }
    }
<<<<<<< HEAD
        
=======
    
    public var segmentItemType: some View {
        HStack {
            Text("Content Type")
            Spacer()
            Menu {
                ForEach(SegmentItemContentType.allCases, id: \.self) { content in
                    Button {
                        viewModel.contentType = content
                    } label: {
                        Text(content.rawValue.capitalized)
                    }
                }
            } label: {
                Text(viewModel.contentType.rawValue.capitalized)
            }
        }
    }
    
>>>>>>> 7e47872f (feat: added multiple themes support)
    public var title: some View {
        HStack {
            Text("Title")
            TextField("Title", text: $viewModel.title)
                .multilineTextAlignment(.trailing)
        }
    }
    
    public var subtitle: some View {
        HStack {
            Text("Value")
            TextField("Subtitle", text: $viewModel.subtitle)
                .multilineTextAlignment(.trailing)
        }
    }
    
    public var alignment: some View {
        HStack {
            Text("icon Alignment")
            Spacer()
            Menu {
                ForEach(ButtonAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue)
            }
        }
    }
    
    public var disabled: some View {
        HStack {
            Toggle("Disabled", isOn: $viewModel.isDisabled)
        }
    }
    
    public var iconVisible: some View {
        HStack {
            Toggle("Icon Visible", isOn: $viewModel.iconVisible)
<<<<<<< HEAD
        }
    }
    
    @ViewBuilder
    private var counter: some View {
        Group {
            HStack {
                Toggle("Counter", isOn: $viewModel.isCounterVisible)
            }
            HStack {
                Text("Counter data")
                TextField("Number", text: $viewModel.counterViewModel.text)
                    .multilineTextAlignment(.trailing)
            }
=======
>>>>>>> 7e47872f (feat: added multiple themes support)
        }
    }

}

#Preview {
    SegmentItemView()
}
