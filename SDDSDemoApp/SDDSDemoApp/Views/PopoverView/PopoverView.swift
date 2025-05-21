import SwiftUI
import SDDSComponents
import SDDSServTheme

struct PopoverView: View {
    @ObservedObject private var viewModel: PopoverViewModel = PopoverViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var isPopoverPresented = false
    
    var body: some View {
        List {
            Section {
                buttonForPosition(viewModel.buttonPosition)
                    .padding()
            }
            .frame(height: 300)
            .background(Color(.white))
            .listRowInsets(.init())
            .onTapGesture {
                isPopoverPresented = false
            }
            
            Section {
                buttonPositionView
                placementSelectionView
                alignmentSelectionView
                VariationsView(viewModel: viewModel)
                autoHideToggle
                tailEnabledToggle
                triggerCenteredToggle
                placementModeSelectionView
                durationSelectionView
            }
        }
        .navigationTitle("Popover")
    }
    
    private var duration: TimeInterval? {
        viewModel.autoHide ? 3.0 : nil
    }
    
    @ViewBuilder
    private var popoverContent: some View {
        VStack(spacing: 8) {
            HStack {
                Spacer()
                Text("Text")
                    .font(.headline)
                Spacer()
            }
            HStack {
                Spacer()
                BasicButton(title: "Close", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    isPopoverPresented = false
                }
                Spacer()
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func buttonForPosition(_ position: PopoverButtonPosition) -> some View {
        switch position {
        case .topLeft:
            VStack {
                HStack {
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isPopoverPresented = true
                    }
                    .popover(
                        isPresented: $isPopoverPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        content: { popoverContent }
                    )
                    .padding(.top, containerPadding)
                    Spacer()
                }
                Spacer()
            }
        case .topRight:
            VStack {
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isPopoverPresented = true
                    }
                    .popover(
                        isPresented: $isPopoverPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        content: { popoverContent }
                    )
                    .padding(.top, containerPadding)
                }
                Spacer()
            }

        case .center:
            HStack {
                Spacer()
                BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    isPopoverPresented = true
                }
                .popover(
                    isPresented: $isPopoverPresented,
                    appearance: viewModel.appearance,
                    placement: viewModel.placement,
                    alignment: viewModel.alignment,
                    tailEnabled: viewModel.tailEnabled,
                    triggerCentered: viewModel.triggerCentered,
                    placementMode: viewModel.placementMode,
                    duration: duration,
                    content: { popoverContent }
                )
                Spacer()
            }
        case .bottomLeft:
            VStack {
                Spacer()
                HStack {
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isPopoverPresented = true
                    }
                    .popover(
                        isPresented: $isPopoverPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        content: { popoverContent }
                    )
                    .padding(.bottom, containerPadding)
                    Spacer()
                }
            }
        case .bottomRight:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        isPopoverPresented = true
                    }
                    .popover(
                        isPresented: $isPopoverPresented,
                        appearance: viewModel.appearance,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        content: { popoverContent }
                    )
                    .padding(.bottom, containerPadding)
                }
            }
        }
    }
    
    private var placementSelectionView: some View {
        HStack {
            Text("Placement")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverPlacement.allCases, id: \.self) { placement in
                    Button(placement.rawValue) {
                        viewModel.placement = placement
                    }
                }
            } label: {
                Text(viewModel.placement.rawValue)
            }
        }
    }
    
    private var buttonPositionView: some View {
        HStack {
            Text("Button Position")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverButtonPosition.allCases, id: \.self) { position in
                    Button(position.rawValue) {
                        viewModel.buttonPosition = position
                    }
                }
            } label: {
                Text(viewModel.buttonPosition.rawValue)
            }
        }
    }
    
    private var alignmentSelectionView: some View {
        HStack {
            Text("Alignment")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverAlignment.allCases, id: \.self) { alignment in
                    Button(alignment.rawValue.capitalized) {
                        viewModel.alignment = alignment
                    }
                }
            } label: {
                Text(viewModel.alignment.rawValue.capitalized)
            }
        }
    }
    
    private var autoHideToggle: some View {
        Toggle("Auto Hide", isOn: $viewModel.autoHide)
    }
    
    private var tailEnabledToggle: some View {
        Toggle("Tail Enabled", isOn: $viewModel.tailEnabled)
    }
    
    private var triggerCenteredToggle: some View {
        Toggle("Trigger Centered", isOn: $viewModel.triggerCentered)
    }
    
    private var placementModeSelectionView: some View {
        HStack {
            Text("Placement Mode")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                ForEach(PopoverPlacementMode.allCases, id: \.self) { mode in
                    Button(mode.rawValue.capitalized) {
                        viewModel.placementMode = mode
                    }
                }
            } label: {
                Text(viewModel.placementMode.rawValue.capitalized)
            }
        }
    }
    
    private var durationSelectionView: some View {
        HStack {
            Text("Duration")
            Spacer()
                .frame(maxWidth: .infinity)
            Menu {
                Button("None") {
                    viewModel.duration = nil
                }
                Button("1 second") {
                    viewModel.duration = 1000
                }
                Button("3 seconds") {
                    viewModel.duration = 3000
                }
                Button("5 seconds") {
                    viewModel.duration = 5000
                }
            } label: {
                Text(viewModel.duration.map { "\($0/1000) seconds" } ?? "None")
            }
        }
    }
    
    private var containerPadding: CGFloat {
        24.0
    }
}

#Preview {
    NavigationView {
        PopoverView()
    }
} 
