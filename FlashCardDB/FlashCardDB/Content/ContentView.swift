//
//  ContentView.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import AppUI
import AppDomain
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject private var viewModel: ContentViewModel
    @State var isAdSheetPresented: Bool = false
    
    public init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Button {
                isAdSheetPresented.toggle()
            } label: {
                Text("Add words")
            }

            Text("Your XP: \(viewModel.model.xp)")
                .font(.headline)
                .onAppear {
                    viewModel.getXPPoints()
                }

            ZStack {
                ForEach(Array(viewModel.model.flashCards.enumerated()), id: \.element.id) { idx, card in
                    if idx >= viewModel.model.topIndex {
                        FlashCardView(model: card)
                            .frame(width: 300, height: 450)
                            .offset(x: 0, y: CGFloat(idx - viewModel.model.topIndex) * 15)
                            .scaleEffect(1 - CGFloat(idx - viewModel.model.topIndex) * 0.03)
                            .zIndex(Double(viewModel.model.flashCards.count - idx))
                            .animation(.default, value: viewModel.model.topIndex)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    ProgressView(
                        value: Double(viewModel.model.correctAnswers),
                        total: Double(viewModel.model.flashCards.count)
                    )
                    .padding()
                    .onAppear {
                        viewModel.getCorrectAnswersCount()
                    }
                }
            }
            .sheet(isPresented: $isAdSheetPresented, content: {
                AddView { model in
                    viewModel.addNewFlashCard(flashCard: model)
                }
            })
            .onAppear {
                viewModel.getItems()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ContentViewModel(
            repository: FlashCardJSONRepository(),
            xpRepository: XPUserDefaultsRepository()
        )
        
        return ContentView(viewModel: viewModel)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
