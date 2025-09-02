import SwiftUI
import SDDSComponents
import SDDSservTheme

struct TooltipView: View {
    @ObservedObject private var viewModel: TooltipViewModel = TooltipViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var isTooltipPresented = false
    
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
                isTooltipPresented = false
            }
            
            Section {
                buttonPositionView
                placementSelectionView
                alignmentSelectionView
                textField
                VariationsView(viewModel: viewModel)
                contentStartToggle
                autoHideToggle
                tailEnabledToggle
                triggerCenteredToggle
                placementModeSelectionView
            }
        }
        .navigationTitle("Tooltip")
    }
    
    private var duration: TimeInterval? {
        viewModel.autoHide ? 3.0 : nil
    }
    
    private var width: CGFloat? {
        nil
    }
    
    @ViewBuilder
    private var tooltipContent: some View {
        if viewModel.contentStartEnabled {
            Image("plasma")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func buttonForPosition(_ position: PopoverButtonPosition) -> some View {
        switch position {
        case .topLeft:
            VStack {
                HStack {
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        presentTooltip()
                    }
                    .tooltip(
                        isPresented: $isTooltipPresented,
                        appearance: viewModel.appearance,
                        width: width,
                        text: viewModel.text,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        contentStart: { tooltipContent }
                    )
                    .padding(.top, containerPadding)
                    Spacer()
                }
                Spacer()
            }
        case .topCenter:
            VStack {
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        presentTooltip()
                    }
                    .tooltip(
                        isPresented: $isTooltipPresented,
                        appearance: viewModel.appearance,
                        width: width,
                        text: viewModel.text,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        contentStart: { tooltipContent }
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
                        presentTooltip()
                    }
                    .tooltip(
                        isPresented: $isTooltipPresented,
                        appearance: viewModel.appearance,
                        width: width,
                        text: viewModel.text,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        contentStart: { tooltipContent }
                    )
                    .padding(.top, containerPadding)
                }
                Spacer()
            }
        case .centerLeft:
            HStack {
                BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    presentTooltip()
                }
                .tooltip(
                    isPresented: $isTooltipPresented,
                    appearance: viewModel.appearance,
                    width: width,
                    text: viewModel.text,
                    placement: viewModel.placement,
                    alignment: viewModel.alignment,
                    tailEnabled: viewModel.tailEnabled,
                    triggerCentered: viewModel.triggerCentered,
                    placementMode: viewModel.placementMode,
                    duration: duration,
                    contentStart: { tooltipContent }
                )
                Spacer()
            }
        case .center:
            HStack {
                Spacer()
                BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    presentTooltip()
                }
                .tooltip(
                    isPresented: $isTooltipPresented,
                    appearance: viewModel.appearance,
                    width: width,
                    text: viewModel.text,
                    placement: viewModel.placement,
                    alignment: viewModel.alignment,
                    tailEnabled: viewModel.tailEnabled,
                    triggerCentered: viewModel.triggerCentered,
                    placementMode: viewModel.placementMode,
                    duration: duration,
                    contentStart: { tooltipContent }
                )
                Spacer()
            }
        case .centerRight:
            HStack {
                Spacer()
                BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                    presentTooltip()
                }
                .tooltip(
                    isPresented: $isTooltipPresented,
                    appearance: viewModel.appearance,
                    width: width,
                    text: viewModel.text,
                    placement: viewModel.placement,
                    alignment: viewModel.alignment,
                    tailEnabled: viewModel.tailEnabled,
                    triggerCentered: viewModel.triggerCentered,
                    placementMode: viewModel.placementMode,
                    duration: duration,
                    contentStart: { tooltipContent }
                )
            }
        case .bottomLeft:
            VStack {
                Spacer()
                HStack {
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        presentTooltip()
                    }
                    .tooltip(
                        isPresented: $isTooltipPresented,
                        appearance: viewModel.appearance,
                        width: width,
                        text: viewModel.text,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        contentStart: { tooltipContent }
                    )
                    .padding(.bottom, containerPadding)
                    Spacer()
                }
            }
        case .bottomCenter:
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    BasicButton(title: "Show", subtitle: "", appearance: BasicButton.m.accent.appearance) {
                        presentTooltip()
                    }
                    .tooltip(
                        isPresented: $isTooltipPresented,
                        appearance: viewModel.appearance,
                        width: width,
                        text: viewModel.text,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        contentStart: { tooltipContent }
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
                        presentTooltip()
                    }
                    .tooltip(
                        isPresented: $isTooltipPresented,
                        appearance: viewModel.appearance,
                        width: width,
                        text: viewModel.text,
                        placement: viewModel.placement,
                        alignment: viewModel.alignment,
                        tailEnabled: viewModel.tailEnabled,
                        triggerCentered: viewModel.triggerCentered,
                        placementMode: viewModel.placementMode,
                        duration: duration,
                        contentStart: { tooltipContent }
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
    
    private var contentStartToggle: some View {
        Toggle("Content Start Enabled", isOn: $viewModel.contentStartEnabled)
    }
    
    private var tailEnabledToggle: some View {
        Toggle("Tail Enabled", isOn: $viewModel.tailEnabled)
    }
    
    private var triggerCenteredToggle: some View {
        Toggle("Trigger Centered", isOn: $viewModel.triggerCentered)
    }
    
    private var textField: some View {
        TextField("Text", text: $viewModel.text)
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
    
    private var containerPadding: CGFloat {
        24.0
    }
    
    private func presentTooltip() {
        guard !viewModel.text.isEmpty || viewModel.contentStartEnabled else {
            return
        }
        isTooltipPresented = true
    }
}

#Preview {
    NavigationView {
        TooltipView()
    }
}
