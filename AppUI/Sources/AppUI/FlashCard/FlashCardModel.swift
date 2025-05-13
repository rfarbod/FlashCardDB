//
//  FlashCardViewModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import Foundation

public struct FlashCardModel: Identifiable, Equatable {
    let id: String
    let word: String
    let meaning: String
    
    init(
        id: String,
        word: String,
        meaning: String
    ) {
        self.id = id
        self.word = word
        self.meaning = meaning
    }
}
