import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct SegmentView: View {
    @ObservedObject private var viewModel: SegmentViewModel = SegmentViewModel()
    
    var body: some View {
        List {
            Section {
                segment
            }
            Section(header: Text("Segment")) {
                VariationsView(viewModel: viewModel)
                stackOrientation
                strech
                background
                isDisabled
            }
            Section(header: Text("Add Segment Element")) {
                value
                helperText
                icon
                iconAlignment
                Group {
                    counter
                }
                addSingleItem
            }
            Section {
                maxElementsAdditionalWindow
            }
        }
        .onAppear {
            viewModel.updateAppearance()
        }
    }
    
    // MARK: - Segment Element
    
    @ViewBuilder
    private var value: some View {
        HStack {
            Text("Value")
            TextField("Value", text: $viewModel.value)
                .multilineTextAlignment(.trailing)
        }
    }
    
    @ViewBuilder
    private var helperText: some View {
        HStack {
            Text("Helper Text")
            TextField("Helper Text", text: $viewModel.helperText)
                .multilineTextAlignment(.trailing)
        }
    }
    
    @ViewBuilder
    private var icon: some View {
        HStack {
            Toggle("Icon", isOn: $viewModel.isIconVisible)
        }
    }
    
    @ViewBuilder
    private var iconAlignment: some View {
        HStack {
            Text("Icon Alignment")
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
    
    @ViewBuilder
    private var strech: some View {
        HStack {
            Toggle("Strech", isOn: $viewModel.stretch)
        }
    }
    
    
    @ViewBuilder
    private var segment: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                SDDSSegment(
                    items: viewModel.data,
                    appearance: viewModel.appearance,
                    layoutOrientation: viewModel.layoutOrientation,
                    selectedItemId: $viewModel.selectedItemId,
                    isDisabled: viewModel.isDisabled,
                    stretch: viewModel.stretch,
                    hasBackground: viewModel.hasBackground
                )
            }
            .frame(width: geometry.size.width)
        }
        .frame(height: viewModel.segmentHeight)
    }
        
    @ViewBuilder
    private var isDisabled: some View {
        HStack {
            Toggle("Disabled", isOn: $viewModel.isDisabled)
        }
    }
    
    @ViewBuilder
    private var counter: some View {
        Group {
            HStack {
                Toggle("Counter", isOn: $viewModel.isCounterVisible)
            }
            if viewModel.isCounterVisible {
                counterText
            }
        }
    }
    
    @ViewBuilder
    private var stackOrientation: some View {
        HStack {
            Picker("Stack orientation", selection: $viewModel.layoutOrientation) {
                ForEach(SegmentLayoutOrientation.allCases, id: \.self) { orientation in
                    Text(orientation.rawValue)
                }
            }
        }
    }
    
    @ViewBuilder
    private var addSingleItem: some View {
        HStack {
            Button("Add item") {
                viewModel.addItem()
            }
        }
    }
    
    @ViewBuilder
    private var maxElementsAdditionalWindow: some View {
        ForEach(viewModel.data.indices, id: \.self) { index in
            HStack {
                Text(viewModel.data[index].title)
                Spacer()
                Button("Delete") {
                    let id = viewModel.data[index].id
                    viewModel.removeItem(id: id)
                }
                .foregroundColor(.red)
            }
        }
    }
        
    @ViewBuilder
    private var background: some View {
        HStack {
            Toggle("Has Background", isOn: $viewModel.hasBackground)
        }
    }
    
    @ViewBuilder
    private var counterText: some View {
        HStack {
            Text("Counter data")
            TextField("Number", text: $viewModel.counterText)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    SegmentView()
}