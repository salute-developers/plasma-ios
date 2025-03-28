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
                selected
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
                counterEnabled: viewModel.isCounterVisible,
                appearance: viewModel.appearance,
                counterViewProvider: .default(text: viewModel.counterViewModel.text),
                action: {}
            )
            Spacer()
        }
    }

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
        }
    }
    
    public var selected: some View {
        HStack {
            Toggle("Selected", isOn: $viewModel.isSelected)
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
        }
    }
}

#Preview {
    SegmentItemView()
}
