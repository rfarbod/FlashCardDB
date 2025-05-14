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
    var topIndex: Int
    
    init(
        flashCards: [FlashCardModel] = [],
        topIndex: Int = 0
    ) {
        self.flashCards = flashCards
        self.topIndex = topIndex
    }
}
