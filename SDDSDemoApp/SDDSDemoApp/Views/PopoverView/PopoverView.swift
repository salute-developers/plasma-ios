import SwiftUI
import SDDSComponents

enum PopoverButtonPosition: String, CaseIterable, Identifiable {
    case center = "Center"
    case topLeft = "Top Left"
    case topRight = "Top Right"
    case bottomLeft = "Bottom Left"
    case bottomRight = "Bottom Right"
    
    var id: String { self.rawValue }
}

struct PopoverView: View {
    @ObservedObject private var viewModel: PopoverViewModel = PopoverViewModel()
    @Environment(\.colorScheme) private var colorScheme
    @State private var isPopoverPresented = false
    @State private var buttonPosition: PopoverButtonPosition = .center
    
    var body: some View {
        VStack {
            Picker("Button Position", selection: $buttonPosition) {
                ForEach(PopoverButtonPosition.allCases) { pos in
                    Text(pos.rawValue).tag(pos)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Spacer()
            ZStack {
                switch buttonPosition {
                case .center:
                    popoverButton
                case .topLeft:
                    VStack {
                        HStack {
                            popoverButton
                            Spacer()
                        }
                        Spacer()
                    }
                case .topRight:
                    VStack {
                        HStack {
                            Spacer()
                            popoverButton
                        }
                        Spacer()
                    }
                case .bottomLeft:
                    VStack {
                        Spacer()
                        HStack {
                            popoverButton
                            Spacer()
                        }
                    }
                case .bottomRight:
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            popoverButton
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("Popover")
    }
    
    private var popoverButton: some View {
        Button("Open") {
            isPopoverPresented = true
        }
        .popoverWithTail(isPresented: $isPopoverPresented, appearance: viewModel.appearance) {
            Label("Hello World", systemImage: "star")
                .padding()
        }
    }
}

#Preview {
    PopoverView()
} 