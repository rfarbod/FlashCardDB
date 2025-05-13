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
    
    init(
        flashCards: [FlashCardModel] = []
    ) {
        self.flashCards = flashCards
    }
}
