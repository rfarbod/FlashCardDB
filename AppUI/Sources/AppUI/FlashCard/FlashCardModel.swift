//
//  FlashCardModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import Foundation
import SwiftUI

public struct FlashCardModel: Identifiable {
    public let id: String
    public let word: String
    public let meaning: String
    public let color: Color
    
    init(
        id: String,
        word: String,
        meaning: String,
        color: Color
    ) {
        self.id = id
        self.word = word
        self.meaning = meaning
        self.color = color
    }
}
