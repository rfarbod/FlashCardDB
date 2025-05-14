//
//  FlashCardSwiftDataModel.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftData

@Model
public final class FlashCardSwiftDataModel: Identifiable {
    @Attribute(.unique)
    public var id: String
    public var word: String
    public var meaning: String
    public var isCorrect: Bool?
    
    public init(
        id: String,
        word: String,
        meaning: String,
        isCorrect: Bool? = nil
    ) {
        self.id = id
        self.word = word
        self.meaning = meaning
        self.isCorrect = isCorrect
    }
}
