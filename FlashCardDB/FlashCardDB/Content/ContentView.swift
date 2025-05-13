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
            ForEach(viewModel.model.flashCards) { flashCard in
                FlashCardView(model: flashCard)
            }
        }
    }
}
