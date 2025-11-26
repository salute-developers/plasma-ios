import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme
import SDDSIcons

struct AccordionView: View {
    @ObservedObject private var viewModel: AccordionViewModel
    
    init() {
        self.viewModel = AccordionViewModel()
    }
    
    var body: some View {
        VStack {
            SDDSAccordion(
                items: viewModel.accordionItems,
                showDividers: viewModel.canChangeDividers ? viewModel.showDividers : false,
                appearance: viewModel.appearance
            )
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
            List {
                Section {
                    Picker("Layout", selection: $viewModel.layout) {
                        ForEach(AccordionLayout.allCases, id: \.self) { layout in
                            Text(layout.rawValue).tag(layout)
                        }
                    }
                    VariationsView(viewModel: viewModel)
                    VStack {
                        HStack {
                            Text("Title")
                            Spacer()
                            TextField("Title", text: $viewModel.title)
                                .multilineTextAlignment(.trailing)
                        }
                        HStack {
                            Text("Content")
                            Spacer()
                            TextField("Content", text: $viewModel.content, axis: .vertical)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(3...6)
                        }
                        HStack {
                            Text("Items Count")
                            Spacer()
                            TextField("Count", value: $viewModel.itemsCount, format: .number)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.numberPad)
                        }
                        if viewModel.canChangeDividers {
                            HStack {
                                Text("Show Dividers")
                                Spacer()
                                Toggle("", isOn: $viewModel.showDividers)
                            }
                        }
                    }
                }
            }
            .environment(\.subtheme, viewModel.theme.subtheme(viewModel.subtheme))
            
        }
        .background(.tertiary)
    }
}

#Preview {
    AccordionView()
} 
