//
//  ContentView.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import AppUI
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject private var viewModel: ContentViewModel
    
    public init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            ForEach(Array(viewModel.model.flashCards.enumerated()), id: \.element.id) { idx, card in
                if idx >= viewModel.model.topIndex {
                    FlashCardView(model: card)
                        .frame(width: 300, height: 450)
                        .offset(x: 0, y: CGFloat(idx - viewModel.model.topIndex) * 20)
                        .scaleEffect(1 - CGFloat(idx - viewModel.model.topIndex) * 0.03)
                        .zIndex(Double(viewModel.model.flashCards.count - idx))
                        .animation(.easeInOut, value: viewModel.model.topIndex)
                }
            }
        }
        .onAppear {
            viewModel.getItems()
        }
    }
}
