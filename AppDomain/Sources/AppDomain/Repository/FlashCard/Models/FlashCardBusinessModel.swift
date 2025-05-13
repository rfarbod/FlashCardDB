//
//  FlashCardBusinessModel.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

public struct FlashCardBusinessModel: Identifiable, Codable {
    public let id: String
    public let word: String
    public let meaning: String
    
    public init(
        id: String,
        word: String,
        meaning: String
    ) {
        self.id = id
        self.word = word
        self.meaning = meaning
    }
}
