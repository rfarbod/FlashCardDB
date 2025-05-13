//
//  FlashCardError.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

enum FlashCardError: Error {
    case invalidJSONPath
    case decodingFailed
    case invalidContext
    case invalidQueryResult
}
