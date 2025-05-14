//
//  XPSwiftDataRepository.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/14/25.
//

import Foundation

public final class XPUserDefaultsRepository: XPRepository {
    private let userDefaults: UserDefaults
    
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    public func getXP() -> Int {
        return userDefaults.integer(forKey: "xp")
    }
    
    public func addXP(points: Int) {
        let xp = userDefaults.integer(forKey: "xp") + points
        userDefaults.set(xp, forKey: "xp")
    }
    
    public func removeXP(points: Int) {
        let xp = userDefaults.integer(forKey: "xp") - points
        userDefaults.set(xp, forKey: "xp")
    }
}
