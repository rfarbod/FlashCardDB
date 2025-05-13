//
//  FlashCardSwiftDataModel.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftData

@Model
public final class FlashCardSwiftDataModel: Identifiable {
    public var id: String
    public var word: String
    public var meaning: String
    
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
