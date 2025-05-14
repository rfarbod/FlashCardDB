//
//  FlashCardBusinessModel.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

public struct FlashCardBusinessModel: Sendable, Identifiable, Codable {
    public let id: String
    public let word: String
    public let meaning: String
    public let isCorrect: Bool?
    
    public init(
        id: String,
        word: String,
        meaning: String,
        isCorrect: Bool?
    ) {
        self.id = id
        self.word = word
        self.meaning = meaning
        self.isCorrect = isCorrect
    }
}
