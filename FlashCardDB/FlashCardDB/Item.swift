//
//  Item.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
