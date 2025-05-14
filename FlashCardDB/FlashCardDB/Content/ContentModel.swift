//
//  ContentModel.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import AppUI
import Foundation

struct ContentModel {
    var flashCards: [FlashCardModel]
    var xp: Int
    var topIndex: Int
    var correctAnswers: Int
    
    init(
        flashCards: [FlashCardModel] = [],
        xp: Int = 0,
        topIndex: Int = 0,
        correctAnswers: Int = 0
    ) {
        self.flashCards = flashCards
        self.xp = xp
        self.topIndex = topIndex
        self.correctAnswers = correctAnswers
    }
}
