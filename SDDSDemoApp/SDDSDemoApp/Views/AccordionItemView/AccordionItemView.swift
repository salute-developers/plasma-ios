import SwiftUI
import SDDSComponents
import SDDSservTheme
import SDDSIcons

struct AccordionItemView: View {
    @ObservedObject private var viewModel: AccordionItemViewModel
    
    init() {
        self.viewModel = AccordionItemViewModel()
    }
    
    var body: some View {
        VStack {
            SDDSAccordionItem(
                title: viewModel.title,
                content: viewModel.content,
                isExpanded: viewModel.isExpanded,
                appearance: viewModel.appearance,
                onToggle: { isExpanded in
                    print("AccordionItem \(isExpanded ? "развернут" : "свернут")")
                }
            )
            
            Spacer()
            List {
                Section {
                    Picker("Layout", selection: $viewModel.layout) {
                        ForEach(AccordionItemLayout.allCases, id: \.self) { layout in
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
                            Text("Expanded")
                            Spacer()
                            Toggle("", isOn: $viewModel.isExpanded)
                        }
                    }
                }
            }
        }
        .background(.tertiary)
    }
}

#Preview {
    AccordionItemView()
} 
